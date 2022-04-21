/**
 * @file ipk-sniffer.cpp
 * @author Juraj Novosad (xnovos13@stud.fot.vutbr.cz)
 * @brief Implementation of sniffer project
 * @version 1.0
 * 
 * @copyright Copyright (c) 2022
 * 
 */
#include <iostream>
#include <pcap.h>
#include <tuple>
#include <map>
#include <string>
#include <cerrno>
#include <memory>
#include <stdexcept>
#include <time.h>
#include <fstream>
#include <algorithm>
#include <vector>
#include <iomanip>
#include "./libs/double_key_map.h"
#include "./libs/cmd_params_c.h"
#include "./libs/frame_msgs.h"
#include "./libs/utils_fce.h"

#define ERR_MSG(where) "ERROR: raised error on " where "\n"

using namespace header_msgs;
/* -----------------------------------------------------------------*/

/**
 * @brief Function to parse arguments, calls functions to correctly initialize all arguments
 * 
 * @param cmd_options class representing possible arguments
 * @param arguments arguments from comand line wrapped in struct
 * @param options double key map object which holds argumentss strings with their flags
 * @return int 
 */
int parse_arguments(cmd_params_c *cmd_options, arg_struct_t *arguments, option_info_t &options){
    int retval = EXIT_SUCCESS;
    u_char flag = 0;
    bool done = false;
    while(arguments->cursor < arguments->argc){
        flag = options.get_val(arguments->argv[arguments->cursor]);
        switch(flag){
            case INTERFACE_FLAG:
                retval = interface_init(cmd_options, arguments);
                break;
            case PORT_FLAG:
                retval = port_init(cmd_options, arguments);
                break;
            case TCP_FLAG:
                retval = tcp_init(cmd_options);
                break;
            case UDP_FLAG:
                retval = udp_init(cmd_options);
                break;
            case ICMP_FLAG:
                retval = icmp_init(cmd_options);            
                break;
            case ARP_FLAG:
                retval = arp_init(cmd_options);
                break;
            case N_FLAG:
                retval = count_init(cmd_options, arguments);
                break;
            case B_FLAG:
                retval = binary_data_init(cmd_options, arguments);
                break;
            default:
                stderr_line(ERR_WRONG_COMBINATION);
                done = true;
                retval = EXIT_FAILURE;
                break;
        }
        arguments->cursor++;
        if(done) break;
    }
    return retval;
}

/**
 * @brief Function to construct arguments and assign them respactive flag
 * 
 * @param option_info  double key array map, which is empty but initialized
 */
void construct_option_info(option_info_t &option_info){
    option_info.insert(std::make_tuple("-i", "--interface",    INTERFACE_FLAG));
    option_info.insert(std::make_tuple("-p", "--port",         PORT_FLAG));
    option_info.insert(std::make_tuple("-t", "--tcp",          TCP_FLAG));
    option_info.insert(std::make_tuple("-u", "--udp",          UDP_FLAG));
    option_info.insert(std::make_tuple("-c", "--icmp",         ICMP_FLAG));
    option_info.insert(std::make_tuple("-a", "--arp",          ARP_FLAG));
    option_info.insert(std::make_tuple("-n", "--count",        N_FLAG));
    option_info.insert(std::make_tuple("-b", "--binary",        B_FLAG));
}   


/* ----------------------------------------------------------------*/
/**
 * @brief prints address of a interface
 * 
 * @param socket 
 */
void _print_sockaddr(sockaddr *socket){
    if(socket == NULL) return;
    printf(SOCKADDR_MESSAGE.c_str(), (socket->sa_family == AF_INET6)? IPV6_NAME: IPV4_NAME, socket->sa_data);
    printf("\n");
}

/**
 * @brief Print informations about interface such as address, netmask, broadcast address
 * 
 * @param if_addr struct with information about interface
 */
