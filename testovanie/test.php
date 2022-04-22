<?php
/**
 * @author Juraj Novosad <xnovo13@stud.fit.vutbr.cz>
 * @file test.php
 * Script for automatically testing. As output, or summary is generated html.
 */
include 'libs/error_codes.php';
include 'libs/test_param_class.php';
include 'libs/test_result_class.php';

function regex_check($file, $reg_exp){
    if($reg_exp != ''){
        $name = explode('.', $file)[0];
        if(!preg_match($reg_exp, $name)){
            $file = false;
        }
    }
    return $file;
}

function get_test_files($arguments){
    $test_dirs = $arguments->get_test_dir();
    $test_files = array();
       
    foreach($test_dirs as $dir){
        if($arguments->is_recursive()){
            $it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($dir));
            foreach ($it as $file) {
                $act_path = $it->getSubPathName();
                if(preg_match('/\w+\.dat/', $act_path) && regex_check($file->getFilename(), $arguments->match_exp)){
                    array_push($test_files, $dir . $act_path);
                }
            }
        }
        else{
            $it = new DirectoryIterator($dir);
            while($it->valid()){
                $file = $it->current();
                $filename = $file->getFilename();
                if(preg_match('/\w+\.dat/', $filename) && regex_check($filename, $arguments->match_exp)){
                    array_push($test_files, $dir . $filename);
                }
                $it->next();
            }
        }
    }
    unset($dir);
    return $test_files;
}


function find_temp_file($temp_file = "./temp1"){
    while(file_exists($temp_file)){
        $temp_file .= "1";
    }
    return $temp_file;
}

function packet_test($arguments, $file, $cmp_xml){
    $retval = 0;
    $base_name = substr($file, 0, -4);
    $res_file = $base_name . "_snif.res";
    $temp_file = $base_name . "_tmp.res";

    if(!file_exists($res_file)){
        $temp_file = $res_file;
    }
    $command_string = $arguments->get_param("sniffer_dir") . " -b " . $file . " > ". $temp_file;  
    $temp = null;
    exec($command_string, $temp, $retval);
    if($temp_file != $res_file){
        if($retval == 0){

            $command_string = "diff --strip-trailing-cr " . $temp_file . " " . $res_file;
            exec($command_string, $temp, $retval);
            
        }
        else{
            $retval = 1;
        }
        if($arguments->get_param("clean")){
            exec("rm -f " . $temp_file);
        }
    }
    return $retval;

}

function perform_test($arguments, $test_files, $results){
    $retval = 0;
    foreach($test_files as $file){
        $retval = packet_test($arguments, $file, True);
        if($retval == 0){
            $results->add_passed($file);
        }
        else{
            $results->add_failed($file);
        }
    }
}


function main(){
    global $argc, $argv;
    $retval = 0;
    $arguments = new param_class();
    $retval = $arguments->process_arguments(array_slice($argv, 1));
    if($retval){
        if($retval == ERROR_OPEN){
            log_open_files();
        }else{
            log_missing_arg();
        }
        exit($retval);
    }
    //spracovanie cesty pre testy
    $test_files = get_test_files($arguments);
    $results = new result_class(count($test_files));
    perform_test($arguments, $test_files, $results);
           
    //$results->print_out();
    $results->make_summary();
}

main();

?>