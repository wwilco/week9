var addAllPets = function () {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'http://localhost:3000/pets');
  xhr.addEventListener('load', function() {
    var pets = JSON.parse(xhr.responseText);
    pets.forEach(function(pet) {
      addPet(pet);
    });
  });

  xhr.send();
};

addAllPets();

var addPet = function(pet) {
  var li = document.createElement('li');
  setLiToPet(li, pet);
  var ul = document.getElementById('petlist');
  ul.appendChild(li);
};


var editPet = function(li, name, type) {

}

var setLiToPet = function(li, pet) {
  li.setAttribute('id', 'pet', + pet.id);
  li.innHTML = "";

  var petText = pet.name + " is a " + pet.type + " ";
  var petTextNode = document.createTextNode(petText);
  li.appendChild(petTextNode);
};

var addNewPetButton = ('addNewPet');
addNewPetButton.addEventListener('click', function(){ //use anonamous function because its not aking in any parameters
  var newName = document.getElementById('newPetName');
  var newType = document.getElementById('newPetType');

  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'http://localhost:3000/pet');
  xhr.setRequestHeader();
  xhr.addEventListener('load', function(){

    newName.value = ''; //sets the placeholder back to empty

  });

});
