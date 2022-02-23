--liquibase formatted sql changelog 
-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: changeLog.xml
-- Ran at: 2/15/22 4:10 PM
-- Against: postgres@offline:postgresql
-- Liquibase version: 4.7.1
-- *********************************************************************

-- Changeset changeLog.xml::1587580817300-1::TsviZ
CREATE TABLE "execSales" (id INTEGER NOT NULL, name VARCHAR(255), CONSTRAINT test1_pkey PRIMARY KEY (id));

-- Changeset changeLog.xml::1587580817300-2::AmyS
CREATE VIEW "myView2" AS SELECT "execSales".id,
    "execSales".name
   FROM "execSales";

-- Changeset changeLog.xml::1587580817300-3::JohnK
CREATE VIEW "newView" AS SELECT "execSales".id,
    "execSales".name
   FROM "execSales";

-- Changeset changeLog.xml::1587580817300-4::PaulP
CREATE TABLE "salesTable" (id INTEGER NOT NULL, name VARCHAR(20), region VARCHAR(20), market VARCHAR(20));

