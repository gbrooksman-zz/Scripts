
/*----------------------------------------------------------------------------
	WERCS Oracle Tablespace, Datafile, and User Creation Script

	Author - Steve Giamalis  08/13/2001

	Changes
  -----------------------------------------------------------------------
	
	

----------------------------------------------------------------------------*/


SPOOL C:\ORATEMP\Createts.log;

/*----------------------------------------------------------------------------
 	Build the Tablespaces and Datafiles
        --Comment out if already done
----------------------------------------------------------------------------*/

/*
CREATE TABLESPACE WERCSDATA DATAFILE 'd:\oradata\WERCSDATAFILE' SIZE 500M;

CREATE TABLESPACE WERCSIDX DATAFILE 'd:\oradata\WERCSIDXFILE' SIZE 250M;

CREATE TABLESPACE LOLIDATA DATAFILE 'F:\goldtest\LOLIDATA.DBF' SIZE 2000M autoextend on next 500M;

CREATE TABLESPACE LOLIIDX DATAFILE 'G:\goldtest\LOLIIDX.DBF' SIZE 1000M autoextend on next 500M;


*/

/*----------------------------------------------------------------------------
 	Build the User
----------------------------------------------------------------------------*/


CREATE USER "WERCS" IDENTIFIED BY "WERCS" DEFAULT TABLESPACE "WERCSDATA" TEMPORARY TABLESPACE "TEMP" PROFILE DEFAULT ACCOUNT UNLOCK;


/*----------------------------------------------------------------------------
 	Create default user wercs/wercs with all rights
----------------------------------------------------------------------------*/

GRANT "CONNECT" TO "WERCS";
GRANT "DBA" TO "WERCS" WITH ADMIN OPTION;
GRANT UNLIMITED TABLESPACE TO "WERCS";
ALTER USER "WERCS" DEFAULT ROLE ALL;

SPOOL OFF;

COMMIT;

