DECLARE
   v_rpt_tp VARCHAR2(200);
   v_blb BLOB;
   lParams PK_JRXML2PDF_REPGEN.TPARAMLIST;
   rParam  PK_JRXML2PDF_REPGEN.TPARAMETER;
BEGIN
   --
   v_rpt_tp:= :P1550000010_TYPE;
   rParam.vcName := 'rdc_id';
   rParam.vcValue := :P1550000010_ID;
   lParams(lParams.count+1) := rParam;
   --
   v_blb :=PK_JRXML2PDF_REPGEN.FK_RUN(i_vcName => v_rpt_tp, i_lParams => lParams);   
   --
   UPDATE wf_20_dc
   SET    dc_blb = v_blb
   WHERE  dc_id = :P1550000010_ID;
   --
   COMMIT;
   --
END;