<?php
/**
 * @author Juraj Novosad <xnovo13@stud.fit.vutbr.cz>
 * @file error_codes.php
 * Constants for error codes and error messages
 */
const MISSING_ARG = 10;
const INPUT_ERR = 11;
const OUTPUT_ERR = 12;
const MISSING_HEADER = 21;
const UNKNOWN_OPCODE = 22;
const OTHER_ERROR = 23;
const ERROR_OPEN = 41;
const INTERN_ERROR = 99;

//toggle error messages
const EN_MESS = 1;

function log_missing_arg(){
    if(EN_MESS) fwrite(STDERR, "ERROR: Missing or wrong combination of parameters\n");
}
function log_input_err(){
    if(EN_MESS) fwrite(STDERR, "ERROR: Cannot open input file or stream \n");
}
function log_output_err(){
    if(EN_MESS) fwrite(STDERR, "ERROR: Cannot open output file or stream \n");
}
function log_missing_header(){
    if(EN_MESS) fwrite(STDERR, "ERROR: Missing header in provided file \n");
}
function log_unknown_opcode($line){
    if(EN_MESS) fwrite(STDERR, "ERROR: Unknown opcode on line: $line \n");
}
function log_other_error($line){
    if(EN_MESS) fwrite(STDERR, "ERROR: Syntactic or lexical error on line: $line \n");
}
function log_intern_error(){
    if(EN_MESS) fwrite(STDERR, "ERROR: Internal error occured, please contact local administrator \n");
}
function log_open_files(){
    if(EN_MESS) fwrite(STDERR, "ERROR: cannot open or acces file specified \n");
}
function log_open($file){
    if(EN_MESS) fwrite(STDERR, "ERROR: Cannot open file: $file\n");
}
?>