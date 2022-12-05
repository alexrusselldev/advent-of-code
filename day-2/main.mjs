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

const rawInput = await loadInput();
const parsedInput = parseInput(rawInput);
