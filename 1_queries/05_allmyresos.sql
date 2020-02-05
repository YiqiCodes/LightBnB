SELECT properties.*, reservations.*, avg(property_reviews.rating) as average_rating
FROM properties
JOIN property_reviews ON property_reviews.property_id = properties.id
JOIN reservations ON reservations.property_id = properties.id
JOIN users ON users.id = reservations.guest_id
WHERE reservations.guest_id = 1
AND reservations.end_date < now():: date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;