void _print_pcap_addr_t(pcap_addr_t *if_addr){
    if(if_addr == NULL) return;
    printf("    --------\n");
    print_line(ADDRESS_MSG);
    _print_sockaddr(if_addr->addr);
    print_line(NETMASK_MSG);
    _print_sockaddr(if_addr->netmask);
    print_line(BROADCAST_MSG);
    _print_sockaddr(if_addr->broadaddr);
    print_line(DSTADDR_MSG);
    _print_sockaddr(if_addr->dstaddr);
    _print_pcap_addr_t(if_addr->next);
}

/**
 * @brief Prints verbose information about interface. 
 * V at the end of name means verbose
 * 
 * @param interface 
 */
void _print_interface_v(pcap_if_t *interface){
    if(interface == NULL) return;
    printf(INTERFACE_MESSAGE.c_str(), interface->name, interface->description); 
    _print_pcap_addr_t(interface->addresses);
    printf("------------------\n\n");
    _print_interface_v(interface->next);
}

/**
 * @brief Prints only name of interface, simplified alternation of function _print_interface_v
 * 
 * @param interface 
 */
void _print_interface(pcap_if_t *interface){
    if(interface == NULL) return;
    print_line(interface->name);
    _print_interface(interface->next); 
}

/**
 * @brief Function gets all interfaces available, them lets them print
 * 
 * @return int return value, whether it was succesfull
 */
int print_interfaces(){
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_if_t *interfaces;
    int errcode;
    if((errcode = pcap_findalldevs(&interfaces, errbuf))){
        printf(ERR_MSG("getting devices"));
        return EXIT_FAILURE;
    }
    _print_interface(interfaces);
    pcap_freealldevs(interfaces);
    return EXIT_SUCCESS;
}

//------------------------------
// Printing frames
// Next functions doesnt have their comment head, because name implies what they do

void print_tcp(const u_char *body){
    struct tcphdr *tcp_head = (struct tcphdr *) body;
    print_line(SRC_PORT_MSG + std::to_string(ntohs(tcp_head->th_sport)));
    print_line(DST_PORT_MSG  + std::to_string(ntohs(tcp_head->th_dport)));
    print_line(SEQ_NUM_MSG + std::to_string(htonl(tcp_head->th_seq)));
    print_line(ACK_NUM_MSG  + std::to_string(htonl(tcp_head->th_ack)));
    printf(FLAGS_TCP_MSG.c_str(), tcp_head->th_x2, tcp_head->th_flags);
}

void print_udp(const u_char *body){
    struct udphdr *udp_head = (struct udphdr *) body;
    print_line(SRC_PORT_MSG + std::to_string(ntohs(udp_head->uh_sport)));
    print_line(DST_PORT_MSG + std::to_string(ntohs(udp_head->uh_dport)));
    print_line(UDP_LEN_MSG + std::to_string(ntohs(udp_head->uh_ulen)));
}

void print_icmp_v4(const u_char *body){
    struct icmphdr *icmp_head = (struct icmphdr *) body;
    print_line(SEQ_NUM_MSG + std::to_string(icmp_head->un.echo.sequence));
    std::cout << TYPE_MSG;
    switch(icmp_head->type){
        case ICMP_ECHOREPLY:
            print_line(ICMP_ECHOREPLY_MSG);
            break;
        case ICMP_DEST_UNREACH:
            print_line(ICMP_DEST_UNREACH_MSG);
            break;
        case ICMP_SOURCE_QUENCH:
            print_line(ICMP_SOURCE_QUENCH_MSG);
            break;
        case ICMP_REDIRECT:
            print_line(ICMP_REDIRECT_MSG);
            break;
        case ICMP_ECHO:
            print_line(ICMP_ECHO_MSG);
            break;	
        case ICMP_TIME_EXCEEDED:
            print_line(ICMP_TIME_EXCEEDED_MSG);
            break;	
        case ICMP_PARAMETERPROB:
            print_line(ICMP_PARAMETERPROB_MSG);
            break;		
        case ICMP_TIMESTAMP:
            print_line(ICMP_TIMESTAMP_MSG);
            break;		
        case ICMP_TIMESTAMPREPLY:
            print_line(ICMP_TIMESTAMPREPLY_MSG);
            break;	
        case ICMP_INFO_REQUEST:
            print_line(ICMP_INFO_REQUEST_MSG);
            break;
        case ICMP_INFO_REPLY:
            print_line(ICMP_INFO_REPLY_MSG);
            break;
        case ICMP_ADDRESS:
            print_line(ICMP_ADDRESS_MSG);
            break;			
        case ICMP_ADDRESSREPLY:
            print_line(ICMP_ADDRESSREPLY_MSG);
            break;				
    }
    print_line(CODE_MSG + std::to_string(icmp_head->code));
}

