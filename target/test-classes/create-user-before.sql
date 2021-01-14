DELETE
FROM user_role;
DELETE
FROM user;

INSERT INTO user(id, email, first_name, last_name, password, active, user_avatar_file)
VALUES (1, 'test@mail.com', 'Vasia', 'Pupkin', '$2y$08$zafxByXEtxibW73kb3Dvyez/vISipYk8YjPaG9i3H5SYyF8s2r.tK ', true, 'anonim.png');

INSERT INTO user(id, email, first_name, last_name, password, active, user_avatar_file)
VALUES (2, 'admin@mail.com', 'Admin', 'Admin', '$2a$10$vwIp7fyD632fZTPFBdjD0u12qoK0IFxM18Ybv45Tma8520iVt7JBy', true, 'anonim.png');

INSERT INTO user_role(user_id, roles)
VALUES (1, 'USER'),
       (2, 'USER'),
       (2, 'ADMIN');