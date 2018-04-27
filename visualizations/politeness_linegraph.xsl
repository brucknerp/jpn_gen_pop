<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <!-- feature total variables -->
    <xsl:variable name="malepol80total" select="sum(//male[@year = '1980']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="malepol90total" select="sum(//male[@year = '1990']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="malepol00total" select="sum(//male[@year = '2000']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="malepol10total" select="sum(//male[@year = '2010']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="malepol17total" select="sum(//male[@year = '2017']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="fempol80total" select="sum(//female[@year = '1980']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="fempol90total" select="sum(//female[@year = '1990']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="fempol00total" select="sum(//female[@year = '2000']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="fempol10total" select="sum(//female[@year = '2010']/politeness/feature)"
        as="xs:double"/>
    <xsl:variable name="fempol17total" select="sum(//female[@year = '2017']/politeness/feature)"
        as="xs:double"/>

    <xsl:variable name="scale" select="300" as="xs:integer"/>
    <xsl:variable name="height" select="300" as="xs:integer"/>
    <!-- shifts away from x-axis -->
    <xsl:variable name="shift" select="50" as="xs:integer"/>
    <!-- space between each year-->
    <xsl:variable name="yearShift" select="$shift + 50" as="xs:integer"/>
    <xsl:variable name="xLength" select="5 * $yearShift + 175" as="xs:double"/>
    <xsl:template match="/">
        <svg width="{$xLength+ 300}" height="{$height + 200}">
            <g transform="translate(40,{$height + 100})">
                <!-- title -->
                <text x="{$xLength div 2 - 100}" y="-{$height + 20}" stroke="#c30000" font-size="150%">Politeness Over Time</text>
                <!-- y-axis -->
                <line x1="{$shift}" x2="{$shift}" y1="0" y2="-{$height}" stroke="black"
                    stroke-width="2"/>
                <!-- x axis -->
                <line x1="{$shift}" x2="{$xLength}" y1="0" y2="0" stroke="black" stroke-width="2"/>
                <!-- 100% line -->
                <line x1="{$shift}" y1="-{$scale}" x2="{$xLength}" y2="-{$scale}" stroke="black"
                    opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale}">100%</text>
                <!-- 90% line -->
                <line x1="{$shift}" y1="-{$scale * .9}" x2="{$xLength}" y2="-{$scale * .9}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .9}">90%</text>
                <!-- 80% line -->
                <line x1="{$shift}" y1="-{$scale * .8}" x2="{$xLength}" y2="-{$scale * .8}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .8}">80%</text>
                <!-- 70% line -->
                <line x1="{$shift}" y1="-{$scale * .7}" x2="{$xLength}" y2="-{$scale * .7}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .7}">70%</text>
                <!-- 60% line -->
                <line x1="{$shift}" y1="-{$scale * .6}" x2="{$xLength}" y2="-{$scale * .6}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .6}">60%</text>
                <!-- 50% line -->
                <line x1="{$shift}" y1="-{$scale * .5}" x2="{$xLength}" y2="-{$scale * .5}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .5}">50%</text>
                <!-- 40% line -->
                <line x1="{$shift}" y1="-{$scale * .4}" x2="{$xLength}" y2="-{$scale * .4}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .4}">40%</text>
                <!-- 30% line -->
                <line x1="{$shift}" y1="-{$scale * .3}" x2="{$xLength}" y2="-{$scale * .3}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .3}">30%</text>
                <!-- 20% line -->
                <line x1="{$shift}" y1="-{$scale * .2}" x2="{$xLength}" y2="-{$scale * .2}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .2}">20%</text>
                <!-- 10% line -->
                <line x1="{$shift}" y1="-{$scale * .1}" x2="{$xLength}" y2="-{$scale * .1}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <text x="-5" y="-{$scale * .1}">10%</text>
                <!--y-axis label -->
                <text x="-20" y="-{$height div 2}" font-size="85%" text-anchor="middle"
                    transform="rotate(270 -20 -{$height div 2})">Percentage of Features</text>
                <!-- x-axis label -->
                <text x="{$xLength div 2}" y="45" text-anchor="middle" font-size="85%">Year</text>

                <!-- legend -->
                <rect x="{$xLength - 110}" y="-{$height - 60}" width="280" height="90"
                    stroke="black" stroke-width="1" fill="white"/>
                <line x1="{$xLength - 100}" x2="{$xLength - 55}" y1="-{$height - 80}"
                    y2="-{$height - 80}" stroke-width="1" stroke="black"/>
                <text x="{$xLength - 45}" y="-{$height - 82}" font-size="60%">Male Artist</text>
                <line x1="{$xLength - 100}" x2="{$xLength - 55}" y1="-{$height - 100}"
                    y2="-{$height - 100}" stroke-width="1" stroke="black" stroke-dasharray="20,10,5,5,5,10"/>
                <text x="{$xLength - 45}" y="-{$height - 102}" font-size="60%">Female Artist</text>
                <line x1="{$xLength + 30}" x2="{$xLength + 75}" y1="-{$height - 80}"
                    y2="-{$height - 80}" stroke-width="1" stroke="blue"/>
                <text x="{$xLength + 85}" y="-{$height - 82}" font-size="60%">Polite</text>
                <line x1="{$xLength + 30}" x2="{$xLength + 75}" y1="-{$height - 100}"
                    y2="-{$height - 100}" stroke-width="1" stroke="green"/>
                <text x="{$xLength + 85}" y="-{$height - 102}" font-size="60%">Plain</text>
                <line x1="{$xLength + 30}" x2="{$xLength + 75}" y1="-{$height - 120}"
                    y2="-{$height - 120}" stroke-width="1" stroke="red"/>
                <text x="{$xLength + 85}" y="-{$height - 122}" font-size="60%">Deprecatory</text>
                <xsl:apply-templates/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="data">
        <!-- start of male polite variables -->
        <xsl:variable name="malePolite1980per"
            select="(sum(male[@year = '1980']/politeness/feature[@polite = 'polite'])) div $malepol80total"
            as="xs:double"/>
        <xsl:variable name="malePolite1990per"
            select="(sum(male[@year = '1990']/politeness/feature[@polite = 'polite'])) div $malepol90total"
            as="xs:double"/>
        <xsl:variable name="malePolite2000per"
            select="(sum(male[@year = '2000']/politeness/feature[@polite = 'polite'])) div $malepol00total"
            as="xs:double"/>
        <xsl:variable name="malePolite2010per"
            select="(sum(male[@year = '2010']/politeness/feature[@polite = 'polite'])) div $malepol10total"
            as="xs:double"/>
        <xsl:variable name="malePolite2017per"
            select="(sum(male[@year = '2017']/politeness/feature[@polite = 'polite'])) div $malepol17total"
            as="xs:double"/>
        <!-- end of male polite variables -->

        <!-- start of male plain variables -->
        <xsl:variable name="malePlain1980per"
            select="(sum(male[@year = '1980']/politeness/feature[@polite = 'plain'])) div $malepol80total"
            as="xs:double"/>
        <xsl:variable name="malePlain1990per"
            select="(sum(male[@year = '1990']/politeness/feature[@polite = 'plain'])) div $malepol90total"
            as="xs:double"/>
        <xsl:variable name="malePlain2000per"
            select="(sum(male[@year = '2000']/politeness/feature[@polite = 'plain'])) div $malepol00total"
            as="xs:double"/>
        <xsl:variable name="malePlain2010per"
            select="(sum(male[@year = '2010']/politeness/feature[@polite = 'plain'])) div $malepol10total"
            as="xs:double"/>
        <xsl:variable name="malePlain2017per"
            select="(sum(male[@year = '2017']/politeness/feature[@polite = 'plain'])) div $malepol17total"
            as="xs:double"/>
        <!-- end of male plain variables -->

        <!-- start of male depr variables -->
        <xsl:variable name="maledepr1980per"
            select="(sum(male[@year = '1980']/politeness/feature[@polite = 'depr'])) div $malepol80total"
            as="xs:double"/>
        <xsl:variable name="maledepr1990per"
            select="(sum(male[@year = '1990']/politeness/feature[@polite = 'depr'])) div $malepol90total"
            as="xs:double"/>
        <xsl:variable name="maledepr2000per"
            select="(sum(male[@year = '2000']/politenessfeature[@polite = 'depr'])) div $malepol00total"
            as="xs:double"/>
        <xsl:variable name="maledepr2010per"
            select="(sum(male[@year = '2010']/politeness/feature[@polite = 'depr'])) div $malepol10total"
            as="xs:double"/>
        <xsl:variable name="maledepr2017per"
            select="(sum(male[@year = '2017']/politeness/feature[@polite = 'depr'])) div $malepol17total"
            as="xs:double"/>
        <!-- end of male depr variables -->

        <!-- start of female polite variables -->
        <xsl:variable name="fempol1980per"
            select="(sum(female[@year = '1980']/gender/feature[@polite = 'polite'])) div $fempol80total"
            as="xs:double"/>
        <xsl:variable name="fempol1990per"
            select="(sum(female[@year = '1990']/gender/feature[@polite = 'polite'])) div $fempol90total"
            as="xs:double"/>
        <xsl:variable name="fempol2000per"
            select="(sum(female[@year = '2000']/gender/feature[@polite = 'polite'])) div $fempol00total"
            as="xs:double"/>
        <xsl:variable name="fempol2010per"
            select="(sum(female[@year = '2010']/gender/feature[@polite = 'polite'])) div $fempol10total"
            as="xs:double"/>
        <xsl:variable name="fempol2017per"
            select="(sum(female[@year = '2017']/gender/feature[@polite = 'polite'])) div $fempol17total"
            as="xs:double"/>
        <!-- end of female polite variables -->

        <!-- start of female plain variables -->
        <xsl:variable name="femPlain1980per"
            select="(sum(female[@year = '1980']/politeness/feature[@polite = 'plain'])) div $fempol80total"
            as="xs:double"/>
        <xsl:variable name="femPlain1990per"
            select="(sum(female[@year = '1990']/politeness/feature[@polite = 'plain'])) div $fempol90total"
            as="xs:double"/>
        <xsl:variable name="femPlain2000per"
            select="(sum(female[@year = '2000']/politeness/feature[@polite = 'plain'])) div $fempol00total"
            as="xs:double"/>
        <xsl:variable name="femPlain2010per"
            select="(sum(female[@year = '2010']/politeness/feature[@polite = 'plain'])) div $fempol10total"
            as="xs:double"/>
        <xsl:variable name="femPlain2017per"
            select="(sum(female[@year = '2017']/politeness/feature[@polite = 'plain'])) div $fempol17total"
            as="xs:double"/>
        <!-- end of female neutral gender variables -->

        <!-- start of female depr variables -->
        <xsl:variable name="femDepr1980per"
            select="(sum(female[@year = '1980']/politeness/feature[@polite = 'depr'])) div $fempol80total"
            as="xs:double"/>
        <xsl:variable name="femDepr1990per"
            select="(sum(female[@year = '1990']/politeness/feature[@polite = 'depr'])) div $fempol90total"
            as="xs:double"/>
        <xsl:variable name="femDepr2000per"
            select="(sum(female[@year = '2000']/politeness/feature[@polite = 'depr'])) div $fempol00total"
            as="xs:double"/>
        <xsl:variable name="femDepr2010per"
            select="(sum(female[@year = '2010']/politeness/feature[@polite = 'depr'])) div $fempol10total"
            as="xs:double"/>
        <xsl:variable name="femDepr2017per"
            select="(sum(female[@year = '2017']/politeness/feature[@polite = 'depr'])) div $fempol17total"
            as="xs:double"/>
        <!-- end of female depr variables -->

        <!-- start of male polite points -->
        <circle r="4" cx="{$yearShift}" cy="-{$malePolite1980per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$malePolite1990per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$malePolite2000per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$malePolite2010per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$malePolite2017per * $scale}" fill="red"/>
        <!-- end of male polite points -->

        <!-- start of male polite lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$malePolite1980per * $scale}"
            y2="-{$malePolite1990per * $scale}" stroke-width="" stroke="red"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$malePolite1990per * $scale}"
            y2="-{$malePolite2000per * $scale}" stroke-width="" stroke="red"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$malePolite2000per * $scale}"
            y2="-{$malePolite2010per * $scale}" stroke-width="" stroke="red"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$malePolite2010per * $scale}"
            y2="-{$malePolite2017per * $scale}" stroke-width="" stroke="red"/>
        <!-- start of male polite lines -->

        <!-- start of male plain points -->
        <circle r="4" cx="{$yearShift}" cy="-{$malePlain1980per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$malePlain1990per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$malePlain2000per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$malePlain2010per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$malePlain2017per * $scale}" fill="green"/>
        <!-- end of male plain points -->

        <!-- start of male plain lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$malePlain1980per * $scale}"
            y2="-{$malePlain1990per * $scale}" stroke-width="" stroke="green"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$malePlain1990per * $scale}"
            y2="-{$malePlain2000per * $scale}" stroke-width="" stroke="green"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$malePlain2000per * $scale}"
            y2="-{$malePlain2010per * $scale}" stroke-width="" stroke="green"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$malePlain2010per * $scale}"
            y2="-{$malePlain2017per * $scale}" stroke-width="" stroke="green"/>
        <!-- start of male plain lines -->

        <!-- start of male depr points -->
        <circle r="4" cx="{$yearShift}" cy="-{$maledepr1980per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$maledepr1990per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$maledepr2000per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$maledepr2010per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$maledepr2017per * $scale}" fill="blue"/>
        <!-- end of male depr points -->

        <!-- start of male male gender lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$maledepr1980per * $scale}"
            y2="-{$maledepr1990per * $scale}" stroke-width="" stroke="blue"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$maledepr1990per * $scale}"
            y2="-{$maledepr2000per * $scale}" stroke-width="" stroke="blue"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$maledepr2000per * $scale}"
            y2="-{$maledepr2010per * $scale}" stroke-width="" stroke="blue"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$maledepr2010per * $scale}"
            y2="-{$maledepr2017per * $scale}" stroke-width="" stroke="blue"/>
        <!-- start of male depr lines -->

        <!-- start of female polite points -->
        <circle r="4" cx="{$yearShift}" cy="-{$fempol1980per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$fempol1990per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$fempol2000per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$fempol2010per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$fempol2017per * $scale}" fill="red"/>
        <!-- end of female polite points -->

        <!-- start of female polite lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$fempol1980per * $scale}"
            y2="-{$fempol1990per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$fempol1990per * $scale}"
            y2="-{$fempol2000per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$fempol2000per * $scale}"
            y2="-{$fempol2010per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$fempol2010per * $scale}"
            y2="-{$fempol2017per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <!-- start of female polite lines -->

        <!-- start of female plain points -->
        <circle r="4" cx="{$yearShift}" cy="-{$femPlain1980per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$femPlain1990per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$femPlain2000per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$femPlain2010per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$femPlain2017per * $scale}" fill="green"/>
        <!-- end of female plain points -->

        <!-- start of female plain lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$femPlain1980per * $scale}"
            y2="-{$femPlain1990per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="green"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$femPlain1990per * $scale}"
            y2="-{$femPlain2000per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width=""
            stroke="green"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$femPlain2000per * $scale}"
            y2="-{$femPlain2010per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="green"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$femPlain2010per * $scale}"
            y2="-{$femPlain2017per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="green"/>
        <!-- start of female plain lines -->

        <!-- start of female depr points -->
        <circle r="4" cx="{$yearShift}" cy="-{$femDepr1980per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$femDepr1990per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$femDepr2000per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$femDepr2010per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$femDepr2017per * $scale}" fill="blue"/>
        <!-- end of female depr points -->

        <!-- start of female depr lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$femDepr1980per * $scale}"
            y2="-{$femDepr1990per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$femDepr1990per * $scale}"
            y2="-{$femDepr2000per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$femDepr2000per * $scale}"
            y2="-{$femDepr2010per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$femDepr2010per * $scale}"
            y2="-{$femDepr2017per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <!-- start of female depr lines -->

<!-- year labels -->
        <text x="{$yearShift - 15}" y="15" font-size="75%">1980</text>
        <text x="{$yearShift * 2 - 15}" y="15" font-size="75%">1990</text>
        <text x="{$yearShift * 3 - 15}" y="15" font-size="75%">2000</text>
        <text x="{$yearShift * 4 - 15}" y="15" font-size="75%">2010</text>
        <text x="{$yearShift * 5 - 15}" y="15" font-size="75%">2017</text>
    </xsl:template>
</xsl:stylesheet>
