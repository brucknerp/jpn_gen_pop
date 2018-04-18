<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
<xsl:template match="/">
    <data><xsl:apply-templates/></data>
</xsl:template>
    <xsl:template match="meta">
        <female></female>
        <male></male>
    </xsl:template>
    <xsl:template match="meta">
        <year></year>
    </xsl:template>
    <xsl:template match="verse">
        <SF></SF>
        <MF></MF>
        <MMN></MMN>
        <N></N>
        <SM></SM>
    </xsl:template>
</xsl:stylesheet>