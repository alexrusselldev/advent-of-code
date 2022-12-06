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

function sumInput($parsedInput){
    $result = 0;
    foreach ($parsedInput as $team) {
        if(($team[0][0] >= $team[1][0] and $team[0][0] <= $team[1][1]) 
        or ($team[0][1] >= $team[1][0] and $team[0][1] <= $team[1][1])
        or ($team[1][0] >= $team[0][0] and $team[1][0] <= $team[0][1]) 
        or ($team[1][1] >= $team[0][0] and $team[1][1] <= $team[0][1])) {
            $result = $result + 1;
        }
    }
    return $result;
}

$rawInput = readInput();
$parsedInput = parseInput($rawInput);
$summed = sumInput($parsedInput);
print_r($summed);
?> 