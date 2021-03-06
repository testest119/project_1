

use mysql;
update user set password=PASSWORD('輸入密碼這裡') where User='root';
flush privileges;
quit 


create database demo default character set utf16 default collate utf16_general_ci;
CREATE USER 'test'@'%' IDENTIFIED BY '輸入密碼這裡';
GRANT ALL PRIVILEGES ON demo.* TO 'test'@'%';
flush privileges;


select sysdate(), sleep(1), sysdate();
DROP TABLE IF EXISTS ENQ_INFO;
CREATE TABLE ENQ_INFO
(
ENQ_NO INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
ENQ_NAME VARCHAR(25),
DESIG VARCHAR(25),
DATE DATETIME,
STREET VARCHAR(25),
COLONY VARCHAR(25),
CITY VARCHAR(25),
PHONE VARCHAR(25),
HOW_KNOW VARCHAR(25),
PRIMARY KEY (ENQ_NO)
);
DROP TABLE IF EXISTS QUOTE_INFO;
CREATE TABLE QUOTE_INFO
(
QUOTE_NO INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
ENQ_NO INT,
DATE DATETIME,
MODAL VARCHAR(25),
PROCESSOR VARCHAR(25),
RAM VARCHAR(25),
HARDDISK VARCHAR(25),
FDD VARCHAR(25),
CDD VARCHAR(25),
MONITOR VARCHAR(25),
PRINTER VARCHAR(25),
MMKIT VARCHAR(25),
OTHERS VARCHAR(25),
PRIMARY KEY (QUOTE_NO)
);
DROP TABLE IF EXISTS ORDER_INFO;
CREATE TABLE ORDER_INFO
(
ORD_NO INT UNSIGNED NOT NULL AUTO_INCREMENT,
CUST_ID VARCHAR(25),
ENQ_NO INT,
QUOTE_NO INT,
ORDER_DATE DATETIME,
ORD_AMOUNT DOUBLE,
AMT_PAYED DOUBLE,
ORD_STATUS VARCHAR(25),
PRIMARY KEY (ORD_NO)
);
DROP TABLE IF EXISTS CUST_INFO;
CREATE TABLE CUST_INFO(
CUS_ID VARCHAR(25) NOT NULL,
CUS_NAME VARCHAR(25),
DESIG VARCHAR(25),
STREET VARCHAR(25),
COLONY VARCHAR(25),
CITY VARCHAR(25),
PHONE VARCHAR(25),
EMAIL VARCHAR(25),
PRIMARY KEY (CUS_ID)
);
DROP TABLE IF EXISTS AMC_INFO;
CREATE TABLE AMC_INFO(
CUST_ID VARCHAR(25) NOT NULL,
AMC_AMT DOUBLE,
AMT_PAYED DOUBLE,
AMC_START DATETIME,
AMC_EXPR DATETIME
);
DROP TABLE IF EXISTS SERVICE_REQ;
CREATE TABLE SERVICE_REQ(
NAME_OR_ID VARCHAR(25),
ADDRESS VARCHAR(25),
PHONE VARCHAR(25),
REQ_DATE DATETIME,
PROBLEM VARCHAR(25),
RES_DATE DATETIME,
STATUS VARCHAR(25),
AMT_CHARGED DOUBLE,
ASSIGNEDTO VARCHAR(25)
);
DROP TABLE IF EXISTS SPARES_INFO;
CREATE TABLE SPARES_INFO(
SPARE_NAME VARCHAR(25),
BUY_DATE DATETIME,
AMT DOUBLE,
AMT_PAYED DOUBLE,
BOUGHT_FROM VARCHAR(25),
DESCRIP VARCHAR(50)
);
DROP TABLE IF EXISTS EMP_INFO;
CREATE TABLE EMP_INFO(
NAME VARCHAR(25) NOT NULL,
ADDR VARCHAR(25),
PHONE VARCHAR(25),
SALARY DOUBLE,
QUALI VARCHAR(25),
EXPR DOUBLE,
PRIMARY KEY (NAME)
);
DROP TABLE IF EXISTS TADA_INFO;
CREATE TABLE TADA_INFO(
NAME VARCHAR(25),
DATE DATETIME,
AMOUNT DOUBLE,
PURPOSE VARCHAR(250)
);
DROP TABLE IF EXISTS CASH_BOOK;
CREATE TABLE CASH_BOOK(
NAME VARCHAR(25),
DATE DATETIME,
REC_ISS VARCHAR(25),
AMT DOUBLE,
DESCRIPTION VARCHAR(250)
);

ALTER TABLE demo.CASH_BOOK MODIFY COLUMN NAME varchar(25) NULL COMMENT 'Name of person';
ALTER TABLE demo.CASH_BOOK MODIFY COLUMN `DATE` datetime NULL COMMENT 'Date';
ALTER TABLE demo.CASH_BOOK MODIFY COLUMN REC_ISS varchar(10) NULL COMMENT 'Cash  receiving or issuing';
ALTER TABLE demo.CASH_BOOK MODIFY COLUMN AMT decimal(10,2) NULL COMMENT 'Amount';
ALTER TABLE demo.CASH_BOOK MODIFY COLUMN DESCRIPTION varchar(250) NULL COMMENT 'Description';


