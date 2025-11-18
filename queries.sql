-- queries.sql
-- Occupancy per show
SELECT
  s.show_id,
  m.title,
  t.theatre_name,
  s.show_date,
  s.show_time,
  s.total_seats,
  IFNULL(SUM(b.seats_booked), 0) AS seats_booked,
  ROUND((IFNULL(SUM(b.seats_booked),0)*100.0)/s.total_seats,2) AS occupancy_pct
FROM Shows s
LEFT JOIN Bookings b ON s.show_id = b.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Theatres t ON s.theatre_id = t.theatre_id
GROUP BY s.show_id;
