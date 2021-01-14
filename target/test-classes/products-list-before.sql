DELETE
FROM product;
INSERT INTO product (id, name, price, description, filename)
VALUES (1, 'milk', 10, 'Very fresh milk', 'milk.jpg'),
       (2, 'meat', 20, 'not a single animal was harmed during the creation process', 'meet.jpg'),
       (3, 'fish', 18.99, 'fish caught from the aquarium', 'fish.jpg'),
       (4, 'bread', 2, 'very tasty bread', 'bread.jpg');