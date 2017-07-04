DB-requirements

1. A schema with resource-rights
2. To run the demo-report you need the tables from the APEX-demo-application
3. The packages make use of UTL_FILE, you may need to grant access to that package
   - sqlplus sys/password
   - GRANT EXECUTE ON UTL_FILE TO <USER>
4. The package makes use of the view NLS_SESSION_PARAMETERS, the grants to access it should be given be default
5. If you want to use the map-component and you're on 11G, you need to grant access to http://maps.google.com, 
   as the google api is used to render the maps. 
   You can use the script ACL_FOR_GOOGLE_MAPS.sql in the install-dir (must be run as sys)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Installation "by hand"
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

Installation of database-objects

1. go to the install-directory
2. connect to the database using sqlplus and your schema where you want to install to
   - sqlplus user/password

3. run install.sql

   @install.sql

   or if you already have installed a version prior to 0.8.0.0

   @upgrade_0700_to_0800.sql

   or if you already have installed a version prior to 0.9.0.0

   @upgrade_0800_to_0900.sql

   or if you already have installed a version prior to 1.0.0.0

   @upgrade_0900_to_1000.sql

   or if you already have installed a version prior to 1.1.3.4

   @upgrade_1000_to_1200.sql
   
   or if you already have installed a version prior to 1.2.0.1

   @upgrade_1200_to_1201.sql

   or if you already have installed a version prior to 1.2.0.2

   @upgrade_1201_to_1202.sql
   
   or if you already have installed a version prior to 1.2.3.3

   @upgrade_1202_to_1233.sql

   or if you already have installed a version prior to 1.2.3.3

   @upgrade_1233_to_1245.sql

   or if you already have installed a version prior to 1.2.4.5

   @upgrade_1245_to_1246.sql

   or if you already have installed a version prior to 1.2.4.6

   @upgrade_1246_to_1300.sql

   or if you already have installed a version prior to 1.3.0.0

   @upgrade_1300_to_1311.sql

   install tables and packages by hand (using your favorite sql-tool)

   - JRXML_REPORT_DEFINITIONS.sql
   - JRXML_REPORT_IMAGES.sql
   - JRXML_FONTS.sql
   - JRXML_LOGGING.sql
   - JRXML_SEQ.sql
   - JRXML_RESOURCE_FILES.sql
   - JRXML_RESOURCE_ENTRIES.sql
   - JRXML_NLS_PARAMETERS.sql
   - JRXML_APEX2JRXML_TEMPLATES.sql
   - AS_PDF3_MOD.pls
   - PK_JRXML2PDF_LOG.pls
   - PK_JRXML2PDF_TYPES.pls
   - PK_JRXML2PDF_UTIL.pls
   - PK_JRXML2PDF_LOADER.pls
   - PK_JRXML2PDF_CHARTS.pls
   - PK_JRXML2PDF_REPGEN.pls
   - PK_JRXML2PDF_APEX2JRXML.pls
   - INSTALL_NLS_DATA.sql
   - INSTALL_TEMPLATES.sql

4. for using the demo-reports in the database, run demodata.sql and demodata2.sql (since 0.7.0.0)and demodata3.sql (since 0.8.0.0) from sqlplus

   @demodata.sql
   @demodata2.sql
   @demodata3.sql
   @demodata4.sql
   @demodata5.sql
   @demodata6.sql

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Installation by APEX
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

1. Install the application-export-file apex/f114.sql into your workspace.
   This will install an application to manage all the PL-jrxml2pdf-objects
   and to run reports and view the result. All required DB-objects come with
   the install

   - install application
   - install supported objects


Client-Requirements (for developing reports)

1. Install iReport-Designer from JasperSoft (tested with version 4.7.0), its up to you to make sure you agree the license terms.
2. make sure the file ../java_for_ireport/jrxml2pdf.jar is the in iReport-classpath
3. The jrxml-files in ../jrxml-definitions match those from the demodata.dmp

Running reports in batch

1. for testing reports from batch you need to create a directory in the database to output the pdf's
   - sqlplus user/password
   - CREATE DIRECTORY MY_DIR AS 'c:\temp'

2. for testing in batch, change to directory run
   - edit run_report.sql and set the appropiate report-name
   - sqlplus user/password
   - run_report.sql


Running reports from your own APEX-pages

1. Have a look at page 7 of the delivered APEX-application, there a "On load-Before Header"-process
   which runs the report and shows the result.

2. Alternatively, create a page process "On submit, after validations and computations" of type PL/SQL with something like
   
   DECLARE
     vcName  VARCHAR2(200);
     lParams PK_JRXML2PDF_REPGEN.TPARAMLIST;
     bl      BLOB;
   BEGIN
     vcName:='THE_NAME_OF_YOUR_REPORT_IN_JRXML_REPORT_DEFINITIONS';
     bl    :=PK_JRXML2PDF_REPGEN.FK_RUN(i_vcName=>vcName);
     PK_JRXML2PDF_REPGEN.PR_SHOW_REPORT(bl);
     APEX_APPLICATION.STOP_APEX_ENGINE;
   END;
