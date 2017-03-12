var fib = function(n){
  if (n == 1 || n == 2) {
    return 1;
  }
  else {
    return fib(n-1)+fib(n-2);
  }
};
var y = 1;
var x = 0;
while (x < 4000000) {
  var z = fib(y);
  if (z % 2 == 0) {
    x = x + z;
  }
  y = y + 1;
  if (x > 4000000) {
    x = x - z;
    break;
  }
}
console.log(x)
