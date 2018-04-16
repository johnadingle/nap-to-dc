<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xpath-default-namespace="http://www.isotc211.org/2005/gmd">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/MD_Metadata">
		<dublin_core schema="dc">
			<dcvalue element="title" qualifier="none">
				<xsl:value-of select="identificationInfo/MD_DataIdentification/citation/CI_Citation/title/gco:CharacterString"/>
			</dcvalue>
			<dcvalue element="description" qualifier="abstract">
				<xsl:value-of select="identificationInfo/MD_DataIdentification/abstract/gco:CharacterString"/>
			</dcvalue>
			<dcvalue element="rights" qualifier="none">
				<xsl:value-of select="metadataConstraints/MD_Constraints/useLimitation/gco:CharacterString"/>
			</dcvalue>
			
			
			<xsl:variable name="keywords_input">
				<xsl:value-of select="identificationInfo/MD_DataIdentification/descriptiveKeywords/MD_Keywords[type/MD_KeywordTypeCode[@codeListValue='place']]/keyword/gco:CharacterString"/>
			</xsl:variable>
			<xsl:for-each select="tokenize($keywords_input,',')">
				<dcvalue element="subject" qualifier="none">
					<xsl:value-of select="normalize-space(.)"/>
				</dcvalue>
			</xsl:for-each>
  
			<xsl:variable name="keywords_input">
				<xsl:value-of select="identificationInfo/MD_DataIdentification/descriptiveKeywords/MD_Keywords[type/MD_KeywordTypeCode[@codeListValue='theme']]/keyword/gco:CharacterString"/>
			</xsl:variable>
			<xsl:for-each select="tokenize($keywords_input,',')">
				<dcvalue element="subject" qualifier="none">
					<xsl:value-of select="normalize-space(.)"/>
				</dcvalue>
			</xsl:for-each>
			
			<dcvalue element="coverage" qualifier="box">northlimit=<xsl:value-of select="identificationInfo/MD_DataIdentification/extent/EX_Extent/geographicElement/EX_GeographicBoundingBox/northBoundLatitude/gco:Decimal"/>; westlimit=<xsl:value-of select="identificationInfo/MD_DataIdentification/extent/EX_Extent/geographicElement/EX_GeographicBoundingBox/westBoundLongitude/gco:Decimal"/>; southlimit=<xsl:value-of select="identificationInfo/MD_DataIdentification/extent/EX_Extent/geographicElement/EX_GeographicBoundingBox/southBoundLatitude/gco:Decimal"/>; eastlimit=<xsl:value-of select="identificationInfo/MD_DataIdentification/extent/EX_Extent/geographicElement/EX_GeographicBoundingBox/eastBoundLongitude/gco:Decimal"/>
			</dcvalue>
			
		</dublin_core>
	</xsl:template>				
		
	
</xsl:stylesheet>
