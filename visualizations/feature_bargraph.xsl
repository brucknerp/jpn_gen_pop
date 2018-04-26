<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <!-- feature totals -->
    <xsl:output omit-xml-declaration="yes" method="xml" indent="yes"/>
    <xsl:variable name="maleGenTotal" select="sum(//male/gender/feature)" as="xs:double"/>
    <xsl:variable name="femGenTotal" select="sum(//female/gender/feature)" as="xs:double"/>
    <xsl:variable name="malePolTotal" select="sum(//male/politeness/feature)" as="xs:double"/>
    <xsl:variable name="femalePolTotal" select="sum(//female/politeness/feature)" as="xs:double"/>
    <xsl:variable name="maleTypeTotal" select="sum(//male/type/feature)" as="xs:double"/>
    <xsl:variable name="femTypeTotal" select="sum(//female/type/feature)" as="xs:double"/>
    <!-- bar width -->
    <xsl:variable name="barWidth" select="50" as="xs:integer"/>
    <!-- space from right of male bar to left of female bar -->
    <xsl:variable name="interbarSpacing" select="$barWidth" as="xs:double"/>
    <!-- space from left of bar to left of next bar of same gender-->
    <xsl:variable name="barInterval" select="($barWidth * 2) + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="barHeight" select="600" as="xs:integer"/>
    <!-- shifts away from x-axis -->
    <xsl:variable name="shift" select="50" as="xs:integer"/>
    <!-- shifts bar from x-axis -->
    <xsl:variable name="barShift" select="$shift + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="xLength" select="3 * $barInterval + $barShift" as="xs:double"/>
    <xsl:template match="/">
        <svg width="{$xLength}" height="{$barHeight + 200}">
            <g transform="translate(40,{$barHeight + 100})">
                <!-- y-axis -->
                <line x1="{$shift}" x2="{$shift}" y1="0" y2="-{$barHeight}" stroke="black"
                    stroke-width="2"/>
                <!-- x axis -->
                <line x1="{$shift}" x2="{$xLength}" y1="0" y2="0" stroke="black" stroke-width="2"/>
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
                <xsl:apply-templates/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="data">
        <xsl:variable name="maleSFper"
            select="sum(male/gender/feature[@gen = 'SF']) div $maleGenTotal" as="xs:double"/>
        <xsl:variable name="maleSMper"
            select="sum(male/gender/feature[@gen = 'SM']) div $maleGenTotal" as="xs:double"/>
        <xsl:variable name="maleMFper"
            select="sum(male/gender/feature[@gen = 'MF']) div $maleGenTotal" as="xs:double"/>
        <xsl:variable name="maleNper"
            select="sum(male/gender/feature[@gen = 'N']) div $maleGenTotal" as="xs:double"/>
        <xsl:variable name="maleMMNper"
            select="sum(male/gender/feature[@gen = 'MMN']) div $maleGenTotal" as="xs:double"/>
        <!-- maleSF bar -->
        <rect x="{$barShift}" y="-{$maleSFper * $barHeight}" width="{$barWidth}"
            height="{$maleSFper * $barHeight}" stroke="black" stroke-width=".5" fill="#1a0033"/>
        <text x="{$barShift  + ($barWidth div 2)}" y="-{(($maleSFper * $barHeight) div 2)}"
            text-anchor="middle" font-size="50%" fill="white"><xsl:value-of
                select="round($maleSFper * 100)"/>%</text>
        <!-- maleSM bar -->
        <rect x="{$barShift}" y="-{$barHeight}" width="{$barWidth}"
            height="{$maleSMper * $barHeight}" stroke="#cc99ff" stroke-width=".5" fill=" #e6ccff"/>
        <text x="{$barShift  + ($barWidth div 2)}" y="-{$barHeight - ($maleSMper * $barHeight div 2)}"
            text-anchor="middle" font-size="50%" fill="white"><xsl:value-of
                select="round($maleSMper * 100)"/>%</text>
        <!-- maleMF bar -->
        <rect x="{$barShift}" y="-{($maleSFper * $barHeight) + ($maleMFper * $barHeight)}"
            width="{$barWidth}" height="{$maleMFper * $barHeight}" stroke="black" stroke-width=".5"
            fill="#5900b3"/>
        <!-- maleN bar -->
        <rect x="{$barShift}"
            y="-{($maleSFper * $barHeight) + ($maleMFper * $barHeight) + ($maleNper * $barHeight)}"
            width="{$barWidth}" height="{$maleNper * $barHeight}" stroke="#9933ff" stroke-width=".5"
            fill="#b366ff"/>
        <!-- maleMMN bar -->
        <rect x="{$barShift}"
            y="-{($maleSFper * $barHeight) + ($maleMFper * $barHeight) + ($maleNper * $barHeight) + ($maleMMNper * $barHeight)}"
            width="{$barWidth}" height="{$maleMMNper * $barHeight}" stroke="#b366ff"
            stroke-width=".5" fill="#cc99ff"/>
    </xsl:template>
</xsl:stylesheet>
