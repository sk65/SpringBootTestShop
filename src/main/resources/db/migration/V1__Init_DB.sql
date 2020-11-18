create table product
(
    id          bigint not null auto_increment,
    description varchar(255),
    filename    varchar(255),
    name        varchar(255),
    price       double precision,
    primary key (id)
) ;
create table user
(
    id               bigint not null auto_increment,
    activation_code  varchar(255),
    active           boolean not null ,
    email            varchar(255) not null ,
    first_name       varchar(255),
    last_name        varchar(255),
    password         varchar(255) not null ,
    user_avatar_file varchar(255),
    primary key (id)
);
create table user_role
(
    user_id bigint not null,
    roles   varchar(255)
);
alter table user_role
    add constraint user_role_user_fk
    foreign key (user_id) references user (id)
