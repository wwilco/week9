require 'sqlite3'
require 'pry'
db = SQLite3::Database.new "rolodex.db"

rows = db.execute <<-SQL
create table if not exists friends (
  ID INTEGER PRIMARY KEY,
  name TEXT,
  phone INTEGER
);
SQL

puts "what would you like to do? (C)reate, (R)ead, (U)pdate, or (D)estroy?"
response = gets.chomp.downcase
if response == 'c'
  puts "person's name, please"
  name = gets.chomp.downcase
  puts "person's phone number, please"
  phone = gets.chomp
  db.execute("INSERT INTO friends (name, phone) VALUES (?, ?)", name, phone)
  person = db.execute("SELECT * FROM friends WHERE id=(SELECT MAX(ID) FROM friends);")
  puts "#{name}'s number is #{phone}"
end


if response == 'r'
  all = db.execute("SELECT name, phone FROM friends")
  all.each do |entry|
    puts "the person, #{entry[0]}'s number is #{entry[1]}"
  end
end

if response == 'u'
  all = db.execute("SELECT * FROM friends")
  all.each do |entry|
    puts "#{entry[1]} number is #{entry[2]}. To select #{entry[1]} enter THE ID OF #{entry[0]}"
  end
  puts "which id will you update?"
  id = gets.chomp.downcase
  puts "what is their new number?"
  number = gets.chomp
  db.execute("UPDATE friends SET phone=#{number} WHERE ID=#{id}")
  person = db.execute("SELECT * FROM friends WHERE ID=#{id}")
  puts "#{person[0][1]}'s number is now #{number}"
end

if response == 'd'
  all = db.execute("SELECT * FROM friends")
  all.each do |entry|
    puts "#{entry[1]}'s id is #{entry[0]}'"
  end
  puts "which id will you delete?"
  id = gets.chomp.downcase
  db.execute("DELETE FROM friends WHERE ID=#{id}")
  puts "buuuuurn"
end
