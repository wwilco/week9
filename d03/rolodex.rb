require 'sqlite3'
# http://www.rubydoc.info/gems/sqlite3/1.3.10
require 'pry'
# select a database, or create it if it does not yet exist
db = SQLite3::Database.new "rolodex.db"

# if this is the first time running the code this table will be created, otherwise this step will be skipped
rows = db.execute <<-SQL
create table if not exists friends (
  -- && an ID that is assigned by the database &&
  ID INTEGER PRIMARY KEY,
  -- && a field called name that stores text &&
  name TEXT,
  -- && a field called phone that stores integers &&
  phone INTEGER
);
SQL

# the meat and potatoes
puts "what would you like to do? (C)reate, (R)ead, (U)pdate, or (D)estroy?"
response = gets.chomp.downcase
# create an entry
if response == 'c'
  puts "person's name, please"
  name = gets.chomp.downcase
  puts "person's phone number, please"
  phone = gets.chomp
  # the actual code to insert the new entry
  db.execute("INSERT INTO friends (name, phone) VALUES (?, ?)", name, phone)
  # since the entry automatically happens at the end of the table, we can now select the last entry and display it so the user can see that their entry worked.
  # (&& a select command that takes just the name and phone info from the last entry of friends &&)
  person = db.execute("SELECT * FROM friends WHERE id=(SELECT MAX(ID) FROM friends);")
  # && display the person's name and number in the following format: "so-and-so's number is xxxxxxxxx" &&
  puts "#{name}'s number is #{phone}'"
end
# look everyone up
if response == 'r'
  # grab only the name and phone number of everyone and display them
  all = db.execute("SELECT * FROM friends")
  all.each do |entry|
    binding.pry
    puts "#{entry[1]}'s number is #{entry[2]}'"
  end
end
# update an entry
if response == 'u'
  # get a list of everyone so we can select the correct person by id
  all = db.execute(&& A select command that gets the id, name, and phone number from all entries &&)
  # loop through the names and print them to the terminal
  all.each do |entry|
    && display each entry int he following format:"so-and-so's number is xxxxxx. To select so-and-so, enter THE ID OF SO-AND-SO(this should be their primary key)" &&
  end
  # grab an id and new phone number from the user
  puts "which id will you update?"
  id = gets.chomp.downcase
  puts "what is their new number?"
  number = gets.chomp
  # update the entry
  db.execute(&& use an update command to change the phone number of the id given by the user &&)
  # get the updated entry so the user can see that the change happened
  person = db.execute(&& use a select command to get the name and new phone number from the given id &&)
  && display the person's name and number in the following format: "so-and-so's number is now xxxxxx" &&
end
# delete an entry
if response == 'd'
  # get a list of everyone so we can select the correct person by id
  all = db.execute(&& use a select command to get all entries' id, name, and phone number &&)
  all.each do |entry|
    && display each entry int he following format:"so-and-so's number is xxxxxx. To select so-and-so, enter THE ID OF SO-AND-SO(this should be their primary key)" &&
  end
  puts "which id will you delete?"
  id = gets.chomp.downcase
  # delete the entry
  db.execute(&& use a delete command to remove the entry with the id supplied by the user &&)
  puts "buuuuurn"
end
