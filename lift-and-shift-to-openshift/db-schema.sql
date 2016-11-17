use sampledb;

CREATE TABLE `customer` (   `CUST_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,   `NAME` varchar(100) NOT NULL,   `AGE` int(10) unsigned NOT NULL,   PRIMARY KEY (`CUST_ID`) ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert into customer values ('10','qa-john',30);
insert into customer values ('11','qa-Smith',30);
insert into customer values ('12','qa-Johnson',30);
insert into customer values ('13','qa-Jones',30);

