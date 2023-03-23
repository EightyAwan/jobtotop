<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (isset($_GET['action'])) {
    if ($_GET['action'] == "API") {
        echo 'yes';
    }
}