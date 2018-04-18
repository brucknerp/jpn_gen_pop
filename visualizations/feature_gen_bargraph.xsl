<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="barWidth" select="20" as="xs:integer"/>
    <xsl:variable name="interbarSpacing" select="$barWidth div 2" as="xs:double"/>
    <xsl:variable name="barInterval" select="$barWidth + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="genderBarInterval" select="$barWidth" as="xs:integer"/>
    <xsl:variable name="barHeight" select="300" as="xs:integer"/>
    <xsl:variable name="barShift" select="22" as="xs:integer"/>
    <xsl:template match="/">
        <svg height = "375">
            <g transform="translate(30, 330)">
                <line x1="20" x2="20" y1="0" y2="-320" stroke="black" stroke-width="1"/>
                <line x1="20" x2="{10 * $barInterval + 20}" y1="0" y2="0" stroke="black"
                    stroke-width="1"/>
                <xsl:apply-templates select="/"></xsl:apply-templates>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="data">
        
    </xsl:template>
</xsl:stylesheet>