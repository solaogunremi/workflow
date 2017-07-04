CREATE OR REPLACE PACKAGE pkwf_90 AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Stockbroking Interface to Workflow <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 21-MAR-2016 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  TYPE r_99 IS RECORD (
          p1      VARCHAR2(50),
          p2      VARCHAR2(50)
        );
  --
  --
  /**
    * Returns the row key of a processed {inserted/modified} record.
    * @param pi_rec Input Data
  */
  FUNCTION  fn_99_1 (pi_p1 IN VARCHAR2,
                     pi_p2 IN VARCHAR2) RETURN BOOLEAN;
  --
  --
END pkwf_90;
/

