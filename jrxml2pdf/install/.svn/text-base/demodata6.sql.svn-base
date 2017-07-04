declare
  v_data clob;
begin
  dbms_lob.createtemporary(v_data, true, DBMS_LOB.SESSION);
  dbms_lob.open(v_data, dbms_lob.LOB_READWRITE);
  v_data := v_data || '<?xml version="1.0" encoding="UTF-8"?>' || unistr('\000a') || 
                    '<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="barchart" language="groovy" pageWidth="595" pageHeight="842" columnWidth="555" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="95c2cb53-6500-41bf-9546-bf6d3b1c9871">' || unistr('\000a') || 
                    '	<property name="i';
  v_data := v_data || 'report.zoom" value="0.75"/>' || unistr('\000a') || 
                    '	<property name="ireport.x" value="0"/>' || unistr('\000a') || 
                    '	<property name="ireport.y" value="8"/>' || unistr('\000a') || 
                    '	<subDataset name="Chartdata" uuid="40abc873-785f-4426-88d3-f9892af721e9">' || unistr('\000a') || 
                    '		<queryString>' || unistr('\000a') || 
                    '			<![CDATA[SELECT CUST_LAST_NAME,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL) ORDER_SUM,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*-0.95 ORDER_SUM2,' || unistr('\000a') || 
                    '       CASE WHEN CUST_LAST_NAME IN (''Dulles'', ''Hartsfield'', ''OHare'') THEN' || unistr('\000a') || 
                    '         10000' || unistr('\000a') || 
                    '       ELSE' || unistr('\000a') || 
                    '         NULL' || unistr('\000a') || 
                    '       END ORDER_SUM3,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.85 ORDER_SUM4,' || unistr('\000a') || 
                    '       S';
  v_data := v_data || 'UM(ORDER_TOTAL)*0.80 ORDER_SUM5,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.75 ORDER_SUM6,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.70 ORDER_SUM7,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.65 ORDER_SUM8,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.60 ORDER_SUM9,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.55 ORDER_SUM10,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.50 ORDER_SUM11,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.45 ORDER_SUM12,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.40 ORDER_SUM13,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.35 ORDER_SUM14,' || unistr('\000a') || 
                    '       SUM(ORDER_TOTAL)*0.30 ORDER_SUM15' || unistr('\000a') || 
                    '  FROM DEMO_ORDERS DO,' || unistr('\000a') || 
                    '       DEMO_CUSTOMERS DC' || unistr('\000a') || 
                    ' WH';
  v_data := v_data || 'ERE DO.CUSTOMER_ID=DC.CUSTOMER_ID' || unistr('\000a') || 
                    ' GROUP BY CUST_LAST_NAME]]>' || unistr('\000a') || 
                    '		</queryString>' || unistr('\000a') || 
                    '		<field name="CUST_LAST_NAME" class="java.lang.String"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM2" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM3" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM4" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM5" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM6" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORD';
  v_data := v_data || 'ER_SUM7" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM8" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM9" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM10" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM11" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM12" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM13" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM14" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '		<field name="ORDER_SUM15" class="java.math.BigDecim';
  v_data := v_data || 'al"/>' || unistr('\000a') || 
                    '	</subDataset>' || unistr('\000a') || 
                    '	<queryString>' || unistr('\000a') || 
                    '		<![CDATA[SELECT 1 X FROM DUAL]]>' || unistr('\000a') || 
                    '	</queryString>' || unistr('\000a') || 
                    '	<field name="X" class="java.math.BigDecimal"/>' || unistr('\000a') || 
                    '	<background>' || unistr('\000a') || 
                    '		<band splitType="Stretch"/>' || unistr('\000a') || 
                    '	</background>' || unistr('\000a') || 
                    '	<title>' || unistr('\000a') || 
                    '		<band height="800" splitType="Stretch">' || unistr('\000a') || 
                    '			<stackedAreaChart>' || unistr('\000a') || 
                    '				<chart evaluationTime="Report">' || unistr('\000a') || 
                    '					<reportElement uuid="3e2fb893-870a-4138-9509-f27d088435a3" x="0" y="74" width="555" height="428"/>' || unistr('\000a') || 
                    '					<chartTitle/>' || unistr('\000a') || 
                    '					<chartSubtitle/>' || unistr('\000a') || 
                    '					<chartLegend/>' || unistr('\000a') || 
                    '				</chart>' || unistr('\000a') || 
                    '				<category';
  v_data := v_data || 'Dataset>' || unistr('\000a') || 
                    '					<dataset>' || unistr('\000a') || 
                    '						<datasetRun subDataset="Chartdata" uuid="e8c8303b-afaf-4357-976a-338c4810876d"/>' || unistr('\000a') || 
                    '					</dataset>' || unistr('\000a') || 
                    '					<categorySeries>' || unistr('\000a') || 
                    '						<seriesExpression><![CDATA["Order sum"]]></seriesExpression>' || unistr('\000a') || 
                    '						<categoryExpression><![CDATA[$F{CUST_LAST_NAME}]]></categoryExpression>' || unistr('\000a') || 
                    '						<valueExpression><![CDATA[$F{ORDER_SUM}]]></valueExpression>' || unistr('\000a') || 
                    '					</categorySeries>' || unistr('\000a') || 
                    '					<categorySeries>' || unistr('\000a') || 
                    '						<seriesExpression><![CDATA["Order sum 3"]]></seriesExpression>' || unistr('\000a') || 
                    '						<categoryExpression>';
  v_data := v_data || '<![CDATA[$F{CUST_LAST_NAME}]]></categoryExpression>' || unistr('\000a') || 
                    '						<valueExpression><![CDATA[$F{ORDER_SUM3}]]></valueExpression>' || unistr('\000a') || 
                    '					</categorySeries>' || unistr('\000a') || 
                    '					<categorySeries>' || unistr('\000a') || 
                    '						<seriesExpression><![CDATA["Order sum 4"]]></seriesExpression>' || unistr('\000a') || 
                    '						<categoryExpression><![CDATA[$F{CUST_LAST_NAME}]]></categoryExpression>' || unistr('\000a') || 
                    '						<valueExpression><![CDATA[$F{ORDER_SUM4}]]></valueExpression>' || unistr('\000a') || 
                    '					</categorySeries>' || unistr('\000a') || 
                    '				</categoryDataset>' || unistr('\000a') || 
                    '				<areaPlot>' || unistr('\000a') || 
                    '					<plot/>' || unistr('\000a') || 
                    '				</areaPlot>' || unistr('\000a') || 
                    '			</stackedAreaChart>' || unistr('\000a') || 
                    '			<st';
  v_data := v_data || 'aticText>' || unistr('\000a') || 
                    '				<reportElement uuid="a8635947-d536-4601-8167-3e7d88526df3" x="33" y="11" width="502" height="52"/>' || unistr('\000a') || 
                    '				<textElement textAlignment="Center">' || unistr('\000a') || 
                    '					<font size="36" isBold="true"/>' || unistr('\000a') || 
                    '				</textElement>' || unistr('\000a') || 
                    '				<text><![CDATA[Stacked-area-chart]]></text>' || unistr('\000a') || 
                    '			</staticText>' || unistr('\000a') || 
                    '		</band>' || unistr('\000a') || 
                    '	</title>' || unistr('\000a') || 
                    '	<pageHeader>' || unistr('\000a') || 
                    '		<band splitType="Stretch"/>' || unistr('\000a') || 
                    '	</pageHeader>' || unistr('\000a') || 
                    '	<columnHeader>' || unistr('\000a') || 
                    '		<band splitType="Stretch"/>' || unistr('\000a') || 
                    '	</columnHeader>' || unistr('\000a') || 
                    '	<detail>' || unistr('\000a') || 
                    '		<band splitType="Stretch"/>' || unistr('\000a') || 
                    '	</detail>' || unistr('\000a') || 
                    '	<columnFooter>' || unistr('\000a') || 
                    '		<band s';
  v_data := v_data || 'plitType="Stretch"/>' || unistr('\000a') || 
                    '	</columnFooter>' || unistr('\000a') || 
                    '	<pageFooter>' || unistr('\000a') || 
                    '		<band splitType="Stretch"/>' || unistr('\000a') || 
                    '	</pageFooter>' || unistr('\000a') || 
                    '	<summary>' || unistr('\000a') || 
                    '		<band splitType="Stretch"/>' || unistr('\000a') || 
                    '	</summary>' || unistr('\000a') || 
                    '</jasperReport>' || unistr('\000a') || 
                    '';
INSERT INTO JRXML_REPORT_DEFINITIONS ( 
  JRD_ID,
  JRD_NAME,
  JRD_DESCRIPTION,
  JRD_XML
) VALUES (
  51,
  'stacked_area_chart',
  'Demo for using a stacked-area-chart',
  v_data
);
  dbms_lob.freetemporary(v_data);
end;
/