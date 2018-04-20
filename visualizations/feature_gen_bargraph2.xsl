<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output omit-xml-declaration="yes" method="xml" indent="yes"/>
    <xsl:variable name="femTotal" select="sum(//female/feature)" as="xs:double"/>
    <xsl:variable name="maleTotal" select="sum(//male/feature)" as="xs:double"/>
    <xsl:variable name="barWidth" select="20" as="xs:integer"/>
    <xsl:variable name="interbarSpacing" select="$barWidth" as="xs:double"/>
    <xsl:variable name="barInterval" select="($barWidth*2) + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="barHeight" select="300" as="xs:integer"/>
    <xsl:variable name="shift" select="50" as="xs:integer"/>
    <xsl:variable name="barShift" select="$shift + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="xLength" select="5*$barInterval+$barShift" as="xs:double"/>
    <xsl:template match="/">
        <svg height="675">
            <g transform="translate(30, 600)">
                <!-- y-axis -->
                <line x1="{$shift}" x2="{$shift}" y1="0" y2="-{$barHeight}" stroke="black" stroke-width="1"/>
                <!-- x axis -->
                <line x1="{$shift}" x2="{$xLength}" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <!-- 50% line -->
                <line x1="{$shift}" y1="-{$barHeight div 2}" x2="{$xLength}" y2="-{$barHeight div 2}" stroke="black" opacity="0.5" stroke-dasharray="8 4"
                    stroke-width="1"/>
                <text x="1" y="-{$barHeight div 2}">50%</text>
                <!--y-axis label -->
                <text x="-20" y="-{$barHeight div 2}" font-size="85%" text-anchor="middle"
                    transform="rotate(270 -20 -{$barHeight div 2})">Percentage of
                    Features</text>
                <!-- x-axis label -->
                <text x="{$xLength div 2}" y="45" text-anchor="middle" font-size="85%">Gender Feature Type</text>
                <xsl:apply-templates select="//data"/>
            </g>
        </svg>
    </xsl:template>
   <xsl:template match="female/feature">
        <xsl:variable name="xPos" select="(((position() div 2) - 1) * $barInterval)" as="xs:double"/>
        <xsl:variable name="femFeature" select="." as="xs:double"/>
        <xsl:variable name="femPer" select="$femFeature div $femTotal" as="xs:double"/>
        <rect x="{$xPos + $barShift}" y="-{$femPer * $barHeight}" width="{$barWidth}" height="{$femPer * $barHeight}"/>
    </xsl:template>
     <xsl:template match="male/feature">
        <xsl:variable name="malexPos" select="(((position() div 2) - 1) * $barInterval + $barWidth)" as="xs:double"/>
        <xsl:variable name="maleFeature" select="." as="xs:double"/>
        <xsl:variable name="malePer" select="$maleFeature div $maleTotal" as="xs:double"/>
        <rect x="{$malexPos + $barShift}" y="-{$malePer * $barHeight}" width="{$barWidth}" height="{$malePer * $barHeight}" fill="blue"/>
    </xsl:template>
</xsl:stylesheet>
<!-- thinking about instead of doing this making a 
bar graph with politeness, gender, type and add up bars
to 100% like the pres. election hw-->