void print_icmp_v6(const u_char *body){
    struct icmp6_hdr *icmp6_head = (struct icmp6_hdr *) body;
    print_line(ICMPV6_MSG);
    std::cout << TYPE_MSG;
    switch (icmp6_head->icmp6_type){
        case ICMP6_DST_UNREACH:
            print_line(ICMP6_DST_UNREACH_MSG);
            break;
        case ICMP6_PACKET_TOO_BIG:
            print_line(ICMP6_PACKET_TOO_BIG_MSG);
            break;
        case ICMP6_TIME_EXCEEDED:
            print_line(ICMP6_TIME_EXCEEDED_MSG);
            break;
        case ICMP6_PARAM_PROB:
            print_line(ICMP6_PARAM_PROB_MSG);
            break;
        case ICMP6_ECHO_REQUEST:
            print_line(ICMP6_ECHO_REQUEST_MSG);
            break;
        case ICMP6_ECHO_REPLY:
            print_line(ICMP6_ECHO_REPLY_MSG);
            break;
        case MLD_LISTENER_QUERY:
            print_line(MLD_LISTENER_QUERY_MSG);
            break;
        case MLD_LISTENER_REPORT:
            print_line(MLD_LISTENER_REPORT_MSG);
            break;
        case MLD_LISTENER_REDUCTION:
            print_line(MLD_LISTENER_REDUCTION_MSG);
            break;
        default:
            print_line(UKNOWN_PROTOCOL);
            break;
    }
}

void extension_hop(const u_char *body, uint8_t ip6_next){
    struct ip6_ext *ext_head = (struct ip6_ext *) body;
    switch(ip6_next){
        case IPPROTO_TCP:
            print_tcp(body);
            break;
        case IPPROTO_UDP:
            print_udp(body);
            break;
        //TODO for some reason icmp6 is wrongly defined
        //case IPPROTO_ICMPV6:
        case 1:
            print_icmp_v6(body);
            break;
        default:
            extension_hop(body + ext_head->ip6e_len, ext_head->ip6e_nxt);
            break;
    }
}

int print_ipv4_frame(const u_char *body){
    char *ip_addr_readable;
    unsigned int header_length;
    struct ip *ip_head = (struct ip *) body;

    print_line(FRAME_LEN_MSG + std::to_string(htons(ip_head->ip_len)));
    print_line(TTL_MSG + std::to_string(ip_head->ip_ttl));
    ip_addr_readable = inet_ntoa(ip_head->ip_src);
    print_line(SRC_IP_MSG + std::string(ip_addr_readable));
    ip_addr_readable = inet_ntoa(ip_head->ip_dst);
    print_line(DST_IP_MSG + std::string(ip_addr_readable));
    header_length = ip_head->ip_hl * OCTET_CONST;
    print_line(HEAD_LEN_MSG + std::to_string(header_length));
    switch(ip_head->ip_p){
        case IPPROTO_TCP:
            print_line(PROT_TCP_MSG);
            print_tcp(body + header_length);
            break;
        case IPPROTO_UDP:
            print_line(PROT_UDP_MSG);
            print_udp(body + header_length);
            break;
        case IPPROTO_ICMP:
            print_line(PROT_ICMP_MSG);
            print_icmp_v4(body + header_length);
            break;
        default:
            print_line(PROT_UFO_MSG);
            break;
    }
    return htons(ip_head->ip_len);
}

