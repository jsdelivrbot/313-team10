CREATE TABLE person(
    id          SERIAL          PRIMARY KEY,
    lastName    VARCHAR(50),
    firstName   VARCHAR(50),
    DOB         DATE
);

CREATE TABLE parentToChild(
    id          SERIAL          PRIMARY KEY,
    parent      INT REFERENCES person(id),
    child       INT REFERENCES person(id)
);


INSERT INTO person(firstName, lastName, DOB) VALUES ('Arturo', 'Aguila', '1/27/1991');
INSERT INTO person(firstName, lastName, DOB) VALUES ('Alex', 'Aguila', '11/29/1994');
INSERT INTO person(firstName, lastName, DOB) VALUES ('Iris', 'Aguila', '12/25/1992');

INSERT INTO person(firstName, lastName, DOB) VALUES ('Silvano', 'Aguila', '9/5/1952');
INSERT INTO person(firstName, lastName, DOB) VALUES ('Mercedes', 'Aguila', '9/4/1951');

INSERT INTO parentToChild(parent, child)
VALUES ((SELECT id FROM person WHERE firstName = 'Silvano' AND lastName = 'Aguila'),
        ((SELECT id FROM person WHERE firstName = 'Arturo' AND lastName = 'Aguila')));
INSERT INTO parentToChild(parent, child)
VALUES ((SELECT id FROM person WHERE firstName = 'Silvano' AND lastName = 'Aguila'),
        ((SELECT id FROM person WHERE firstName = 'Iris' AND lastName = 'Aguila')));
INSERT INTO parentToChild(parent, child)
VALUES ((SELECT id FROM person WHERE firstName = 'Silvano' AND lastName = 'Aguila'),
        ((SELECT id FROM person WHERE firstName = 'Alex' AND lastName = 'Aguila')));

INSERT INTO parentToChild(parent, child)
VALUES ((SELECT id FROM person WHERE firstName = 'Mercedes' AND lastName = 'Aguila'),
        ((SELECT id FROM person WHERE firstName = 'Arturo' AND lastName = 'Aguila')));
INSERT INTO parentToChild(parent, child)
VALUES ((SELECT id FROM person WHERE firstName = 'Mercedes' AND lastName = 'Aguila'),
        ((SELECT id FROM person WHERE firstName = 'Iris' AND lastName = 'Aguila')));
INSERT INTO parentToChild(parent, child)
VALUES ((SELECT id FROM person WHERE firstName = 'Mercedes' AND lastName = 'Aguila'),
        ((SELECT id FROM person WHERE firstName = 'Alex' AND lastName = 'Aguila')));


CREATE USER jimmy WITH PASSWORD 'password1';
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO jimmy;
GRANT USAGE , SELECT ON ALL SEQUENCES IN SCHEMA public TO jimmy;
