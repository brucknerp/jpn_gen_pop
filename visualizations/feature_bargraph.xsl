<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
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
    <xsl:variable name="barHeight" select="300" as="xs:integer"/>
    <!-- shifts away from x-axis -->
    <xsl:variable name="shift" select="50" as="xs:integer"/>
    <!-- shifts bar from x-axis -->
    <xsl:variable name="barShift" select="$shift + $interbarSpacing" as="xs:double"/>
    <xsl:variable name="femBarShift" select="$barShift + $barWidth" as="xs:double"/>
    <xsl:variable name="xLength" select="3 * $barInterval + $barShift * 2" as="xs:double"/>
    <xsl:template match="/">
        <svg width="{$xLength+ 100}" height="{$barHeight + 200}">
            <g transform="translate(40,{$barHeight + 100})">
                <!-- title -->
                <text x="{$xLength div 2 - 100}" y="-{$barHeight + 20}" stroke="#c30000" font-size="150%">Percentage by
                    Features</text>
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
                <text x="{$xLength div 2 +30}" y="45" text-anchor="middle" font-size="85%">Gender
                    Feature Type</text>
                <!-- legend -->
                <rect x="{$xLength - 100}" y="-{$barHeight - 50}" width="100" height="70"
                    stroke="black" stroke-width="1" fill="white"/>
                <rect x="{$xLength - 90}" y="-{$barHeight - 60}" width="10" height="10"
                    stroke="black" stroke-width="1" fill="#e6ccff"/>
                <text x="{$xLength - 70}" y="-{$barHeight - 70}" font-size="75%">Male</text>
                <rect x="{$xLength - 90}" y="-{$barHeight - 90}" width="10" height="10"
                    stroke="black" stroke-width="1" fill="#ffcccc"/>
                <text x="{$xLength - 70}" y="-{$barHeight - 100}" font-size="75%">Female</text>
                <xsl:apply-templates/>
            </g>
        </svg>
    </xsl:template>

    <xsl:template match="data">

        <!-- start of male gender variables -->
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
        <!-- end of male gender variables variables -->

        <!-- start of female gender variables -->
        <xsl:variable name="femSFper"
            select="sum(female/gender/feature[@gen = 'SF']) div $femGenTotal" as="xs:double"/>
        <xsl:variable name="femSMper"
            select="sum(female/gender/feature[@gen = 'SM']) div $femGenTotal" as="xs:double"/>
        <xsl:variable name="femMFper"
            select="sum(female/gender/feature[@gen = 'MF']) div $femGenTotal" as="xs:double"/>
        <xsl:variable name="femNper"
            select="sum(female/gender/feature[@gen = 'N']) div $femGenTotal" as="xs:double"/>
        <xsl:variable name="femMMNper"
            select="sum(female/gender/feature[@gen = 'MMN']) div $femGenTotal" as="xs:double"/>
        <!-- end of female gender variables -->

        <!-- start of male politness variables -->
        <xsl:variable name="politePos" select="$barShift + $barInterval" as="xs:double"/>
        <xsl:variable name="malePoliteper"
            select="sum(male/politeness/feature[@polite = 'polite']) div $malePolTotal"
            as="xs:double"/>
        <xsl:variable name="maleplainper"
            select="sum(male/politeness/feature[@polite = 'plain']) div $malePolTotal"
            as="xs:double"/>
        <xsl:variable name="maledeprper"
            select="sum(male/politeness/feature[@polite = 'depr']) div $malePolTotal" as="xs:double"/>
        <!-- end of male politeness variables -->

        <!-- start of female politness variables -->
        <xsl:variable name="femPolitePos" select="$femBarShift + $barInterval" as="xs:double"/>
        <xsl:variable name="femPoliteper"
            select="sum(female/politeness/feature[@polite = 'polite']) div $femalePolTotal"
            as="xs:double"/>
        <xsl:variable name="femplainper"
            select="sum(female/politeness/feature[@polite = 'plain']) div $femalePolTotal"
            as="xs:double"/>
        <xsl:variable name="femdeprper"
            select="sum(female/politeness/feature[@polite = 'depr']) div $femalePolTotal"
            as="xs:double"/>
        <!-- end of female politeness variables -->

        <!-- start of male type variables -->
        <xsl:variable name="typePos" select="$politePos + $barInterval" as="xs:double"/>
        <xsl:variable name="maleSFPper"
            select="sum(male/type/feature[@type = 'SFP']) div $maleTypeTotal" as="xs:double"/>
        <xsl:variable name="male1pper"
            select="sum(male/type/feature[@type = '1p']) div $maleTypeTotal" as="xs:double"/>
        <xsl:variable name="male2pper"
            select="sum(male/type/feature[@type = '2p']) div $maleTypeTotal" as="xs:double"/>
        <xsl:variable name="male3pper"
            select="sum(male/type/feature[@type = '3p']) div $maleTypeTotal" as="xs:double"/>
        <xsl:variable name="malehonper"
            select="sum(male/type/feature[@type = 'hon']) div $maleTypeTotal" as="xs:double"/>
        <xsl:variable name="maleotherper"
            select="sum(male/type/feature[@type = 'other']) div $maleTypeTotal" as="xs:double"/>
        <!-- end of male type variables -->

        <!-- start of female type variables -->
        <xsl:variable name="femTypePos" select="$femPolitePos + $barInterval" as="xs:double"/>
        <xsl:variable name="femSFPper"
            select="sum(female/type/feature[@type = 'SFP']) div $femTypeTotal" as="xs:double"/>
        <xsl:variable name="fem1pper"
            select="sum(female/type/feature[@type = '1p']) div $femTypeTotal" as="xs:double"/>
        <xsl:variable name="fem2pper"
            select="sum(female/type/feature[@type = '2p']) div $femTypeTotal" as="xs:double"/>
        <xsl:variable name="fem3pper"
            select="sum(female/type/feature[@type = '3p']) div $femTypeTotal" as="xs:double"/>
        <xsl:variable name="femhonper"
            select="sum(female/type/feature[@type = 'hon']) div $femTypeTotal" as="xs:double"/>
        <xsl:variable name="femotherper"
            select="sum(female/type/feature[@type = 'other']) div $femTypeTotal" as="xs:double"/>
        <!-- end of female type variables -->

        <!-- start of male gender-->
        <!-- maleSF bar -->
        <rect x="{$barShift}" y="-{$maleSFper * $barHeight}" width="{$barWidth}"
            height="{$maleSFper * $barHeight}" stroke=" #6900cc" stroke-width=".5" fill="#7700e6"/>
        <!-- maleSM bar -->
        <rect x="{$barShift}" y="-{$barHeight}" width="{$barWidth}"
            height="{$maleSMper * $barHeight}" stroke="#dab3ff" stroke-width=".5" fill=" #e6ccff"/>
        <!-- maleMF bar -->
        <rect x="{$barShift}" y="-{($maleSFper * $barHeight) + ($maleMFper * $barHeight)}"
            width="{$barWidth}" height="{$maleMFper * $barHeight}" stroke="#901aff"
            stroke-width=".5" fill="#9c33ff"/>
        <!-- maleN bar -->
        <rect x="{$barShift}"
            y="-{($maleSFper * $barHeight) + ($maleMFper * $barHeight) + ($maleNper * $barHeight)}"
            width="{$barWidth}" height="{$maleNper * $barHeight}" stroke="#a94dff" stroke-width=".5"
            fill="#b566ff"/>
        <!-- maleMMN bar -->
        <rect x="{$barShift}"
            y="-{($maleSFper * $barHeight) + ($maleMFper * $barHeight) + ($maleNper * $barHeight) + ($maleMMNper * $barHeight)}"
            width="{$barWidth}" height="{$maleMMNper * $barHeight}" stroke="#c180ff"
            stroke-width=".5" fill="#ce99ff"/>
        <!-- Gender label-->
        <text x="{($barShift + $femBarShift + $barWidth) div 2}" y="30"
            transform="rotate(-50 {(($barShift + $femBarShift + $barWidth) div 2)-15} 0)"
            text-anchor="end" font-size="75%">Gender</text>
        <!-- MaleSF per -->
        <text x="{$barShift  + ($barWidth div 2)}" y="-{(($maleSFper * $barHeight) div 2 - 10)}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($maleSFper * 100)"/>%</text>
        <!-- MaleSF label -->
        <text x="{$barShift  + ($barWidth div 2)}" y="-{(($maleSFper * $barHeight) div 2 + 6)}"
            text-anchor="middle" font-size="100%" fill="white">SF</text>
        <!-- MaleSM per -->
        <text x="{$barShift  + (
            $barWidth div 2)}"
            y="-{($barHeight - (($maleSMper * $barHeight) div 2)) - 15}" text-anchor="middle"
            font-size="100%" fill="white"><xsl:value-of select="round($maleSMper * 100)"/>%</text>
        <!-- MaleSM label -->
        <text x="{$barShift  + (
            $barWidth div 2)}"
            y="-{$barHeight - ($maleSMper * $barHeight) div 2}" text-anchor="middle"
            font-size="100%" fill="white">SM</text>
        <!-- MaleN per -->
        <text x="{$barShift  + ($barWidth div 2)}"
            y="-{((($maleNper * $barHeight) div 2) + ($maleMFper * $barHeight) + ($maleSFper * $barHeight)) - 20}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($maleNper * 100)"/>%</text>
        <!-- MaleN label -->
        <text x="{$barShift  + ($barWidth div 2)}"
            y="-{((($maleNper * $barHeight) div 2) + ($maleMFper * $barHeight) + ($maleSFper * $barHeight))}"
            text-anchor="middle" font-size="100%" fill="white">N</text>
        <!-- MaleMMN per -->
        <text x="{$barShift  + ($barWidth div 2)}"
            y="-{((($maleMMNper * $barHeight) div 2)+ ($maleNper * $barHeight) + ($maleMFper * $barHeight) + ($maleSFper * $barHeight)) - 19}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($maleMMNper * 100)"/>%</text>
        <!-- MaleMMN label -->
        <text x="{$barShift  + ($barWidth div 2)}"
            y="-{((($maleMMNper * $barHeight) div 2)+ ($maleNper * $barHeight) + ($maleMFper * $barHeight) + ($maleSFper * $barHeight)) + 1}"
            text-anchor="middle" font-size="100%" fill="white">MMN</text>
        <!-- end of male gender -->

        <!-- start of female gender -->
        <!-- femaleSF bar -->
        <rect x="{$femBarShift}" y="-{$femSFper * $barHeight}" width="{$barWidth}"
            height="{$femSFper * $barHeight}" stroke="#cc0000" stroke-width=".5" fill="#e60000"/>
        <!-- femaleSM bar -->
        <rect x="{$femBarShift}" y="-{$barHeight}" width="{$barWidth}"
            height="{$femSMper * $barHeight}" stroke="#ffb3b3" stroke-width=".5" fill="#ffcccc"/>
        <!-- femaleMF bar -->
        <rect x="{$femBarShift}" y="-{($femSFper * $barHeight) + ($femMFper * $barHeight)}"
            width="{$barWidth}" height="{$femMFper * $barHeight}" stroke="#ff1a1a" stroke-width=".5"
            fill="#ff3333"/>
        <!-- femaleN bar -->
        <rect x="{$femBarShift}"
            y="-{($femSFper * $barHeight) + ($femMFper * $barHeight) + ($femNper * $barHeight)}"
            width="{$barWidth}" height="{$femNper * $barHeight}" stroke="#ff4d4d" stroke-width=".5"
            fill="#ff6666"/>
        <!-- femaleMMN bar -->
        <rect x="{$femBarShift}"
            y="-{($femSFper * $barHeight) + ($femMFper * $barHeight) + ($femNper * $barHeight) + ($femMMNper * $barHeight)}"
            width="{$barWidth}" height="{$femMMNper * $barHeight}" stroke="#ff8080"
            stroke-width=".5" fill="#ff9999"/>
        <!-- femaleSF per -->
        <text x="{$femBarShift  + ($barWidth div 2)}" y="-{((($femSFper * $barHeight) div 2) - 20)}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($femSFper * 100)"/>%</text>
        <!-- femaleSF label -->
        <text x="{$femBarShift  + ($barWidth div 2)}" y="-{((($femSFper * $barHeight) div 2))}"
            text-anchor="middle" font-size="100%" fill="white">SF</text>
        <!-- femaleSM per -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{($barHeight - ($femSMper * $barHeight div 2)) -19}" text-anchor="middle"
            font-size="100%" fill="white"><xsl:value-of select="round($femSMper * 100)"/>%</text>
        <!-- femaleSM label -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{($barHeight - ($femSMper * $barHeight div 2)) + 1}" text-anchor="middle"
            font-size="100%" fill="white">SM</text>
        <!-- femaleMF per -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{($femSFper * $barHeight) + (($femMFper * $barHeight) div 2) - 15}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($femMFper * 100)"/>%</text>
        <!-- femaleMF label -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{($femSFper * $barHeight) + (($femMFper * $barHeight) div 2)}" text-anchor="middle"
            font-size="100%" fill="white">MF</text>
        <!-- femaleN per -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{((($femNper * $barHeight) div 2) + ($femMFper * $barHeight) + ($femSFper * $barHeight)) - 17}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($femNper * 100)"/>%</text>
        <!-- femaleN label -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{((($femNper * $barHeight) div 2) + ($femMFper * $barHeight) + ($femSFper * $barHeight)) + 3}"
            text-anchor="middle" font-size="100%" fill="white">N</text>
        <!-- femaleMMN per -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{((($femMMNper * $barHeight)  div 2)+ ($femNper * $barHeight) + ($femMFper * $barHeight) + ($femSFper * $barHeight)) -20}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($femMMNper * 100)"/>%</text>
        <!-- femaleMMN label -->
        <text x="{$femBarShift  + ($barWidth div 2)}"
            y="-{((($femMMNper * $barHeight)  div 2)+ ($femNper * $barHeight) + ($femMFper * $barHeight) + ($femSFper * $barHeight))}"
            text-anchor="middle" font-size="100%" fill="white">MMN</text>
        <!-- end of female gender -->

        <!-- start of male politeness -->
        <!-- malePolite bar -->
        <rect x="{$politePos}" y="-{$malePoliteper * $barHeight}" width="{$barWidth}"
            height="{$malePoliteper * $barHeight}" stroke="#a94dff" stroke-width=".5" fill="#b566ff"/>
        <!-- maleDepr bar -->
        <rect x="{$politePos}" y="-{$barHeight}" width="{$barWidth}"
            height="{$maledeprper * $barHeight}" stroke="#dab3ff" stroke-width=".5" fill=" #e6ccff"/>
        <!-- malePlain bar -->
        <rect x="{$politePos}" y="-{($malePoliteper * $barHeight) + ($maleplainper * $barHeight)}"
            width="{$barWidth}" height="{$maleplainper * $barHeight}" stroke="#c180ff"
            stroke-width=".5" fill="#ce99ff"/>
        <!-- Politeness label-->
        <text x="{($politePos + $femPolitePos + $barWidth) div 2}" y="30"
            transform="rotate(-50 {(($politePos + $femPolitePos + $barWidth) div 2)-15} 0)"
            text-anchor="end" font-size="75%">Politeness</text>
        <!-- MalePolite per -->
        <text x="{$politePos  + ($barWidth div 2)}"
            y="-{((($malePoliteper * $barHeight) div 2)- 20)}" text-anchor="middle" font-size="100%"
            fill="white"><xsl:value-of select="round($malePoliteper * 100)"/>%</text>
        <!-- MalePolite label -->
        <text x="{$politePos  + ($barWidth div 2)}" y="-{((($malePoliteper * $barHeight) div 2))}"
            text-anchor="middle" font-size="100%" fill="white">Polite</text>
        <!-- MaleDepr per -->
        <text x="{$politePos  + ($barWidth div 2)}"
            y="-{(($barHeight) - ($maledeprper * $barHeight div 2) )-19}" text-anchor="middle"
            font-size="100%" fill="white"><xsl:value-of select="round($maledeprper * 100)"/>%</text>
        <!-- MaleDepr label -->
        <text x="{$politePos  + ($barWidth div 2)}"
            y="-{(($barHeight) - ($maledeprper * $barHeight div 2)) + 1}" text-anchor="middle"
            font-size="100%" fill="white">Depr</text>
        <!-- MalePlain per -->
        <text x="{$politePos  + ($barWidth div 2)}"
            y="-{(($malePoliteper * $barHeight) + ($maleplainper * $barHeight div 2)) - 20}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($maleplainper * 100)"/>%</text>
        <!-- MalePlain label -->
        <text x="{$politePos  + ($barWidth div 2)}"
            y="-{(($malePoliteper * $barHeight) + ($maleplainper * $barHeight div 2))}"
            text-anchor="middle" font-size="100%" fill="white">Plain</text>
        <!-- end of male politeness -->

        <!-- start of female politeness -->
        <!-- femalePolite bar -->
        <rect x="{$femPolitePos}" y="-{$femPoliteper * $barHeight}" width="{$barWidth}"
            height="{$femPoliteper * $barHeight}" stroke="#ff1a1a" stroke-width=".5" fill="#ff3333"/>
        <!-- femaleDepr bar -->
        <rect x="{$femPolitePos}" y="-{$barHeight}" width="{$barWidth}"
            height="{$femdeprper * $barHeight}" stroke="#dab3ff" stroke-width=".5" fill="#ffcccc"/>
        <!-- femalePlain bar -->
        <rect x="{$femPolitePos}" y="-{($femPoliteper * $barHeight) + ($femplainper * $barHeight)}"
            width="{$barWidth}" height="{$femplainper * $barHeight}" stroke="#ff4d4d"
            stroke-width=".5" fill="#ff6666"/>
        <!-- femalePolite per -->
        <text x="{$femPolitePos  + ($barWidth div 2)}"
            y="-{(($femPoliteper * $barHeight div 2) - 20)}" text-anchor="middle" font-size="100%"
            fill="white"><xsl:value-of select="round($femPoliteper * 100)"/>%</text>
        <!-- femalePolite label -->
        <text x="{$femPolitePos  + ($barWidth div 2)}" y="-{(($femPoliteper * $barHeight div 2)) + 6}"
            text-anchor="middle" font-size="100%" fill="white">Polite</text>
        <!-- femalePlain per -->
        <text x="{$femPolitePos  + ($barWidth div 2)}"
            y="-{(($femPoliteper * $barHeight) + ($femplainper * $barHeight div 2)) - 20}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($femplainper * 100)"/>%</text>
        <!-- femalePlain label -->
        <text x="{$femPolitePos  + ($barWidth div 2)}"
            y="-{(($femPoliteper * $barHeight) + ($femplainper * $barHeight div 2))}"
            text-anchor="middle" font-size="100%" fill="white">Plain</text>
        <!-- end of female politeness -->

        <!-- start of male type -->
        <!-- maleSFP bar -->
        <rect x="{$typePos}" y="-{$maleSFPper * $barHeight}" width="{$barWidth}"
            height="{$maleSFPper * $barHeight}" stroke=" #5c00b3" stroke-width=".5" fill="#6900cc"/>
        <!-- maleOther bar -->
        <rect x="{$typePos}" y="-{$barHeight}" width="{$barWidth}"
            height="{$maleotherper * $barHeight}" stroke="#dab3ff" stroke-width=".5" fill="#e6ccff"/>
        <!-- male1p bar -->
        <rect x="{$typePos}" y="-{($male1pper * $barHeight) + ($maleSFPper * $barHeight)}"
            width="{$barWidth}" height="{$male1pper * $barHeight}" stroke="#7700e6"
            stroke-width=".5" fill="#8400ff"/>
        <!-- male2p bar -->
        <rect x="{$typePos}"
            y="-{($male2pper * $barHeight) + ($male1pper * $barHeight) + ($maleSFPper * $barHeight)}"
            width="{$barWidth}" height="{$male2pper * $barHeight}" stroke="#901aff"
            stroke-width=".5" fill="#9c33ff"/>
        <!-- male3p bar -->
        <rect x="{$typePos}"
            y="-{($male3pper * $barHeight) + ($male2pper * $barHeight) + ($male1pper * $barHeight) + ($maleSFPper * $barHeight)}"
            width="{$barWidth}" height="{$male3pper * $barHeight}" stroke="#a94dff"
            stroke-width=".5" fill="#b566ff"/>
        <!-- maleHon bar -->
        <rect x="{$typePos}"
            y="-{($malehonper * $barHeight) + ($male3pper * $barHeight) + ($male2pper * $barHeight) + ($male1pper * $barHeight) + ($maleSFPper * $barHeight)}"
            width="{$barWidth}" height="{$malehonper * $barHeight}" stroke="#c180ff"
            stroke-width=".5" fill="#ce99ff"/>
        <!-- Type label-->
        <text x="{($typePos + $femTypePos + $barWidth) div 2}" y="30"
            transform="rotate(-50 {(($typePos + $femTypePos + $barWidth) div 2)-15} 0)"
            text-anchor="end" font-size="75%">Type</text>
        <!-- MaleSFP per -->
        <text x="{$typePos  + ($barWidth div 2)}" y="-{((($maleSFPper * $barHeight) div 2)- 20)}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($maleSFPper * 100)"/>%</text>
        <!-- MaleSFP label -->
        <text x="{$typePos  + ($barWidth div 2)}" y="-{((($maleSFPper * $barHeight) div 2))}"
            text-anchor="middle" font-size="100%" fill="white">SFP</text>
        <!-- Male1p per -->
        <text x="{$typePos  + ($barWidth div 2)}"
            y="-{(($male1pper * $barHeight div 2) + ($maleSFPper * $barHeight )) - 20}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($male1pper * 100)"/>%</text>
        <!-- Male1pper label -->
        <text x="{$typePos  + ($barWidth div 2)}"
            y="-{(($male1pper * $barHeight div 2) + ($maleSFPper * $barHeight))}"
            text-anchor="middle" font-size="100%" fill="white">1p</text>
        <!-- Male2p per -->
        <text x="{$typePos  + ($barWidth div 2)}"
            y="-{(($male2pper * $barHeight div 2) + ($male1pper * $barHeight) + ($maleSFPper * $barHeight)) - 20}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($male2pper * 100)"/>%</text>
        <!-- Male2pper label -->
        <text x="{$typePos  + ($barWidth div 2)}"
            y="-{(($male2pper * $barHeight div 2) + ($male1pper * $barHeight) + ($maleSFPper * $barHeight))}"
            text-anchor="middle" font-size="100%" fill="white">2p</text>
        <!-- end of male type -->

        <!-- start of female type -->
        <!-- femaleSFP bar -->
        <rect x="{$femTypePos}" y="-{$femSFPper * $barHeight}" width="{$barWidth}"
            height="{$femSFPper * $barHeight}" stroke="#ff0000" stroke-width=".5" fill="#ff1a1a"/>
        <!-- femaleOther bar -->
        <rect x="{$femTypePos}" y="-{$barHeight}" width="{$barWidth}"
            height="{$femotherper * $barHeight}" stroke="#ffb3b3" stroke-width=".5" fill="#ffcccc"/>
        <!-- female1p bar -->
        <rect x="{$femTypePos}" y="-{($fem1pper * $barHeight) + ($femSFPper * $barHeight)}"
            width="{$barWidth}" height="{$fem1pper * $barHeight}" stroke="#ff3333" stroke-width=".5"
            fill="#ff4d4d"/>
        <!-- female2p bar -->
        <rect x="{$femTypePos}"
            y="-{($fem2pper * $barHeight) + ($fem1pper * $barHeight) + ($femSFPper * $barHeight)}"
            width="{$barWidth}" height="{$fem2pper * $barHeight}" stroke="#ff6666" stroke-width=".5"
            fill="#ff8080"/>
        <!-- female3p bar -->
        <rect x="{$femTypePos}"
            y="-{($fem3pper * $barHeight) + ($fem2pper * $barHeight) + ($fem1pper * $barHeight) + ($femSFPper * $barHeight)}"
            width="{$barWidth}" height="{$fem3pper * $barHeight}" stroke="#ffb3b3" stroke-width=".5"
            fill="#ffcccc"/>
        <!-- femaleHon bar -->
        <rect x="{$femTypePos}"
            y="-{($femhonper * $barHeight) + ($fem3pper * $barHeight) + ($fem2pper * $barHeight) + ($fem1pper * $barHeight) + ($femSFPper * $barHeight)}"
            width="{$barWidth}" height="{$femhonper * $barHeight}" stroke="#ff4d4d"
            stroke-width=".5" fill="#ff6666"/>
        <!-- femaleSFP per -->
        <text x="{$femTypePos  + ($barWidth div 2)}" y="-{((($femSFPper * $barHeight) div 2)- 20)}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($femSFPper * 100)"/>%</text>
        <!-- femaleSFP label -->
        <text x="{$femTypePos  + ($barWidth div 2)}" y="-{((($femSFPper * $barHeight) div 2))}"
            text-anchor="middle" font-size="100%" fill="white">SFP</text>
        <!-- female1p per -->
        <text x="{$femTypePos  + ($barWidth div 2)}"
            y="-{(($fem1pper * $barHeight div 2) + ($femSFPper * $barHeight )) - 19}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($fem1pper * 100)"/>%</text>
        <!-- female1pper label -->
        <text x="{$femTypePos  + ($barWidth div 2)}"
            y="-{(($fem1pper * $barHeight div 2) + ($femSFPper * $barHeight)) + 1}" text-anchor="middle"
            font-size="100%" fill="white">1p</text>
        <!-- female2p per -->
        <text x="{$femTypePos  + ($barWidth div 2)}"
            y="-{(($fem2pper * $barHeight div 2) + ($fem1pper * $barHeight) + ($femSFPper * $barHeight)) - 20}"
            text-anchor="middle" font-size="100%" fill="white"><xsl:value-of
                select="round($fem2pper * 100)"/>%</text>
        <!-- female2pper label -->
        <text x="{$femTypePos  + ($barWidth div 2)}"
            y="-{(($fem2pper * $barHeight div 2) + ($fem1pper * $barHeight) + ($femSFPper * $barHeight))}"
            text-anchor="middle" font-size="100%" fill="white">2p</text>
        <!-- end of female type -->
    </xsl:template>
</xsl:stylesheet>