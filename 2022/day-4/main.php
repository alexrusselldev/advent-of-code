<?php
function readInput() {
    $rawInput = fopen("input.txt", "r");
    return $rawInput;
}

function parseInput($rawInput) {
    $readInput = fread($rawInput, filesize("input.txt"));
    $parsed = explode("\n", $readInput);
    foreach ($parsed as $bands => $line) {
        $split = explode(",", $line);
        foreach ($split as $booty => $entry) {
            $split[$booty] = explode("-", $entry);
        }
        $parsed[$bands] = $split;
    }
}

$rawInput = readInput();
$parsedInput = parseInput($rawInput);
?> 