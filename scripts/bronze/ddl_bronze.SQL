/*
============================================================================================================
DDL Script: Create Bronze Tables
===========================================================================================================
Script Purpose:
This script creates tables in the 'bronze' schema, dropping existing tables
if they already exist.
Run this script to re-define the DDL structure of 'bronze' Tables

*/

EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY 
		PRINT '=================================================================================================='
		PRINT 'Loading Bronze layer'
		PRINT '=================================================================================================='



		PRINT '-------------------------------------------------------------------------------------------------'
		PRINT 'Loading CRM tables'
		PRINT '-------------------------------------------------------------------------------------------------'

		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\VICTUS\OneDrive\Desktop\udemy\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR = ',',
			TABLOCK
			);


		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\VICTUS\OneDrive\Desktop\udemy\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR = ',',
			TABLOCK
			);


		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\VICTUS\OneDrive\Desktop\udemy\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR = ',',
			TABLOCK
			);


		PRINT '-------------------------------------------------------------------------------------------------'
		PRINT 'Loading ERP tables'
		PRINT '-------------------------------------------------------------------------------------------------'


		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\VICTUS\OneDrive\Desktop\udemy\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR = ',',
			TABLOCK
			);

		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\VICTUS\OneDrive\Desktop\udemy\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR = ',',
			TABLOCK
			);

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\VICTUS\OneDrive\Desktop\udemy\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2 ,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		END TRY 
		BEGIN CATCH 
		PRINT'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT'ERROR MESSAGE' + CAST(ERROR_NUMBER(),AS NVARCHAR);
		END CATCH
END
