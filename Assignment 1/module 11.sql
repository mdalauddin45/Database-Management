CREATE DATABASE StudentLibManagement;

use StudentLibManagement;
DROP TABLE BOOK;
CREATE TABLE STUDENT
(
	ROLL VARCHAR(50) PRIMARY KEY,
    NAME VARCHAR(50)
);

CREATE TABLE LIBRAIAN
(
	LIB_ID VARCHAR(50) PRIMARY KEY,
    LIB_NAME VARCHAR(50)
);

CREATE TABLE BOOK
(
	BOOK_ID VARCHAR(50) PRIMARY KEY,
    BOOK_NAME VARCHAR(50),
	BOOK_GENER VARCHAR(50)
);

CREATE TABLE BORROW
(
	WHO_BORROW_ROLL VARCHAR(50),
    WHICH_BOOK_ID VARCHAR(50),
	BORROW_DATE DATE,
    RETURN_DATE DATE,
    FOREIGN KEY(WHO_BORROW_ROLL) REFERENCES STUDENT(ROLL),
	FOREIGN KEY(WHICH_BOOK_ID) REFERENCES BOOK(BOOK_ID),
    PRIMARY KEY (WHO_BORROW_ROLL,WHICH_BOOK_ID)
);

CREATE TABLE PERMISSION
(
	WHICH_BOOK_ID VARCHAR(50),
    WHO_PERMITED_LIB_ID VARCHAR(50),
	FOREIGN KEY(WHO_PERMITED_LIB_ID) REFERENCES LIBRAIAN(LIB_ID),
	FOREIGN KEY(WHICH_BOOK_ID) REFERENCES BOOK(BOOK_ID),
    PRIMARY KEY (WHICH_BOOK_ID,WHO_PERMITED_LIB_ID)
);