-- Get all orders of tarif #2
SELECT * FROM orders WHERE orders.tarif = 2


-- Get the tracking status of all orders

SELECT trackingnumbers.orderId, trackingstatus.status FROM trackingstatus 
LEFT JOIN trackingnumbers ON trackingstatus.internalNum = trackingnumbers.internalNum 
LEFT JOIN orders ON trackingnumbers.orderId = orders.id;


-- Get tracking status of specific order,
SELECT orders.senderId, trackingstatus.status FROM trackingstatus 
LEFT JOIN trackingnumbers ON trackingstatus.internalNum = trackingnumbers.internalNum 
LEFT JOIN orders ON trackingnumbers.orderId = orders.id WHERE orders.senderId = 1;

-- Get all orders that where sent from specific locations
SELECT * FROM senders LEFT JOIN orders ON senders.ID = orders.senderId WHERE senders.location = 3;

-- See how many orders where sent from specific location
SELECT COUNT(*) FROM senders LEFT JOIN orders ON senders.ID = orders.senderId WHERE senders.location = 3;

-- Show all orders sent in august
SELECT * FROM orders WHERE MONTH(orders.sendDate) = 8;

-- Show all orders sent from a specific postal code
SELECT COUNT(*) FROM orders LEFT JOIN senders ON orders.senderId = senders.ID 
LEFT JOIN locations ON senders.location = locations.ID 
WHERE locations.postalCode = "2002"

-- Show all orders send on a specific date by a specific sender
SELECT orders.senderId FROM orders WHERE orders.senderId = 1 AND orders.sendDate = DATE("2020-08-10")

--Show how send packages /mail on a specific Date
SELECT orders.senderId FROM orders WHERE  orders.sendDate = DATE("2020-08-10")

-- Show trackingstatus and price send by a specific sender with a specific shipping option
SELECT orders.senderId, trackingstatus.status, tarifs.price FROM trackingstatus 
LEFT JOIN trackingnumbers ON trackingstatus.internalNum = trackingnumbers.internalNum 
LEFT JOIN orders ON trackingnumbers.orderId = orders.id 
LEFT JOIN tarifs ON orders.tarif = tarifs.ID 
WHERE orders.senderId = 3 AND tarifs.shippingOption = 3

