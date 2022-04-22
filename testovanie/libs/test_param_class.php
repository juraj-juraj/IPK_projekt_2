<?php
/**
 * @author Juraj Novosad <xnovo13@stud.fit.vutbr.cz>
 * @file test_param_class.php
 * Definition of class for parsing command line arguments
 * Checks if they are valid combination
 * Parses also names of directories with tests
 */

include './libs/test_help.php';

const MAX_LINE_LEN = 4096;

class param_class{
    public $test_dirs;
    protected string $sniffer_dir;
    public string $match_exp;
    protected bool $recursive_s;
    protected bool $clean;

    // Which commands cannot be combined with which. For instance --parse-only cannot be combined with --parse-only, --int-only, --int-script and so on.
    protected $forb_comb = array("--directory"=>array("--directory", "--test-list"),"--recursive"=>array("--recursive"), "--sniffer-script"=>array("--sniffer-script"),
     "--noclean"=>array("--noclean"), "--testlist"=>array("--testlist"), "--match"=>array("--match"));

    function __construct(){
        $this->test_dirs = array();
        $this->add_test_dir("./");
        $this->set_dir("./ipk-sniffer", "sniffer_dir");
        $this->recursive_s = False;
        $this->clean = True;
        $this->match_exp = '';
    }

    public function process_arguments($arg_list){
        global $help_message_test;
        $error_params = array();
        $retval = 0;
        foreach($arg_list as $value){
            $prefix = explode('=', $value);
            if($prefix[0] == "--help"){
                if(count($arg_list) > 1){
                    return MISSING_ARG;
                }
                else{
                    echo $help_message_test;
                    return 0;
                }
            }

            // check if it is valid parameter
            $temp = $this->forb_comb[$prefix[0]] ?? NULL;
            if($temp == NULL){
                return MISSING_ARG;
            }
            // checking whether current processed param is valid in this combination of parameters
            if(in_array($prefix[0], $error_params)){
                return MISSING_ARG;
            }
            //adding parameters which cannot be combined with current parameter
            $error_params = array_merge($temp, $error_params);

            switch($temp[0]){
                case "--directory":
                    $retval = $this->process_dir($prefix, "test_dirs", True);
                    break;
                case "--recursive":
                    if(count($prefix) > 1){
                        $retval = MISSING_ARG;
                    }
                    $this->recursive_s = True;
                    break;
                case "--sniffer-script":
                    $retval = $this->process_file($prefix, "sniffer_dir");
                    break;
                case "--noclean":
                    $this->clean = False;
                    break;
                case "--testlist":
                    $retval = $this->process_testlist($prefix, "test_dirs");
                    break;
                case "--match":
                    if(count($prefix) < 2){
                        $retval = INPUT_ERR;
                    }
                    $retval = $this->process_match($prefix[1]);
                    break;
            }
            if($retval){
              return $retval;
            }
        }
        return $retval;
    }

    protected function process_dir($argument, $dest, $trunc){
        if(count($argument) != 2){
            return MISSING_ARG;
        }
        $argument[1] = $this->end_slash($argument[1]);

        if(is_dir($argument[1])){
            if(!file_exists($argument[1])){
                return ERROR_OPEN;
            }
            if($trunc){
                if($dest == "test_dirs"){
                    $this->set_arr_dir($argument[1], $dest);
                }else{
                    $this->set_dir($argument[1], $dest);
                }
            }
            else{
                $this->add_test_dir($argument[1]);
            }
        }
        else{
            return MISSING_ARG;
        }
        return 0;
    }

    protected function process_file($argument, $dest){
        if(count($argument) != 2){
            return MISSING_ARG;
        }
        if(!file_exists($argument[1])){
            return ERROR_OPEN;
        }
        $this->set_dir($argument[1], $dest);
        return 0;
    }

    // Parses argument --testlist
    // Opens file with paths to test and appends them to test directories
    protected function process_testlist($argument, $dest){
        if(count($argument) != 2){
            return MISSING_ARG;
        }
        $retval = 0;
        if(file_exists($argument[1])){
            $dir_file = fopen($argument[1], 'r');
            if(!$dir_file){
                return ERROR_OPEN;
            }
            while($buffer = fgets($dir_file, MAX_LINE_LEN)){
                $buffer = $this->end_slash($buffer);
                if(is_dir($buffer) && file_exists($buffer)){
                    $this->add_test_dir($buffer);
                }
                else {
                    $retval = MISSING_ARG;
                    break;
                }

            }
            fclose($dir_file);
        }
        else{
            $retval = MISSING_ARG;
        }
        return $retval;
    }

    protected function process_match($match_exp){
        $this->match_exp = $match_exp;
        return 0;
    }

    protected function add_test_dir($directory){
        array_push($this->test_dirs, $directory);
    }
    public function get_test_dir(){
        return $this->test_dirs;
    }
    protected function set_arr_dir($directory, $value){
        $this->$value = array($directory);
    }
    protected function set_dir($directory, $value){
        $this->$value = $directory;
    }
    function get_dir($value){
        return $this->$value;
    }
    protected function set_match($pattern){
        $this->match_exp = $pattern;
    }
    public function is_recursive(){
        return $this->recursive_s;
    }
    public function get_param($param){
        return $this->$param;
    }
    public function print_out(){
        echo "directories with tests: ";
        print_r($this->get_test_dir());
        echo "\n";
        echo "sniffer directory: ". $this->get_dir("sniffer_dir") . "\n";
        echo "recursive: ". $this->recursive_s . "\n";
        echo "cleaning: ". $this->clean . "\n";
        echo "regular expression: ". $this->match_exp . "\n";
    }

    private function end_slash($path){
        $path = rtrim($path, "\r\n");
        if(substr($path, -1) != '/'){
            $path .= '/';
        }
        return $path;
    }
}
?>