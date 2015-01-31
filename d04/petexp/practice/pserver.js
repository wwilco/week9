var express = require('express');
var cors = require('cors');
var bodyParser = require('body-parser');
var app = express();

app.use(cors());
app.use(bodyParser.json({extended: false}));

var pets = {
  1: {
    id: 1,
    name: "Smelly",
    type: "Cat"
  }
  2: {
    id: 2,
    name: "Marcell",
    type: "Monkey"
  }
}

var numPets = 2;

app.get('/pets', function(req, res){
  var petsArray = [];
  Object.keys(pets).forEach(function(key){
    petsArray.push(pet);
  })
  res.json(petsArray);
});

app.post('/pet', function(req, res){
  numPets++
  newPet = {
    id: numPets,
    name: req.body.name,
    type: req.body.type
  };
  pets[numPets] = newPet;
  res.json(newPet);
});

app.delete('/pet/:id', function(req, res){
  var id = req.params.id;
  delete pets[id];
  res.json({deleted: true});
});



console.log("Listening to 3000 yus!")
app.listen(3000);
