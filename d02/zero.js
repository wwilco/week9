var array = [];

function zeroFront(){
  var arr = array.sort(function(a, b){
    return a-b;
    console.log(arr);
  });
};
var arr = [0, 1, 1, 0, 1];

console.log(zeroFront(arr));



// var array = [0, 1, 1, 0, 1];
// console.log(array.sort(function(a, b){return a-b}));


// var arr = [];
// var zeroFront = (function(a, b){
//   var newarr = arr.sort(a, b);
//   return (a-b);
// });
//
// console.log(zeroFront([0, 1, 1, 0, 1]));
