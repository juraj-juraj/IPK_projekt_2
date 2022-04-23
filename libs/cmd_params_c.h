/**
 * @file cmd_params_c.h
 * @author Juraj Novosad (xnovos13@stud.fit.vutbr.cz)
 * @brief Library with class to parse comand line parameters
 * @version 1.0
 * 
 * @copyright Copyright (c) 2022
 * 
 */
#pragma once

#include <iostream>
#include <string>
#include <pcap.h>
#include <string.h>
#include <arpa/inet.h>
#include <vector>
#include <algorithm>
#include "double_key_map.h"
#include "utils_fce.h"


const int MIN_PORT = 1;
const int MAX_PORT = 65365;

const std::string ERR_MISSING_ARG =             "ERROR: missing parameter\n";
const std::string ERR_WRONG_COMBINATION =       "ERROR: cannot combine those options in one session \n";
const std::string ERR_OUT_OF_RANGE =            "ERROR: submitted value is out of range\n";
const std::string ERR_FILTER_COMP =             "ERROR: couldn't compile filter for sniffing\n";
const std::string ERR_SET_FILTER =              "ERROR: couldn't apply filter\n";
const std::string ERR_BIN_FILE =                "ERROR: binary file couldn't be opened\n";

/**
 * @brief Structure to store arguments from command line in one unit
 * Cursor is index in argv array of what argment will be next to be processed
 * 
 */
typedef struct arg_struct_t{
    char **argv;
    int argc;
    int cursor;
}arg_struct_t;

#define init_arg_struct(name, arg_v, arg_c) arg_struct_t name; name.argv = arg_v; name.argc = arg_c, name.cursor = 1;

#define param_parse_fce(name) int(*name)(cmd_params_c*,arg_struct_t*)
using option_info_t = double_key_map<std::string, u_char>;

#define INTERFACE_FLAG  0b00000001
#define PORT_FLAG       0b00000010
#define TCP_FLAG        0b00000100
#define UDP_FLAG        0b00001000
#define ICMP_FLAG       0b00010000
#define ARP_FLAG        0b00100000      
#define N_FLAG          0b01000000      // count flag
#define B_FLAG          0b10000000      // Binary flag
#define ALL_PARAMS      0b11111111
#define PROTOCOL_MASK (TCP_FLAG|UDP_FLAG|ICMP_FLAG|ARP_FLAG)

class cmd_params_c{
    private:
        char param_flags;
        std::string interface;
        std::string bin_data_path;
        int port;
        int sniff_count;

    public:
        cmd_params_c();

        int set_params(param_parse_fce(handle), arg_struct_t *arguments);

        void set_flag(char mask);

        bool param_is_set(char mask);

        void unset_param(char mask);

        void set_interface(std::string if_name);

        void set_interface(char *if_name);

        void set_binary_path(char *data_path);

        std::string &get_binary_path();

        std::string get_interface();

        void set_port(int port);

        void set_sniff_count(int count);

        int get_sniff_count();

        int setfilter(pcap_t *handle);

        void print_out();
};

int interface_init(cmd_params_c *params, arg_struct_t *arguments);

int port_init(cmd_params_c *params, arg_struct_t *arguments);

int tcp_init(cmd_params_c *params);

int udp_init(cmd_params_c *params);

int icmp_init(cmd_params_c *params);

int arp_init(cmd_params_c *params);

int count_init(cmd_params_c *params, arg_struct_t *arguments);

int binary_data_init(cmd_params_c *params, arg_struct_t *arguments);
