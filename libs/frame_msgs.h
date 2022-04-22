/**
 * @file frame_msgs.h
 * @author Juraj Novosad (xnovos13@stud.fit.vutbr.cz)
 * @brief Constants and messages are defined here
 * @version 0.1
 * 
 * @copyright Copyright (c) 2022
 * 
 */
#pragma once

#include <netinet/ether.h>
#include <net/ethernet.h>
#include <netinet/if_ether.h>
#include <netinet/ip.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/udp.h>
#include <netinet/tcp.h>
#include <netinet/ip_icmp.h>
#include <netinet/ip6.h>
#include <netinet/icmp6.h>
#include <string>

namespace header_msgs{

    const std::string INTERFACE_MESSAGE = "\
------------------------\n\
name: %s \n\
description: %s\n";

    const std::string SOCKADDR_MESSAGE = "\
type: %s \n\
data_t: %s ";

    const int ARP_LEN = 28;
    const int line_len = 16;

    const std::string ERROR_ACTIVATE_PCAP = "ERROR: couldn't activate pcap socket";
    const std::string ERROR_ACTIVATE_PROMISC = "ERROR: cannot activate promisc mode";

    const std::string ADDRESS_MSG = "Address: ";
    const std::string NETMASK_MSG = "Netmask: ";
    const std::string BROADCAST_MSG = "broadcast: ";
    const std::string SEND_MAC_MSG = "Sender MAC address: ";
    const std::string SEND_IP_MSG = "Sender IP address: ";
    const std::string TARGET_MAC_MSG = "Target MAC address: "; 
    const std::string TARGET_IP_MSG = "Target IP address: ";
    const std::string DEST_MAC = "Dst MAC: ";
    const std::string SRC_MAC = "Src MAC: ";
    const std::string DSTADDR_MSG = "Destination address: ";
    const std::string SRC_PORT_MSG = "Src port: ";
    const std::string DST_PORT_MSG = "Dst port: ";
    const std::string SEQ_NUM_MSG = "Sequence number: ";
    const std::string ACK_NUM_MSG = "Ack number: ";
    const std::string FLAGS_TCP_MSG = "Flags: 0x%1x%02x\n";
    const std::string UDP_LEN_MSG = "UDP frame length: ";
    const std::string FRAME_LEN_MSG = "Frame length: ";
    const std::string TTL_MSG = "Time to live: ";
    const std::string SRC_IP_MSG = "Src IP: ";
    const std::string DST_IP_MSG = "Dst IP: ";
    const std::string HEAD_LEN_MSG = "Header length: ";
    const std::string TOTAL_LEN_MSG = "Total length: ";
    const std::string HOP_LIMIT_MSG = "Hop limit: ";
    const std::string PROT_TYPE_MSG = "Protocol type: ";
    const std::string PROT_TCP_MSG = "Protocol: tcp";
    const std::string PROT_UDP_MSG = "Protocol: udp";
    const std::string PROT_ICMP_MSG = "Protocol: icmp";
    const std::string PROT_UFO_MSG = "Protocol: unknown";    
    const std::string TYPE_MSG = "Type: ";
    const std::string CODE_MSG = "Code: ";
    const std::string OPCODE_MSG = "Opcode: ";
    const std::string UKNOWN_PROTOCOL = "unknown";

    const int OCTET_CONST = 4;

    const std::string ARP_NAME = "ARP";
    const std::string IPV6_NAME = "IPV6";
    const std::string IPV4_NAME = "IPV4";

    const int IPV6_HEAD_LEN = 40;

    // ARP_ messages
    const std::string 	ARPOP_REQUEST_MSG =	"request (1)";		    /* ARP request.  */
    const std::string	ARPOP_REPLY_MSG =   "reply (2)";	        /* ARP reply.  */
    const std::string	ARPOP_RREQUEST_MSG ="rarp request (3)";		/* RARP request.  */
    const std::string	ARPOP_RREPLY_MSG =	"rarp reply (4)";		/* RARP reply.  */
    const std::string	ARPOP_InREQUEST_MSG="InARP reply (8)";		/* InARP request.  */
    const std::string	ARPOP_InREPLY_MSG =	"InARP reply(9)";		/* InARP reply.  */
    const std::string	ARPOP_NAK_MSG =	    "ARP NAK (10)";	        /* (ATM)ARP NAK.  */

    // ICMP messages
    const std::string ICMPV6_MSG =              "Type: ICMPv6";
    const std::string ICMP_ECHOREPLY_MSG =		"Echo reply (0)";	            /* Echo Reply			*/
    const std::string ICMP_DEST_UNREACH_MSG =	"Destination unreachable (3)";	/* Destination Unreachable	*/
    const std::string ICMP_SOURCE_QUENCH_MSG =	"Source Quench (4)";	        /* Source Quench		*/
    const std::string ICMP_REDIRECT_MSG =		"Redirect (5)";	                /* Redirect (change route)	*/
    const std::string ICMP_ECHO_MSG =		    "Echo request (8)";	            /* Echo Request			*/
    const std::string ICMP_TIME_EXCEEDED_MSG =	"Time exceeded (11)";           /* Time Exceeded		*/
    const std::string ICMP_PARAMETERPROB_MSG =	"Parameter problem (12)";	    /* Parameter Problem		*/
    const std::string ICMP_TIMESTAMP_MSG =		"Timestamp request (13)";	    /* Timestamp Request		*/
    const std::string ICMP_TIMESTAMPREPLY_MSG =	"Timestamp reply (14)";	        /* Timestamp Reply		*/
    const std::string ICMP_INFO_REQUEST_MSG =   "Information request (15)";	    /* Information Request		*/
    const std::string ICMP_INFO_REPLY_MSG =		"Information reply (16)";	    /* Information Reply		*/
    const std::string ICMP_ADDRESS_MSG =		"Address mask request (17)";	/* Address Mask Request		*/
    const std::string ICMP_ADDRESSREPLY_MSG	 =  "Address mask reply (18)";	    /* Address Mask Reply		*/

    const std::string ICMP6_DST_UNREACH_MSG =      "Destination unreachable (1)";
    const std::string ICMP6_PACKET_TOO_BIG_MSG =   "Packet too big (2)";
    const std::string ICMP6_TIME_EXCEEDED_MSG =    "Time exceeded (3)";
    const std::string ICMP6_PARAM_PROB_MSG =       "Parameter problem (4)";
    const std::string ICMP6_ECHO_REQUEST_MSG =     "Echo request (128)";
    const std::string ICMP6_ECHO_REPLY_MSG =       "Echo reply (129)";
    const std::string MLD_LISTENER_QUERY_MSG =     "Multicast Router Advertisement (130)";
    const std::string MLD_LISTENER_REPORT_MSG =    "Multicast Router Solicitation (131)";
    const std::string MLD_LISTENER_REDUCTION_MSG = "Multicast Router Termination (132)";
}
