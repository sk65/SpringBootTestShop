INSERT INTO user (id,
                  email,
                  first_name,
                  last_name,
                  password,
                  active,
                  user_avatar_file)
VALUES (1,
        'admin@mail.com',
        'admin',
        'admin',
        '$2a$08$rtHUAhCzwwGhQ/ZvrH61o./lXzFqtoCikc7O5lQmAL0WlAnuKekR.',
        true, 'anonim.png');
INSERT INTO user_role(user_id, roles)
VALUES (1, 'USER'),
       (1, 'ADMIN');