int print_ipv6_frame(const u_char *body){
    struct ip6_hdr *ip6_head = (struct ip6_hdr *) body;struct icmp6_hdr;
    char address[INET6_ADDRSTRLEN];
    
    struct in6_addr raw_adresa = ip6_head->ip6_dst;
    inet_ntop(AF_INET6, (const void *) &(ip6_head->ip6_dst), address, INET6_ADDRSTRLEN);
    print_line(DST_IP_MSG + std::string(address));
    inet_ntop(AF_INET6, (const void *) &(ip6_head->ip6_src), address, INET6_ADDRSTRLEN);
    print_line(SRC_IP_MSG + std::string(address));
    print_line(HOP_LIMIT_MSG + std::to_string(ip6_head->ip6_ctlun.ip6_un1.ip6_un1_hlim));
    print_line(TOTAL_LEN_MSG + std::to_string(ntohs(ip6_head->ip6_ctlun.ip6_un1.ip6_un1_plen)));
    extension_hop(body + IPV6_HEAD_LEN, ip6_head->ip6_ctlun.ip6_un1.ip6_un1_nxt);

    return ntohs(ip6_head->ip6_ctlun.ip6_un1.ip6_un1_plen);
}

int print_arp(const u_char *body){
    uint16_t prot_type;
    uint16_t opcode_type;
    struct ether_arp *arp_head = (struct ether_arp *) body;
    
    prot_type = ntohs(arp_head->ea_hdr.ar_pro);
    std::cout << PROT_TYPE_MSG;
    switch(prot_type){
        case ETHERTYPE_IPV6:
            print_line(IPV6_NAME);
            break;
        case ETHERTYPE_IP:
            print_line(IPV4_NAME);
            break;
        default:
            std::cout << std::endl;
            break;
    }

    opcode_type = ntohs(arp_head->ea_hdr.ar_op);
    std::cout << OPCODE_MSG;
    switch(opcode_type){
        case ARPOP_REQUEST:
            print_line(ARPOP_REQUEST_MSG);
            break;
        case ARPOP_REPLY:
            print_line(ARPOP_REPLY_MSG);
            break;
        case ARPOP_RREQUEST:
            print_line(ARPOP_RREQUEST_MSG);
            break;
        case ARPOP_RREPLY:
            print_line(ARPOP_RREPLY_MSG);
            break;
        case ARPOP_InREQUEST:
            print_line(ARPOP_InREQUEST_MSG);
            break;
        case ARPOP_InREPLY:
            print_line(ARPOP_InREPLY_MSG);
            break;
        case ARPOP_NAK:
            print_line(ARPOP_NAK_MSG);
            break;
    }
    std::cout << SEND_MAC_MSG;
    print_line(ether_ntoa ((struct ether_addr *) arp_head->arp_sha));
    std::cout << SEND_IP_MSG;
    print_ipv4_raw(arp_head->arp_spa);

    std::cout << TARGET_MAC_MSG;
    print_line(ether_ntoa ((struct ether_addr *) arp_head->arp_tha));
    std::cout << TARGET_IP_MSG;
    print_ipv4_raw(arp_head->arp_tpa);

    return ARP_LEN;
}

/**
 * @brief Prints raw data
 * Formats them as seen in wireshark
 * 
 * @param packet raw packet data 
 * @param len length of packet
 */
void print_raw_packet(const u_char *packet, int len){
    bool done = false;
    int packet_index = 0;
    int index = 0;
    while(!done){
        printf("0x%04x:  ", packet_index);
        for (index = 0; index < line_len; ++index)
        {   
            if(packet_index + index == len){
                done = true;
                break;
            }
            printf("%02x ", packet[packet_index + index]);

        }
        std::cout << std::setfill(' ') << std::setw(count_padding(index, line_len)) << " ";
        for(index = 0; index < line_len; ++index){
            if(packet_index + index == len) break;
            printf("%c", ((((char) packet[packet_index+index]) <= ' ') ? '.': packet[packet_index+index]));
        }

        packet_index += line_len;
        print_line("");
    }
}

/**
 * @brief Entry point when got packet and wants to decode it and print important informations
 * 
 * @param args Is not used, declared only because of protocol
 * @param head Mainly source of timestamp
 * @param body Raw data of packet
 */
