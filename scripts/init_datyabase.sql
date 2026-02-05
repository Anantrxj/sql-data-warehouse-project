/*
===============================================================================================
Create Database and Schemas
===============================================================================================
Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
within the database: 'bronze', 'silver', and 'gold'.

*/

USE master ;
Go
-- Create Datawarehouse Database
CREATE DATABASE Datawarehouse;

USE Datawarehouse;
-- Create Schemas
CREATE SCHEMA Bronze;
GO
CREATE SCHEMA Silver;
GO
CREATE SCHEMA Gold;
GO
