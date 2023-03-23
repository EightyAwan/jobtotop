<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (isset($_GET['lc'])) {
    if(strlen($_GET['q']) > '0'){

        $country_code = $_GET['lc'];
        $stringquery = $_GET['q'];
        $cities_list = get_country_cities_list($country_code,$stringquery);
        echo $cities_list;
        exit;
    }else{
         return '';
       }

   }
//Base of state
elseif (isset($_GET['state'])) {
        if(strlen($_GET['q']) > '0'){

            $country_code = $_GET['state'];
            $stringquery = $_GET['q'];
            $cities_list = get_country_cities_list_json($country_code,$stringquery);
            echo $cities_list;
            exit;
        }else{
            return '';
        }

    }
    else{
        return '';
    }