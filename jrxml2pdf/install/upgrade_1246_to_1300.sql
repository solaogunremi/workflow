SET SCAN OFF
SET TIMING ON

PROMPT install packages
@PK_JRXML2PDF_TYPES.pls
@PK_JRXML2PDF_LOADER.pls
@PK_JRXML2PDF_REPGEN.pls

PROMPT finished
