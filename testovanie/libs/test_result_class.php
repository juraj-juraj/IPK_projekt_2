<?php
/**
 * @author Juraj Novosad <xnovo13@stud.fit.vutbr.cz>
 * @file test_result_class.php
 * Implementation of class for printing reuslts. 
 * Results are gathered here thoroughout testing
 */
include 'html_design.php';

class result_class{
    protected $tests_total;
    protected $passed_tests;
    protected $failed_tests;
    protected $webpage;

    public function __construct($total){
        $this->test_total = $total;
        $this->passed_tests = array();
        $this->failed_tests = array();
        $this->webpage = '';
    }
    public function add_passed($filename){
        array_push($this->passed_tests, $filename);
    }
    public function add_failed($filename){
        array_push($this->failed_tests, $filename);
    }
    public function print_out(){
        echo "Total tests: $this->test_total \n";
        echo "Total failed tests". count($this->failed_tests) ."\n\n";

        echo "Failed tests: \n";
        foreach($this->failed_tests as $name){
            echo $name . "\n";
        }
        echo "\n \n Passed tests: \n";
        foreach($this->passed_tests as $name){
            echo $name . "\n";
        }
    }
    public function make_summary(){
        sort($this->failed_tests);
        sort($this->passed_tests);
        
        if($this->test_total == 0){
            return;
        }
        echo HTML_HEAD;
        printf("  <div class=\"main\">");
        printf("   <h4>Count of tests: %d</h4>\n", $this->test_total);
        printf("   <h4>Count of failed tests: %d</h4>\n", count($this->failed_tests));
        printf("   <h4>Count of passed tests: %d</h4>\n", count($this->passed_tests));
        
        printf("   <h4><b>List of tests:</b></h4> <br>\n");
        printf("   <h4>Unsuccesfull tests:</h4>\n   <div class=\"failed\">\n");

        foreach($this->failed_tests as $test){
            printf("    <p>");
            printf($test);
            printf("</p>\n");
        }

        printf("   </div>\n   <h4>Succesfull tests:</h4>\n   <div class=\"passed\">\n");

        foreach($this->passed_tests as $test){
            printf("    <p>");
            printf($test);
            printf("</p>\n");
        }
        echo "  </div>\n </div>\n";
        echo HTML_END;
    }
}
?>