ALTER TABLE demo.TADA_INFO MODIFY COLUMN NAME varchar(25) NULL COMMENT 'Name  of employee';
ALTER TABLE demo.TADA_INFO MODIFY COLUMN `DATE` datetime NULL COMMENT 'Date';
ALTER TABLE demo.TADA_INFO MODIFY COLUMN AMOUNT decimal(10,2) NULL COMMENT 'Amount taken';
ALTER TABLE demo.TADA_INFO MODIFY COLUMN PURPOSE varchar(250) NULL COMMENT 'Purpose';

ALTER TABLE demo.TADA_INFO ADD CONSTRAINT TADA_INFO_EMP_INFO_FK FOREIGN KEY (NAME) REFERENCES demo.EMP_INFO(NAME);

ALTER TABLE demo.EMP_INFO MODIFY COLUMN NAME varchar(25) NOT NULL COMMENT 'Name of service Eng.';
ALTER TABLE demo.EMP_INFO MODIFY COLUMN ADDR varchar(250) NULL COMMENT 'Address';
ALTER TABLE demo.EMP_INFO MODIFY COLUMN PHONE varchar(25) NULL COMMENT 'Phone number';
ALTER TABLE demo.EMP_INFO MODIFY COLUMN SALARY decimal(10,2) NULL COMMENT 'Salary';
ALTER TABLE demo.EMP_INFO MODIFY COLUMN QUALI varchar(25) NULL COMMENT 'Qualification';
ALTER TABLE demo.EMP_INFO MODIFY COLUMN EXPR int(10) NULL COMMENT 'Experience';

ALTER TABLE demo.SPARES_INFO MODIFY COLUMN SPARE_NAME varchar(25) NULL COMMENT 'Name of spare';
ALTER TABLE demo.SPARES_INFO MODIFY COLUMN BUY_DATE datetime NULL COMMENT 'Bought date';
ALTER TABLE demo.SPARES_INFO CHANGE BOUGHT_FROM BUY_FROM varchar(25) NULL COMMENT 'Bought from';
ALTER TABLE demo.SPARES_INFO MODIFY COLUMN BUY_FROM varchar(25) NULL COMMENT 'Bought from';
ALTER TABLE demo.SPARES_INFO MODIFY COLUMN AMT int(10) NULL COMMENT 'Amount';
ALTER TABLE demo.SPARES_INFO MODIFY COLUMN AMT_PAYED decimal(10,2) NULL COMMENT 'Payed amount';
ALTER TABLE demo.SPARES_INFO MODIFY COLUMN DESCRIP varchar(50) NULL COMMENT 'Description';

ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN NAME_OR_ID varchar(25) NULL COMMENT 'Name or id of customer';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN ADDRESS varchar(250) NULL COMMENT 'Address  of customer';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN PHONE varchar(25) NULL COMMENT 'Phone number';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN REQ_DATE datetime NULL COMMENT 'Requested date';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN PROBLEM varchar(250) NULL COMMENT 'Problem';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN RES_DATE datetime NULL COMMENT 'Responded date';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN STATUS varchar(25) NULL COMMENT 'Status';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN AMT_CHARGED decimal(10,2) NULL COMMENT 'Charge';
ALTER TABLE demo.SERVICE_REQ MODIFY COLUMN ASSIGNEDTO varchar(25) NULL COMMENT 'Assign engineer';


ALTER TABLE demo.SERVICE_REQ ADD CONSTRAINT SERVICE_REQ_EMP_INFO_FK FOREIGN KEY (ASSIGNEDTO) REFERENCES demo.EMP_INFO(NAME);


ALTER TABLE demo.AMC_INFO MODIFY COLUMN CUST_ID varchar(25) NOT NULL COMMENT 'Customer id';
ALTER TABLE demo.AMC_INFO MODIFY COLUMN AMC_AMT decimal(10,2) NULL COMMENT 'Amc charge';
ALTER TABLE demo.AMC_INFO MODIFY COLUMN AMT_PAYED decimal(10,2) NULL COMMENT 'Amount payed';
ALTER TABLE demo.AMC_INFO MODIFY COLUMN AMC_START datetime NULL COMMENT 'Amc begin date';
ALTER TABLE demo.AMC_INFO MODIFY COLUMN AMC_EXPR datetime NULL COMMENT 'Amc  closing date';


ALTER TABLE demo.AMC_INFO ADD CONSTRAINT AMC_INFO_CUST_INFO_FK FOREIGN KEY (CUST_ID) REFERENCES demo.CUST_INFO(CUS_ID);


