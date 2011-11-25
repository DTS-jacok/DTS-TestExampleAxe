HarnessDemo
============

Overview
---------

Sample Axe test project for demonstrating core AxeHarness features.
Tests are included for testing the following components; .NET API, Web Service, Database and XML.


Setup
------

The web service tests require the HarnessDemo service to be deployed to the local host.
Copy lib\HarnessDemo.asmx to the root of the local web server

The database tests require and ODBC datasource to be created call HarnessDemo. 
This should point to the full path of DB\HarnessDemo.mdb


Tests
------

APITests - .NET class tests
DBTests - database tests
WebServiceTests - Web Service tests
XMLTests - XML document tests

DemoTests - end-to-end test scenarios using combinations of test types

RunMaster - contains RunAll run table for running all tests



Ends
