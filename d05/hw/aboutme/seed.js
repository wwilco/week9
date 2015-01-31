var sqlite3 = require("sqlite3").verbose();
var db = new sqlite3.Database("aboutme.db");

db.run("INSERT INTO aboutme (name, town, sign) VALUES (?,?)",
function(err) {
  if (err) { throw err; }
});
