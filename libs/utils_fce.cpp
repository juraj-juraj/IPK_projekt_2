#include "utils_fce.h"


void print_line(std::string message){
    std::cout << message << std::endl;
}

void print_line(const char *message){
    std::cout << message << std::endl;
}

void stderr_line(std::string message){
    std::cerr << message << std::endl;
}

void stderr_line(char *message){
    std::cerr << message << std::endl;
}

void print_ipv4_raw(uint8_t addr[4]){
    printf("%d.%d.%d.%d\n", addr[0], addr[1], addr[2], addr[3]);
}

bool in_between(long number, long top, long bottom){
    return (bottom <=number && number <= top);
}

const char *str_to_char_arr(std::string name){
    return name.c_str();
}

int count_padding(int index, int max_len){
    return (max_len - index)*3+1;
}
