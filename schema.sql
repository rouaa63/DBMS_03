
PRAGMA foreign_keys = ON;

CREATE TABLE author (
    author_id INTEGER PRIMARY KEY,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL
);

CREATE TABLE book (
    isbn TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    pub_year INTEGER
);

CREATE TABLE writes (
    author_id INTEGER,
    isbn TEXT,
    PRIMARY KEY (author_id, isbn),
    FOREIGN KEY (author_id)
        REFERENCES author(author_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (isbn)
        REFERENCES book(isbn)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE copy (
    copy_no INTEGER PRIMARY KEY,
    isbn TEXT,
    shelf_loc TEXT,
    FOREIGN KEY (isbn)
        REFERENCES book(isbn)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE member (
    member_no INTEGER PRIMARY KEY,
    full_name TEXT,
    email TEXT UNIQUE,
    enrolled_on DATE
);

CREATE TABLE loan (
    loan_id INTEGER PRIMARY KEY,
    member_no INTEGER,
    copy_no INTEGER,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (member_no)
        REFERENCES member(member_no)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (copy_no)
        REFERENCES copy(copy_no)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
