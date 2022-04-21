/**
 * @file double_key_map.h
 * @author Juraj Novosad (xnovos13@stud.fit.vutbr.cz)
 * @brief library implements double key map array, associative continer with two keys to one value
 * @version 1.0
 * 
 * @copyright Copyright (c) 2022
 * 
 */
#ifndef _DOUBLE_KEY_MAP_
#define _DOUBLE_KEY_MAP_

#include <map>
#include <cerrno>
#include <tuple>
#include <string>

template <typename key_t>
using key_key_map = std::map<key_t, key_t>;
template <typename key_t, typename data_t>
using key_val_map = std::map<key_t, data_t>;

template<typename key_t, typename data_t>
class double_key_map{
    private:
        int length;
        key_key_map<key_t> short_long_key;
        key_val_map<key_t, data_t> long_to_val;

    public:
        void insert(std::tuple<key_t, key_t, data_t> entry){
            short_long_key.insert(std::make_pair(std::get<0>(entry), std::get<1>(entry)));
            long_to_val.insert(std::make_pair(std::get<1>(entry), std::get<2>(entry)));
            length++;
        }
        data_t get_val(key_t key){
            //trying to resolve key as a short key and retrieve long_key
            auto short_key = short_long_key.find(key);
            if(short_key == end(short_long_key)){
                //key was not found to be short key, now assuming it is long key
                auto long_key = long_to_val.find(key);
                if(long_key == end(long_to_val)){
                    errno = EBADMSG;
                    return data_t(NULL);
                }
                return long_key->second;
            }
            return long_to_val[short_key->second];
        }

        int len(){
            return length;
        }
};


#endif