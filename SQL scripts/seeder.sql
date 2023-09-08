use adlister_db;

INSERT INTO users (firstname, lastname, username, email, password)
VALUES ('jose',
        'delaluz',
        'dmoney23',
        'real@email.com',
        'password'
        );
INSERT INTO users (firstname, lastname, username, email, password)
VALUES ('Luis',
        'Esquivel',
        'GHØ$TFA¢£_210',
        'that.developer@email.com',
        'password'
       );
INSERT INTO ads (user_id, title, link, description)
VALUES (1,
        'Hello world',
        'www.myspace.com',
        'tom is really my friend'
       );
INSERT INTO ads (user_id, title, link, description)
VALUES (2,
        'can you do a kickflip poser?',
        'www.coolmathgames.com',
        'this is a description'
       );