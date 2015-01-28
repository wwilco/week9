CREATE TABLE dwarfs (
  id INTEGER PRIMARY KEY,
  name TEXT, color TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER dwarfs BEFORE UPDATE ON dwarves BEGIN --whenever the dwarfs table gets updated, do this...
UPDATE dwarves SET updated_at = CURRENT_TIMESTAMP WHERE id = new.id;
END; --setting the updated_at to be accurate and differ from the created_at value

INSERT INTO dwarves (name, color) VALUES ("Happy", "yellow"),
("Dopey", "purple"), ("Sneezy", "yellow"), ("Grumpy", "brown"),
("Doc", "brown"), ("Sleepy", "blue"), ("Bashful", "blue");
