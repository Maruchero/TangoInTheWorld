<?php

function get_logger($emitter) {
    return function($text) use ($emitter) {
        $currentDateTime = date('Y-m-d H:i:s');
        $logString = "[$currentDateTime] $emitter - $text\n";
        print($logString);
    };
}
