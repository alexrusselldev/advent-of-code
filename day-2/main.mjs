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
    // lose
    default: 0,
    A: 3, // rock
    B: 1, // paper
    C: 2, // scissors
  },
  Y: {
    // draw
    default: 3,
    A: 1, // rock
    B: 2, // paper
    C: 3, // scissors
  },
  Z: {
    // win
    default: 6,
    A: 2, // rock
    B: 3, // paper
    C: 1, // scissors
  },
};

function calculatePlays(parsedInput) {
  let score = 0;
  for (const round of parsedInput) {
    score += plays[round[1]].default;
    score += plays[round[1]][round[0]];
  }
  return score;
}

const rawInput = await loadInput();
const parsedInput = parseInput(rawInput);
const totalScore = calculatePlays(parsedInput);
console.log(totalScore);
