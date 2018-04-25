<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <!-- feature totals -->
    <xsl:output omit-xml-declaration="yes" method="xml" indent="yes"/>
    <xsl:variable name="maleGenTotal" select="sum(//male/gender/feature)" as="xs:double"/>
    <xsl:variable name="femGenTotal" select="sum(//female/gender/feature)" as="xs:double"/>
    <xsl:variable name="malePolTotal" select="sum(//male/politeness/feature)" as="xs:double"/>
    <xsl:variable name="femalePolTotal" select="sum(//female/politeness/feature)" as="xs:double"/>
    <xsl:variable name="maleTypeTotal" select="sum(//male/type/feature)" as="xs:double"/>
    <xsl:variable name="femTypeTotal" select="sum(//female/type/feature)" as="xs:double"/>
    <!-- bar width -->
    <xsl:variable name="barWidth" select="20" as="xs:integer"/>
    <!-- space from right of male bar to left of female bar -->
    <xsl:variable name="interbarSpacing" select="$barWidth" as="xs:double"/>
    <!-- space from left of bar to left of next bar of same gender-->
    <xsl:variable name="barInterval" select="($barWidth * 2) + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="barHeight" select="300" as="xs:integer"/>
    <!-- shifts away from x-axis -->
    <xsl:variable name="shift" select="50" as="xs:integer"/>
    <!-- shifts bar from x-axis -->
    <xsl:variable name="barShift" select="$shift + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="xLength" select="5 * $barInterval + $barShift" as="xs:double"/>
    <xsl:template match="/">
        <svg>
            <g transform="translate=(30, 600)">
                <!-- y-axis -->
                <line x1="{$shift}" x2="{$shift}" y1="0" y2="-{$barHeight}" stroke="black"
                    stroke-width="1"/>
                <!-- x axis -->
                <line x1="{$shift}" x2="{$xLength}" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <!-- 50% line -->
                <line x1="{$shift}" y1="-{$barHeight div 2}" x2="{$xLength}"
                    y2="-{$barHeight div 2}" stroke="black" opacity="0.5" stroke-dasharray="8 4"
                    stroke-width="1"/>
                <text x="1" y="-{$barHeight div 2}">50%</text>
                <!--y-axis label -->
                <text x="-20" y="-{$barHeight div 2}" font-size="85%" text-anchor="middle"
                    transform="rotate(270 -20 -{$barHeight div 2})">Percentage of Features</text>
                <!-- x-axis label -->
                <text x="{$xLength div 2}" y="45" text-anchor="middle" font-size="85%">Gender
                    Feature Type</text>
                <xsl:apply-templates select="//data"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="male/gender/feature">
        <rect x="$barShift"
            y="-(sum(.[@gen='SF'] div {$maleGenTotal}) * {$barHeight}"
            width="{$barWidth}"
            height="(sum(male/gender/feature[@gen='SF'] div {$maleGenTotal}) * {$barHeight}"
            stroke="black" stroke-width=".5" fill="blue"/>
    </xsl:template>
</xsl:stylesheet>
