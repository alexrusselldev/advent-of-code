import fs from 'fs/promises';

async function loadInput() {
  return (await fs.readFile('input.txt', 'utf8')).toString();
}

function parseInput(rawInput) {
  const parsedGame = rawInput.split('\n');
  const parsedRounds = [];
  for (const round of parsedGame) {
    const moves = round.split(' ');
    parsedRounds.push(moves);
  }
  return parsedRounds;
}

const plays = {
  X: {
    // rock
    default: 1,
    A: 3, // rock
    B: 0, // paper
    C: 6, // scissors
  },
  Y: {
    // paper
    default: 2,
    A: 6, // rock
    B: 3, // paper
    C: 0, // scissors
  },
  Z: {
    // scissors
    default: 3,
    A: 0, // rock
    B: 6, // paper
    C: 3, // scissors
  },
};

function calculatePlays(parsedInput) {
  let score = 0;
  for (const round of parsedInput) {
    console.log(round);
    console.log(round[1]);
    console.log(plays[round[1]][round[0]]);
    score += plays[round[1]].default;
    score += plays[round[1]][round[0]];
  }
  return score;
}

const rawInput = await loadInput();
const parsedInput = parseInput(rawInput);
const totalScore = calculatePlays(parsedInput);
console.log(totalScore);
