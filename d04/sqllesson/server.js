var express = require("express");
var cors = require('cors');
var bodyParser = require('body-parser');
var sqlite3 = require("sqlite3").verbose();
var db = new sqlite3.Database("petulance.db");

var app = express();
app.use(cors());
app.use(bodyParser.json({extended: false}));

app.get("/pets", function(req,res) { //show
  // convert the pets obj to an array
  db.all("SELECT * FROM pets", function(err, rows){
    if (err) { throw err; }
    res.json(rows);
  });
});

app.post('/pet', function(req, res) { //create pet with empty obj
  var name = req.body.name; //using body-parser here
  var type = req.body.type; //and here

  db.run("INSERT INTO pets (name, type) VALUES (?,?)", name, type, function(err){ //yet to take anythign out, so we use err not row
    if (err) { throw err; }
    var id = this.lastID; //way to get the ID of the last thing you inserted
    db.get("SELECT * FROM pets WHERE id=?", id, function(err, row){
      if (err) { throw err; }
      res.json(row); //shows up in AJAX receive section then call back to put it on the page
    })
  });
});

app.put("/pet/:id", function(req,res) { // update put with edit button
  var id = req.params.id; //from the ajax url
  pets[id].name = req.body.name; //body comes from ajax
  pets[id].type = req.body.type;

  db.run("UPDATE pets SET name = ?, type = ? WHERE id = ?", name, type, id, function(err){
    if (err) { throw err; }
    db.get("SELECT * FROM pets WHERE id = ?", id, function(err, row){
      if (err) { throw err; }
      res.json(row);
    });
  });
});

app.delete('/pet/:id', function(req,res) { // grab id from query to delete
  var id = req.params.id; //grab id from url supplied from the ajax
  db.run("DELETE FROM pets WHERE id = ?", id, function(err){
    if (err) { throw err; }
    res.json({deleted:true});
  });
});


app.listen(3000);
console.log('listening on port 3000');
