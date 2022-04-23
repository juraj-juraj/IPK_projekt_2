#include "cmd_params_c.h"


cmd_params_c::cmd_params_c(){
    this->param_flags = 0;
    this->interface = "";
    //meant as default value
    this->port = -1;
    this->sniff_count = 1;
}

int cmd_params_c::set_params(param_parse_fce(handle), arg_struct_t *arguments){
    return handle(this, arguments);
}

void cmd_params_c::set_flag(char mask){
    this->param_flags = this->param_flags | mask;
}

bool cmd_params_c::param_is_set(char mask){
    return ((this->param_flags & mask) != 0) ? true : false;
}

void cmd_params_c::unset_param(char mask){
    this->param_flags -= mask;
}

void cmd_params_c::set_interface(std::string if_name){
    this->interface = if_name;
}

void cmd_params_c::set_interface(char *if_name){   
    this->interface = if_name;         
}

void cmd_params_c::set_binary_path(char *data_path){
    this->bin_data_path = data_path;
}

std::string &cmd_params_c::get_binary_path(){
    return this->bin_data_path;
}

std::string cmd_params_c::get_interface(){
    return this->interface;
}  

void cmd_params_c::set_port(int port){
    this->port = port;
}

void cmd_params_c::set_sniff_count(int count){
    this->sniff_count = count;
}

int cmd_params_c::get_sniff_count(){
    return this->sniff_count;
}

int cmd_params_c::setfilter(pcap_t *handle){
    char errbuf[PCAP_ERRBUF_SIZE];
    bpf_u_int32 mask, ip_gate;
    std::string filter_exp = "";
    struct bpf_program filter_compiled;
    //setting up filter string
    if(pcap_lookupnet(this->interface.c_str(), &ip_gate, &mask, errbuf) == PCAP_ERROR){
        stderr_line(errbuf);
        return EXIT_FAILURE;
    }

    if(this->param_is_set(PROTOCOL_MASK)){
        filter_exp += "(";
        if(this->param_is_set(ICMP_FLAG)){
            filter_exp += "icmp || icmp6";
            this->unset_param(ICMP_FLAG);
            if(this->param_is_set(PROTOCOL_MASK)) filter_exp += " || ";
        }
        if(this->param_is_set(TCP_FLAG)){
            filter_exp += "tcp";
            this->unset_param(TCP_FLAG);
            if(this->param_is_set(PROTOCOL_MASK)) filter_exp += " || ";
        }
        if(this->param_is_set(ARP_FLAG)){
            filter_exp += "arp";
            this->unset_param(ARP_FLAG);
            if(this->param_is_set(PROTOCOL_MASK)) filter_exp += " || ";
        }
        if(this->param_is_set(UDP_FLAG)){
            filter_exp += "udp";
            this->unset_param(UDP_FLAG);
        }
        filter_exp += ")";
        if(this->param_is_set(PORT_FLAG)) filter_exp += " && ";
    }

    if(this->param_is_set(PORT_FLAG)){
        filter_exp += "port " + std::to_string(this->port) + " ";
    }

    //setting up filter
    if(filter_exp.length()){
        if(pcap_lookupnet(this->interface.c_str(), &ip_gate, &mask, errbuf) == PCAP_ERROR){
            stderr_line(errbuf);
            return EXIT_FAILURE;
        }

        if(pcap_compile(handle, &filter_compiled, filter_exp.c_str(), 0, ip_gate) == PCAP_ERROR){
            pcap_perror(handle, NULL);
            return EXIT_FAILURE;
        }
        if(pcap_setfilter(handle, &filter_compiled)== PCAP_ERROR){
            pcap_perror(handle, NULL);
            return EXIT_FAILURE;
        }
    }
    return EXIT_SUCCESS;
}

void cmd_params_c::print_out(){
    std::cout << "param flagy: " << (int) this->param_flags << " | interface: " <<  this->interface \
    << " | port:" << this->port << " | sniff_count: " << this->sniff_count << std::endl;
}

//--end of class definition


int interface_init(cmd_params_c *params, arg_struct_t *arguments){
    if(params->param_is_set(INTERFACE_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    if(arguments->cursor+1 == arguments->argc) return EXIT_SUCCESS;
    if(arguments->argv[arguments->cursor+1][0] == '-') return EXIT_SUCCESS;
    arguments->cursor++;
    params->set_interface(arguments->argv[arguments->cursor]);
    params->set_flag(INTERFACE_FLAG);
    return EXIT_SUCCESS;
}

int port_init(cmd_params_c *params, arg_struct_t *arguments){
    if(params->param_is_set(PORT_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    if(arguments->cursor+1 == arguments->argc){
        stderr_line(ERR_MISSING_ARG);
        return EXIT_FAILURE;
    }
    //TODO kontrolovat ci je tam cislo
    arguments->cursor++;
    int port_number =std::stoi(arguments->argv[arguments->cursor]);
    if(!in_between(port_number, MAX_PORT, MIN_PORT)){
        ERR_OUT_OF_RANGE;
        return EXIT_FAILURE;
    }
    params->set_port(port_number);
    params->set_flag(PORT_FLAG);
    return EXIT_SUCCESS;
}

int tcp_init(cmd_params_c *params){
    if(params->param_is_set(TCP_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    params->set_flag(TCP_FLAG);
    return EXIT_SUCCESS;
}

int udp_init(cmd_params_c *params){
    if(params->param_is_set(UDP_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    params->set_flag(UDP_FLAG);
    return EXIT_SUCCESS;
}

int icmp_init(cmd_params_c *params){
    if(params->param_is_set(ICMP_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    params->set_flag(ICMP_FLAG);
    return EXIT_SUCCESS;
}

int arp_init(cmd_params_c *params){
    if(params->param_is_set(ARP_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    params->set_flag(ARP_FLAG);
    return EXIT_SUCCESS;
}

int count_init(cmd_params_c *params, arg_struct_t *arguments){
    if(params->param_is_set(N_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    if(arguments->cursor+1 == arguments->argc){
        stderr_line(ERR_MISSING_ARG);
    }
    //TODO kontrolovat ci je tam cislo
    arguments->cursor++;
    params->set_sniff_count(std::stoi(arguments->argv[arguments->cursor]));
    params->set_flag(N_FLAG);
    return EXIT_SUCCESS;
}

int binary_data_init(cmd_params_c *params, arg_struct_t *arguments){
    if(params->param_is_set(B_FLAG)){
        stderr_line(ERR_WRONG_COMBINATION);
        return EXIT_FAILURE;
    }
    if(arguments->cursor+1 == arguments->argc){
        stderr_line(ERR_MISSING_ARG);
    }
    arguments->cursor++;
    params->set_binary_path(arguments->argv[arguments->cursor]);
    params->set_flag(B_FLAG);
    return EXIT_SUCCESS;
}
