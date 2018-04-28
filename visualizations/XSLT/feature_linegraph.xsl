<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <!-- feature total variables -->
    <xsl:variable name="malegen80total" select="sum(//male[@year = '1980']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="malegen90total" select="sum(//male[@year = '1990']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="malegen00total" select="sum(//male[@year = '2000']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="malegen10total" select="sum(//male[@year = '2010']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="malegen17total" select="sum(//male[@year = '2017']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="femgen80total" select="sum(//female[@year = '1980']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="femgen90total" select="sum(//female[@year = '1990']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="femgen00total" select="sum(//female[@year = '2000']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="femgen10total" select="sum(//female[@year = '2010']/gender/feature)"
        as="xs:double"/>
    <xsl:variable name="femgen17total" select="sum(//female[@year = '2017']/gender/feature)"
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
                <text x="{$xLength div 2 - 140}" y="-{$height + 20}" stroke="#c30000" font-size="150%">Gendered Language Over Time</text>
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
                <text x="{$xLength + 85}" y="-{$height - 82}" font-size="60%">Male Feature</text>
                <line x1="{$xLength + 30}" x2="{$xLength + 75}" y1="-{$height - 100}"
                    y2="-{$height - 100}" stroke-width="1" stroke="green"/>
                <text x="{$xLength + 85}" y="-{$height - 102}" font-size="60%">Neutral Feature</text>
                <line x1="{$xLength + 30}" x2="{$xLength + 75}" y1="-{$height - 120}"
                    y2="-{$height - 120}" stroke-width="1" stroke="red"/>
                <text x="{$xLength + 85}" y="-{$height - 122}" font-size="60%">Female Feature</text>
                <xsl:apply-templates/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="data">
        <!-- start of male female gender variables -->
        <xsl:variable name="maleF1980per"
            select="(sum(male[@year = '1980']/gender/feature[@gen = 'SF']) + sum(male[@year = '1980']/gender/feature[@gen = 'MF'])) div $malegen80total"
            as="xs:double"/>
        <xsl:variable name="maleF1990per"
            select="(sum(male[@year = '1990']/gender/feature[@gen = 'SF']) + sum(male[@year = '1990']/gender/feature[@gen = 'MF'])) div $malegen90total"
            as="xs:double"/>
        <xsl:variable name="maleF2000per"
            select="(sum(male[@year = '2000']/gender/feature[@gen = 'SF']) + sum(male[@year = '2000']/gender/feature[@gen = 'MF'])) div $malegen00total"
            as="xs:double"/>
        <xsl:variable name="maleF2010per"
            select="(sum(male[@year = '2010']/gender/feature[@gen = 'SF']) + sum(male[@year = '2010']/gender/feature[@gen = 'MF'])) div $malegen10total"
            as="xs:double"/>
        <xsl:variable name="maleF2017per"
            select="(sum(male[@year = '2017']/gender/feature[@gen = 'SF']) + sum(male[@year = '2017']/gender/feature[@gen = 'MF'])) div $malegen17total"
            as="xs:double"/>
        <!-- end of male female gender variables -->

        <!-- start of male neutral gender variables -->
        <xsl:variable name="maleN1980per"
            select="(sum(male[@year = '1980']/gender/feature[@gen = 'N'])) div $malegen80total"
            as="xs:double"/>
        <xsl:variable name="maleN1990per"
            select="(sum(male[@year = '1990']/gender/feature[@gen = 'N'])) div $malegen90total"
            as="xs:double"/>
        <xsl:variable name="maleN2000per"
            select="(sum(male[@year = '2000']/gender/feature[@gen = 'N'])) div $malegen00total"
            as="xs:double"/>
        <xsl:variable name="maleN2010per"
            select="(sum(male[@year = '2010']/gender/feature[@gen = 'N'])) div $malegen10total"
            as="xs:double"/>
        <xsl:variable name="maleN2017per"
            select="(sum(male[@year = '2017']/gender/feature[@gen = 'N'])) div $malegen17total"
            as="xs:double"/>
        <!-- end of male neutral gender variables -->

        <!-- start of male male gender variables -->
        <xsl:variable name="maleM1980per"
            select="(sum(male[@year = '1980']/gender/feature[@gen = 'SM']) + sum(male[@year = '1980']/gender/feature[@gen = 'MMN'])) div $malegen80total"
            as="xs:double"/>
        <xsl:variable name="maleM1990per"
            select="(sum(male[@year = '1990']/gender/feature[@gen = 'SM']) + sum(male[@year = '1990']/gender/feature[@gen = 'MMN'])) div $malegen90total"
            as="xs:double"/>
        <xsl:variable name="maleM2000per"
            select="(sum(male[@year = '2000']/gender/feature[@gen = 'SM']) + sum(male[@year = '2000']/gender/feature[@gen = 'MMN'])) div $malegen00total"
            as="xs:double"/>
        <xsl:variable name="maleM2010per"
            select="(sum(male[@year = '2010']/gender/feature[@gen = 'SM']) + sum(male[@year = '2010']/gender/feature[@gen = 'MMN'])) div $malegen10total"
            as="xs:double"/>
        <xsl:variable name="maleM2017per"
            select="(sum(male[@year = '2017']/gender/feature[@gen = 'SM']) + sum(male[@year = '2017']/gender/feature[@gen = 'MMN'])) div $malegen17total"
            as="xs:double"/>
        <!-- end of male male gender variables -->

        <!-- start of female female gender variables -->
        <xsl:variable name="femF1980per"
            select="(sum(female[@year = '1980']/gender/feature[@gen = 'SF']) + sum(female[@year = '1980']/gender/feature[@gen = 'MF'])) div $femgen80total"
            as="xs:double"/>
        <xsl:variable name="femF1990per"
            select="(sum(female[@year = '1990']/gender/feature[@gen = 'SF']) + sum(female[@year = '1990']/gender/feature[@gen = 'MF'])) div $femgen90total"
            as="xs:double"/>
        <xsl:variable name="femF2000per"
            select="(sum(female[@year = '2000']/gender/feature[@gen = 'SF']) + sum(female[@year = '2000']/gender/feature[@gen = 'MF'])) div $femgen00total"
            as="xs:double"/>
        <xsl:variable name="femF2010per"
            select="(sum(female[@year = '2010']/gender/feature[@gen = 'SF']) + sum(female[@year = '2010']/gender/feature[@gen = 'MF'])) div $femgen10total"
            as="xs:double"/>
        <xsl:variable name="femF2017per"
            select="(sum(female[@year = '2017']/gender/feature[@gen = 'SF']) + sum(female[@year = '2017']/gender/feature[@gen = 'MF'])) div $femgen17total"
            as="xs:double"/>
        <!-- end of female female gender variables -->

        <!-- start of female neutral gender variables -->
        <xsl:variable name="femN1980per"
            select="(sum(female[@year = '1980']/gender/feature[@gen = 'N'])) div $femgen80total"
            as="xs:double"/>
        <xsl:variable name="femN1990per"
            select="(sum(female[@year = '1990']/gender/feature[@gen = 'N'])) div $femgen90total"
            as="xs:double"/>
        <xsl:variable name="femN2000per"
            select="(sum(female[@year = '2000']/gender/feature[@gen = 'N'])) div $femgen00total"
            as="xs:double"/>
        <xsl:variable name="femN2010per"
            select="(sum(female[@year = '2010']/gender/feature[@gen = 'N'])) div $femgen10total"
            as="xs:double"/>
        <xsl:variable name="femN2017per"
            select="(sum(female[@year = '2017']/gender/feature[@gen = 'N'])) div $femgen17total"
            as="xs:double"/>
        <!-- end of female neutral gender variables -->

        <!-- start of female male gender variables -->
        <xsl:variable name="femM1980per"
            select="(sum(female[@year = '1980']/gender/feature[@gen = 'SM']) + sum(female[@year = '1980']/gender/feature[@gen = 'MMN'])) div $femgen80total"
            as="xs:double"/>
        <xsl:variable name="femM1990per"
            select="(sum(female[@year = '1990']/gender/feature[@gen = 'SM']) + sum(female[@year = '1990']/gender/feature[@gen = 'MMN'])) div $femgen90total"
            as="xs:double"/>
        <xsl:variable name="femM2000per"
            select="(sum(female[@year = '2000']/gender/feature[@gen = 'SM']) + sum(female[@year = '2000']/gender/feature[@gen = 'MMN'])) div $femgen00total"
            as="xs:double"/>
        <xsl:variable name="femM2010per"
            select="(sum(female[@year = '2010']/gender/feature[@gen = 'SM']) + sum(female[@year = '2010']/gender/feature[@gen = 'MMN'])) div $femgen10total"
            as="xs:double"/>
        <xsl:variable name="femM2017per"
            select="(sum(female[@year = '2017']/gender/feature[@gen = 'SM']) + sum(female[@year = '2017']/gender/feature[@gen = 'MMN'])) div $femgen17total"
            as="xs:double"/>
        <!-- end of female male gender variables -->

        <!-- start of male female gender points -->
        <circle r="4" cx="{$yearShift}" cy="-{$maleF1980per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$maleF1990per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$maleF2000per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$maleF2010per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$maleF2017per * $scale}" fill="red"/>
        <!-- end of male female gender points -->

        <!-- start of male female gender lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$maleF1980per * $scale}"
            y2="-{$maleF1990per * $scale}" stroke-width="" stroke="red"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$maleF1990per * $scale}"
            y2="-{$maleF2000per * $scale}" stroke-width="" stroke="red"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$maleF2000per * $scale}"
            y2="-{$maleF2010per * $scale}" stroke-width="" stroke="red"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$maleF2010per * $scale}"
            y2="-{$maleF2017per * $scale}" stroke-width="" stroke="red"/>
        <!-- start of male female gender lines -->

        <!-- start of male neutral gender points -->
        <circle r="4" cx="{$yearShift}" cy="-{$maleN1980per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$maleN1990per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$maleN2000per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$maleN2010per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$maleN2017per * $scale}" fill="green"/>
        <!-- end of male neutral gender points -->

        <!-- start of male neutral gender lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$maleN1980per * $scale}"
            y2="-{$maleN1990per * $scale}" stroke-width="" stroke="green"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$maleN1990per * $scale}"
            y2="-{$maleN2000per * $scale}" stroke-width="" stroke="green"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$maleN2000per * $scale}"
            y2="-{$maleN2010per * $scale}" stroke-width="" stroke="green"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$maleN2010per * $scale}"
            y2="-{$maleN2017per * $scale}" stroke-width="" stroke="green"/>
        <!-- start of male neutral gender lines -->

        <!-- start of male male gender points -->
        <circle r="4" cx="{$yearShift}" cy="-{$maleM1980per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$maleM1990per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$maleM2000per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$maleM2010per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$maleM2017per * $scale}" fill="blue"/>
        <!-- end of male male gender points -->

        <!-- start of male male gender lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$maleM1980per * $scale}"
            y2="-{$maleM1990per * $scale}" stroke-width="" stroke="blue"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$maleM1990per * $scale}"
            y2="-{$maleM2000per * $scale}" stroke-width="" stroke="blue"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$maleM2000per * $scale}"
            y2="-{$maleM2010per * $scale}" stroke-width="" stroke="blue"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$maleM2010per * $scale}"
            y2="-{$maleM2017per * $scale}" stroke-width="" stroke="blue"/>
        <!-- start of male male gender lines -->

        <!-- start of female female gender points -->
        <circle r="4" cx="{$yearShift}" cy="-{$femF1980per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$femF1990per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$femF2000per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$femF2010per * $scale}" fill="red"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$femF2017per * $scale}" fill="red"/>
        <!-- end of female female gender points -->

        <!-- start of female female gender lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$femF1980per * $scale}"
            y2="-{$femF1990per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$femF1990per * $scale}"
            y2="-{$femF2000per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$femF2000per * $scale}"
            y2="-{$femF2010per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$femF2010per * $scale}"
            y2="-{$femF2017per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="red"/>
        <!-- start of female female gender lines -->

        <!-- start of female neutral gender points -->
        <circle r="4" cx="{$yearShift}" cy="-{$femN1980per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$femN1990per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$femN2000per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$femN2010per * $scale}" fill="green"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$femN2017per * $scale}" fill="green"/>
        <!-- end of female neutral gender points -->

        <!-- start of female neutral gender lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$femN1980per * $scale}"
            y2="-{$femN1990per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="green"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$femN1990per * $scale}"
            y2="-{$femN2000per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width=""
            stroke="green"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$femN2000per * $scale}"
            y2="-{$femN2010per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="green"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$femN2010per * $scale}"
            y2="-{$femN2017per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="green"/>
        <!-- start of female neutral gender lines -->

        <!-- start of female male gender points -->
        <circle r="4" cx="{$yearShift}" cy="-{$femM1980per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 2}" cy="-{$femM1990per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 3}" cy="-{$femM2000per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 4}" cy="-{$femM2010per * $scale}" fill="blue"/>
        <circle r="4" cx="{$yearShift * 5}" cy="-{$femM2017per * $scale}" fill="blue"/>
        <!-- end of female male gender points -->

        <!-- start of female male gender lines -->
        <line x1="{$yearShift}" x2="{$yearShift * 2}" y1="-{$femM1980per * $scale}"
            y2="-{$femM1990per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <line x1="{$yearShift * 2}" x2="{$yearShift * 3}" y1="-{$femM1990per * $scale}"
            y2="-{$femM2000per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <line x1="{$yearShift * 3}" x2="{$yearShift * 4}" y1="-{$femM2000per * $scale}"
            y2="-{$femM2010per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <line x1="{$yearShift * 4}" x2="{$yearShift * 5}" y1="-{$femM2010per * $scale}"
            y2="-{$femM2017per * $scale}" stroke-dasharray="20,10,5,5,5,10" stroke-width="1"
            stroke="blue"/>
        <!-- start of female male gender lines -->

<!-- year labels -->
        <text x="{$yearShift - 15}" y="15" font-size="75%">1980</text>
        <text x="{$yearShift * 2 - 15}" y="15" font-size="75%">1990</text>
        <text x="{$yearShift * 3 - 15}" y="15" font-size="75%">2000</text>
        <text x="{$yearShift * 4 - 15}" y="15" font-size="75%">2010</text>
        <text x="{$yearShift * 5 - 15}" y="15" font-size="75%">2017</text>
    </xsl:template>
</xsl:stylesheet>
