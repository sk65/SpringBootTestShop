INSERT INTO user (id, email, password, active, user_avatar_file)
VALUES (1, 'admin@mail.com', 12345, true, 'anonim.png');
INSERT INTO user_role(user_id, roles)
VALUES (1, 'USER'),
       (1, 'ADMIN');