void print_packet(u_char *args, const struct pcap_pkthdr *head, const u_char *body){
    char time_buffer[200];
    char all_buffer[200];
    char *temp_mac;
    int frame_len = 0;
    uint16_t host_ethertype;
    struct ether_header *ether_head = (struct ether_header *) body;

    //printing time begin
    time_t time_sec = head->ts.tv_sec;
    struct tm *packet_time = localtime(&time_sec);
    strftime(time_buffer, 200, "Timestamp: %FT%X", packet_time);
    snprintf(all_buffer, 200, "%s.%06ld+%02ld:00", time_buffer, head->ts.tv_usec, packet_time->tm_gmtoff/3600);
    std::cout << all_buffer << std::endl;
    // printing time end

    temp_mac = ether_ntoa ((struct ether_addr *) ether_head->ether_shost);
    print_line(SRC_MAC + std::string(temp_mac));
    temp_mac = ether_ntoa ((struct ether_addr *) ether_head->ether_dhost);
    print_line(DEST_MAC + std::string(temp_mac));
    
    host_ethertype = ntohs(ether_head->ether_type);
    switch (host_ethertype)
    {
    case ETHERTYPE_ARP:
        frame_len = print_arp(body + ETH_HLEN);
        break;
    case ETHERTYPE_IP:
        frame_len = print_ipv4_frame(body + ETH_HLEN);
        break;
    case ETHERTYPE_IPV6:
        frame_len = print_ipv6_frame(body + ETH_HLEN);
        break;
    default:
        print_line(PROT_UFO_MSG);
        break;
    }
    print_raw_packet(body, frame_len);
    print_line("");
}

/**
 * @brief Entry point when processing packet from file
 * 
 * @param cmd_options only gets path to binary file
 * @return int mainly if reading file with packet was succesfull
 */
int process_binary_packet(cmd_params_c &cmd_options){
    const auto data_path = cmd_options.get_binary_path();
    std::ifstream input( data_path, std::ios::binary );
    if(!input.good()) {
        stderr_line(ERR_BIN_FILE);
        return EXIT_FAILURE;
    }

    // copies all data into buffer
    std::vector<u_char> buffer(std::istreambuf_iterator<char>(input), {});
    pcap_pkthdr time_header{{1000, 1000}, 0, 0};

    print_packet(NULL, &time_header, &buffer[0]);
    return EXIT_SUCCESS;
}

int main(int argc, char *argv[]){
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_t *sniff_handle;
    int retval = EXIT_SUCCESS;
    
    //print_interfaces(); 
    option_info_t option_info;
    construct_option_info(option_info);
    cmd_params_c cmd_options;
    init_arg_struct(arg_struct, argv, argc);
    retval = parse_arguments(&cmd_options, &arg_struct, option_info);
    if(retval) return retval;

    if(cmd_options.param_is_set(B_FLAG)){
        process_binary_packet(cmd_options);
    }
    else if(!cmd_options.param_is_set(INTERFACE_FLAG)){
        print_interfaces();
    }
    else{
        //set up sniff handle
        sniff_handle = pcap_open_live(str_to_char_arr(cmd_options.get_interface()), BUFSIZ, 1, 1000, errbuf);
        //sniff_handle = pcap_create(str_to_char_arr(cmd_options.get_interface()), errbuf);
        if(sniff_handle == NULL){
            std::cout << errbuf << std::endl;
            return EXIT_FAILURE;
        }

        // if(pcap_set_promisc(sniff_handle, 1)){
        //     stderr_line(ERROR_ACTIVATE_PROMISC);
        //     return PCAP_ERROR_ACTIVATED;
        // }

        // if((retval = pcap_activate(sniff_handle))){
        //     stderr_line(ERROR_ACTIVATE_PCAP);
        //     pcap_geterr(sniff_handle);
        //     pcap_close(sniff_handle);
        //     return retval;
        // }
        //set up filter
        if(cmd_options.setfilter(sniff_handle)) return EXIT_FAILURE;
        pcap_loop(sniff_handle, cmd_options.get_sniff_count(), print_packet, NULL);
        pcap_close(sniff_handle);    


    }

    return retval;
}
