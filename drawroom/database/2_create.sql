-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-30 11:27:23.468

-- tables
-- Table: friendship
CREATE TABLE friendship (
                            id serial  NOT NULL,
                            user_id int  NOT NULL,
                            friend_id int  NOT NULL,
                            status char(1)  NOT NULL,
                            CONSTRAINT friendship_pk PRIMARY KEY (id)
);

-- Table: image
CREATE TABLE image (
                       id serial  NOT NULL,
                       data bytea  NOT NULL,
                       CONSTRAINT image_pk PRIMARY KEY (id)
);

-- Table: post
CREATE TABLE post (
                      id serial  NOT NULL,
                      user_id int  NOT NULL,
                      image_id int  NOT NULL,
                      timestamp timestamp  NOT NULL,
                      status char(1)  NOT NULL,
                      like_count int  NOT NULL,
                      CONSTRAINT post_pk PRIMARY KEY (id)
);

-- Table: profile
CREATE TABLE profile (
                         id serial  NOT NULL,
                         user_id int  NOT NULL,
                         cover_id int  NULL,
                         image_id int  NULL,
                         CONSTRAINT profile_pk PRIMARY KEY (id)
);

-- Table: role
CREATE TABLE role (
                      id serial  NOT NULL,
                      name varchar(50)  NOT NULL,
                      CONSTRAINT role_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
                        id serial  NOT NULL,
                        role_id int  NOT NULL,
                        username varchar(255)  NOT NULL,
                        password varchar(255)  NOT NULL,
                        status char(1)  NOT NULL,
                        CONSTRAINT username UNIQUE (username) NOT DEFERRABLE  INITIALLY IMMEDIATE,
                        CONSTRAINT user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: friendship_friend_user (table: friendship)
ALTER TABLE friendship ADD CONSTRAINT friendship_friend_user
    FOREIGN KEY (friend_id)
        REFERENCES "user" (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: friendship_user (table: friendship)
ALTER TABLE friendship ADD CONSTRAINT friendship_user
    FOREIGN KEY (user_id)
        REFERENCES "user" (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: post_image (table: post)
ALTER TABLE post ADD CONSTRAINT post_image
    FOREIGN KEY (image_id)
        REFERENCES image (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: post_user (table: post)
ALTER TABLE post ADD CONSTRAINT post_user
    FOREIGN KEY (user_id)
        REFERENCES "user" (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: profile_cover_image (table: profile)
ALTER TABLE profile ADD CONSTRAINT profile_cover_image
    FOREIGN KEY (cover_id)
        REFERENCES image (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: profile_image (table: profile)
ALTER TABLE profile ADD CONSTRAINT profile_image
    FOREIGN KEY (image_id)
        REFERENCES image (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: profile_user (table: profile)
ALTER TABLE profile ADD CONSTRAINT profile_user
    FOREIGN KEY (user_id)
        REFERENCES "user" (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: user_role (table: user)
ALTER TABLE "user" ADD CONSTRAINT user_role
    FOREIGN KEY (role_id)
        REFERENCES role (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- End of file.