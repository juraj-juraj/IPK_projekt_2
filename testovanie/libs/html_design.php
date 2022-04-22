<?php
/**
 * @author Juraj Novosad <xnovo13@stud.fit.vutbr.cz>
 * @file html_design.php
 * Base for generating html output summary
 */

const HTML_HEAD = " 
<html>
 <head>
  <title>Vyhodnotenie testov</title>
  <style>
   header {
        background: #515f64;
        color: white;
        padding: 10px 0 10px 40px;
        } 
   footer {
        background: #515f64;
        color: white;
        padding: 10px 0px 10px 0px;
        text-align: right;
        width: 100%;
        bottom: 0px;
        } 
    body {
        margin: 0px;
        font-family: Arial
    }
    .main{
        padding-left:20px;
    }
    .passed{
        text-indent: 20px; 
        padding-top: 5px;
        padding-bottom: 5px;
        margin-left: 20px;
        width: 95%;
        background: rgba(230, 223, 223, 0.932);
        color:green;  
    }
    .failed{
        text-indent: 20px; 
        padding-top: 5px;
        padding-bottom: 5px;
        margin-left: 20px;
        width: 95%;
        background: rgba(230, 223, 223, 0.932);
        color:red;
    }

   </style>
  </head>
  <body>
   <header><h3>IPP tester</h3></header>\n";



const HTML_END ="
 </body>
 <footer> <div style = \"margin-right: 25px\">Author: <a href = \"mailto: xnovos13@fit.vutbr.cz\">xnovos13@fit.vutbr.cz</a></div></footer>
</html>\n";
?>