ALTER TABLE demo.CUST_INFO MODIFY COLUMN CUS_ID varchar(25) NOT NULL COMMENT 'Customer id';
ALTER TABLE demo.CUST_INFO MODIFY COLUMN CUS_NAME varchar(25) NULL COMMENT 'Name';
ALTER TABLE demo.CUST_INFO MODIFY COLUMN DESIG varchar(25) NULL COMMENT 'Occupation';
ALTER TABLE demo.CUST_INFO MODIFY COLUMN STREET varchar(25) NULL COMMENT 'Street name';
ALTER TABLE demo.CUST_INFO MODIFY COLUMN COLONY varchar(25) NULL COMMENT 'Street name';
ALTER TABLE demo.CUST_INFO MODIFY COLUMN CITY varchar(25) NULL COMMENT 'City name';
ALTER TABLE demo.CUST_INFO MODIFY COLUMN PHONE varchar(25) NULL COMMENT 'Phone number';
ALTER TABLE demo.CUST_INFO MODIFY COLUMN EMAIL varchar(25) NULL COMMENT 'Email add';


ALTER TABLE demo.ORDER_INFO MODIFY COLUMN ORD_NO int(10) NOT NULL auto_increment COMMENT 'Order serial';
ALTER TABLE demo.ORDER_INFO MODIFY COLUMN CUST_ID varchar(25) NULL COMMENT 'Customer id';
ALTER TABLE demo.ORDER_INFO MODIFY COLUMN ENQ_NO int(10) NULL COMMENT 'Enquiry number';
ALTER TABLE demo.ORDER_INFO MODIFY COLUMN QUOTE_NO int(10) NULL COMMENT 'Quotation number';
ALTER TABLE demo.ORDER_INFO MODIFY COLUMN ORDER_DATE datetime NULL COMMENT 'Ordered date';
ALTER TABLE demo.ORDER_INFO MODIFY COLUMN ORD_AMOUNT decimal(10,2) NULL COMMENT 'Order amount';
ALTER TABLE demo.ORDER_INFO MODIFY COLUMN AMT_PAYED decimal(10,2) NULL COMMENT 'Amount payed';
ALTER TABLE demo.ORDER_INFO MODIFY COLUMN ORD_STATUS varchar(25) NULL COMMENT 'Status of order';
ALTER TABLE demo.ORDER_INFO CHANGE CUST_ID CUS_ID varchar(25) NULL COMMENT 'Customer id';


ALTER TABLE demo.ENQ_INFO MODIFY COLUMN ENQ_NO int(10) NOT NULL auto_increment;
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN QUOTE_NO int(10) NOT NULL auto_increment;


ALTER TABLE demo.ORDER_INFO ADD CONSTRAINT ORDER_INFO_CUST_INFO_FK FOREIGN KEY (CUS_ID) REFERENCES demo.CUST_INFO(CUS_ID);
ALTER TABLE demo.ORDER_INFO ADD CONSTRAINT ORDER_INFO_ENQ_INFO_FK FOREIGN KEY (ENQ_NO) REFERENCES demo.ENQ_INFO(ENQ_NO);
ALTER TABLE demo.ORDER_INFO ADD CONSTRAINT ORDER_INFO_QUOTE_INFO_FK FOREIGN KEY (QUOTE_NO) REFERENCES demo.QUOTE_INFO(QUOTE_NO);


ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN QUOTE_NO int(10) NOT NULL auto_increment COMMENT 'Quotation number';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN ENQ_NO int(10) NULL COMMENT 'Enquiry number';
ALTER TABLE demo.QUOTE_INFO ADD QUOTE_NAME varchar(25) NULL COMMENT 'Requester name';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN `DATE` datetime NULL COMMENT 'Date of taking q';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN MODAL varchar(25) NULL COMMENT 'System  modal';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN PROCESSOR varchar(25) NULL COMMENT 'Processor type';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN RAM varchar(25) NULL COMMENT 'Ram size';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN HARDDISK varchar(25) NULL COMMENT 'Hard  disk capacity';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN FDD varchar(25) NULL COMMENT 'Floppy drive';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN CDD varchar(25) NULL COMMENT 'CD drive';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN MONITOR varchar(25) NULL COMMENT 'Monitor type';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN PRINTER varchar(25) NULL COMMENT 'Printer';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN MMKIT varchar(25) NULL COMMENT 'Multimedia kit';
ALTER TABLE demo.QUOTE_INFO MODIFY COLUMN `OTHERS` varchar(25) NULL COMMENT 'Other';


ALTER TABLE demo.QUOTE_INFO ADD CONSTRAINT QUOTE_INFO_ENQ_INFO_FK FOREIGN KEY (ENQ_NO) REFERENCES demo.ENQ_INFO(ENQ_NO);


ALTER TABLE demo.ENQ_INFO MODIFY COLUMN ENQ_NO int(10) NOT NULL auto_increment COMMENT 'Serial number';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN ENQ_NAME varchar(25) NULL COMMENT 'Person name';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN DESIG varchar(25) NULL COMMENT 'Occupation';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN `DATE` datetime NULL COMMENT 'Date of enquiry';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN STREET varchar(25) NULL COMMENT 'Street name';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN COLONY varchar(25) NULL COMMENT 'Colony name';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN CITY varchar(25) NULL COMMENT 'City name';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN PHONE varchar(25) NULL COMMENT 'Phone number';
ALTER TABLE demo.ENQ_INFO MODIFY COLUMN HOW_KNOW varchar(25) NULL COMMENT 'Media through';


ALTER TABLE demo.CUST_INFO ADD SHOT BLOB NULL COMMENT 'Mugshot';
