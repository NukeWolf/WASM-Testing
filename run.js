const { readFileSync } = require("fs");

const is_prime = (n) => {
  if (n <= 1) {
    return false;
  }
  for (let i = 2; i <= n - 1; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
};

const nth_prime = (n) => {
  let count = 0;
  let num = 2;
  while (count < n) {
    if (is_prime(num)) {
      count++;
    }
    num++;
  }
  return num - 1;
};

const run = async () => {
  const buffer = readFileSync("./main.wasm");
  const module = await WebAssembly.compile(buffer);
  const instance = await WebAssembly.instantiate(module);

  console.time("WASM Time");
  console.log(instance.exports.nth_prime(100000));
  console.timeEnd("WASM Time");
  console.time("JS Time");
  console.log(nth_prime(100000));
  console.timeEnd("JS Time");
};

run();
