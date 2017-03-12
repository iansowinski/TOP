var prime = function (n) {
  var i = 2;
  while (i*i<n) {
    while (n % i == 0) {
      n = n / i;
    };
    i = i + 1;
  }
  return n;
};

console.log(prime(600851475143))
