-- schema.sql
CREATE TABLE Movies (
  movie_id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  language TEXT,
  release_date DATE
);
CREATE TABLE Theatres (
  theatre_id INTEGER PRIMARY KEY,
  theatre_name TEXT NOT NULL,
  location TEXT
);
CREATE TABLE Shows (
  show_id INTEGER PRIMARY KEY,
  movie_id INTEGER NOT NULL,
  theatre_id INTEGER NOT NULL,
  show_time TEXT,
  show_date DATE,
  ticket_price REAL,
  total_seats INTEGER,
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
  FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id)
);
CREATE TABLE Bookings (
  booking_id INTEGER PRIMARY KEY,
  show_id INTEGER NOT NULL,
  seats_booked INTEGER NOT NULL,
  booking_time DATETIME,
  FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);
