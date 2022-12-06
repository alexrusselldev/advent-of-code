<?php
function readInput() {
    $rawInput = fopen("input.txt", "r");
    return $rawInput;
}

function parseInput($rawInput) {
    $readInput = fread($rawInput, filesize("input.txt"));
    $firstPass = explode("\n", $readInput);
    $result = [];
    foreach ($firstPass as $index => $line) {
        $split = explode(",", $line);
        $working = [];
        foreach ($split as $jndex => $entry) {
            array_push($working, explode("-", $entry));
        }
        array_push($result, $working);
    }
    return $result;
}

$rawInput = readInput();
$parsedInput = parseInput($rawInput);
?> 