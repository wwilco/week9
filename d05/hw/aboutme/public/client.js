var addPerson= function() {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'http://localhost:3000/');
  xhr.addEventListener('load', function() {
    var person = JSON.parse(xhr.responseText);
    // pets.forEach(function(pet) {
    //   addPet(pet); // creates list item for that pet
    // });
  });
  xhr.send();
};
addPerson();

var addP= function(person) {
  // create li
  var li= document.createElement('li');
  setLiToP(li, person);
  //grab ul. append li to ul
  var ul = document.getElementById("personlist");
  ul.appendChild(li);
};

var setLiToP= function(li, person) {
  li.setAttribute('id','person' + person.id);
  li.innerHTML = "";

  var pText = person.name + person.town + person.sign;
  var pTextNode = document.createTextNode(pText); // makes textnode instead of using innerHTML
  li.appendChild(pTextNode); //textnode gives you more usability, can just
};

//post button
var addButton = document.getElementById("addButton");
addButton.addEventListener('click', function() {
  var newName = document.getElementById("newname");
  var newTown = document.getElementById("newtown");
  var newSign = document.getElementById("newsign");

  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'http://localhost:3000/');
  xhr.setRequestHeader('Content-Type', "application/json;charset=UTF-8"); // same as above
  xhr.addEventListener('load', function() {
    var returnedPerson = JSON.parse(xhr.responseText); //process what comes back
    addP(returnedPerson);
    newName.value = ' '; // empty input box
    newType.value = ' ';
    newSign.value - ' ';
  });

  var newPerson = {name: newName.value, town: newTown.value, sign: newSign.value};
  xhr.send(JSON.stringify(newPerson));
});
