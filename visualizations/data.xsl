<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
<xsl:template match="/">
    <data><xsl:apply-templates select="//song"/></data>
</xsl:template>
    <xsl:template match="song">
        <female><xsl:apply-templates select="//feature/@gen"/></female>
       <!-- <male><xsl:apply-templates/></male>-->
</xsl:template>
    <xsl:template match="body">
        <SF><xsl:apply-templates select="count(//feature[@gen='SF'])"/></SF>
        <MF><xsl:apply-templates select="count(//feature[@gen='MF'])"/></MF>
        <MMN><xsl:apply-templates select="count(//feature[@gen='MMN'])"/></MMN>
        <N><xsl:apply-templates select="count(//feature[@gen='N'])"/></N>
        <SM><xsl:apply-templates select="count(//feature[@gen='SM'])"/></SM>
    </xsl:template>
</xsl:stylesheet>