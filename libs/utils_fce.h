/**
 * @file utils_fce.h
 * @author Juraj Novosad (xnovos13@stud.fit.vutbr.cz)
 * @brief Utilities functions to make life easier
 * @version 0.1
 * 
 * @copyright Copyright (c) 2022
 * 
 */
#pragma once

#include <string>
#include <iostream>


void print_line(std::string message);
void print_line(const char * message);
void stderr_line(std::string message);
void stderr_line(char *message);
void print_ipv4_raw(uint8_t addr[4]);
int count_padding(int line, int max_len);
bool in_between(long number,long top,long bottom);
const char *str_to_char_arr(std::string name);

