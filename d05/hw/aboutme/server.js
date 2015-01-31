var express = require("express");
var cors = require('cors');
var bodyParser = require('body-parser');
var sqlite3 = require("sqlite3").verbose();
var db = new sqlite3.Database("aboutme.db");

var app = express();

app.use(cors());
app.use(bodyParser.json({extended: false}));

var person = [];

app.use('/public', express.static(__dirname + '/public')); //serving static html files in JS express
//for when you go to app.get('/'), because its a static index.html,
//this is how you point to it. vs index.ejs


app.get('/', function(req, res){

});

app.post('/', function(req, res) { //create pet with empty obj
  var name = req.body.name;
  var town = req.body.town;
  var sign = req.body.sign;

  db.run("INSERT INTO aboutme (name, town, sign) VALUES (?,?,?)", name, town, sign, function(err){ //yet to take anythign out, so we use err not row
    if (err) { throw err; }
    var id = this.lastID; //way to get the ID of the last thing you inserted
    db.get("SELECT * FROM pets WHERE id=?", id, function(err, row){
      if (err) { throw err; }
      res.json(row); //shows up in AJAX receive section then call back to put it on the page
    })
  });
});

app.listen(3000);
console.log('listening on port 3000');
