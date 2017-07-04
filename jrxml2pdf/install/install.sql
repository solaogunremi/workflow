SET SCAN OFF
SET TIMING ON

PROMPT install tables

@JRXML_SEQ.sql
@JRXML_REPORT_DEFINITIONS.sql
@JRXML_REPORT_IMAGES.sql
@JRXML_FONTS.sql
@JRXML_LOGGING.sql
@JRXML_RESOURCE_FILES.sql
@JRXML_RESOURCE_ENTRIES.sql
@JRXML_NLS_PARAMETERS.sql
@JRXML_APEX2JRXML_TEMPLATES.sql
@ALTER_JRXML_REPORT_IMAGES.sql

PROMPT install packages
@AS_PDF3_MOD.pls
@PK_JRXML2PDF_LOG.pls
@PK_JRXML2PDF_TYPES.pls
@PK_JRXML2PDF_UTIL.pls
@PK_JRXML2PDF_CHARTS.pls
@PK_JRXML2PDF_LOADER.pls
@PK_JRXML2PDF_REPGEN.pls
@PK_JRXML2PDF_APEX2JRXML.pls

PROMPT install NLS-seed-data
@INSERT_NLS_DATA.sql

PROMPT install demo-temapltes
@INSERT_TEMPLATES.sql

PROMPT finished

