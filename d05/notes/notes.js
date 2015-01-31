var person - function(name, age){
  this.name = name;
  this.age = age;
  this.sayHello = function(){
    console.log("my name is " + this.name);
  };
};

var sam = new person ("sam", 26);
sam.sayHello();
