<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:output indent="yes" method="xml"/>
    <xsl:variable name="collection" select="collection('xslt/?select=*.xml')"
        as="document-node(element(song))+"/>
    <xsl:template match="/">
        <data>
            <xsl:for-each select="$collection">
                <xsl:apply-templates select="song"/>
            </xsl:for-each>
        </data>
    </xsl:template>
    <xsl:template match="song">
        <xsl:choose>
            <xsl:when test=".[@gender = 'female'] and .[@year = '1980']">
                <female year="1980">
                    <xsl:apply-templates select="body"/>
                </female>
            </xsl:when>
            <xsl:when test=".[@gender = 'female'] and .[@year = '1990']">
                <female year="1990">
                    <xsl:apply-templates select="body"/>
                </female>
            </xsl:when>
            <xsl:when test=".[@gender = 'female'] and .[@year = '2000']">
                <female year="2000">
                    <xsl:apply-templates select="body"/>
                </female>
            </xsl:when>
            <xsl:when test=".[@gender = 'female'] and .[@year = '2010']">
                <female year="2010">
                    <xsl:apply-templates select="body"/>
                </female>
            </xsl:when>
            <xsl:when test=".[@gender = 'female'] and .[@year = '2017']">
                <female year="2017">
                    <xsl:apply-templates select="body"/>
                </female>
            </xsl:when>
            <xsl:when test=".[@gender = 'male'] and .[@year = '1980']">
                <male year="1980">
                    <xsl:apply-templates select="body"/>
                </male>
            </xsl:when>
            <xsl:when test=".[@gender = 'male'] and .[@year = '1990']">
                <male year="1990">
                    <xsl:apply-templates select="body"/>
                </male>
            </xsl:when>
            <xsl:when test=".[@gender = 'male'] and .[@year = '2000']">
                <male year="2000">
                    <xsl:apply-templates select="body"/>
                </male>
            </xsl:when>
            <xsl:when test=".[@gender = 'male'] and .[@year = '2010']">
                <male year="2010">
                    <xsl:apply-templates select="body"/>
                </male>
            </xsl:when>
            <xsl:otherwise>
                <male year="2017">
                    <xsl:apply-templates select="body"/>
                </male>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="body">
        <gender>
            <feature gen="SF">
                <xsl:apply-templates select="count(//feature[@gen = 'SF'])"/>
            </feature>
            <feature gen="MF">
                <xsl:apply-templates select="count(//feature[@gen = 'MF'])"/>
            </feature>
            <feature gen="N">
                <xsl:apply-templates select="count(//feature[@gen = 'MMN'])"/>
            </feature>
            <feature gen="MMN">
                <xsl:apply-templates select="count(//feature[@gen = 'N'])"/>
            </feature>
            <feature gen="SM">
                <xsl:apply-templates select="count(//feature[@gen = 'SM'])"/>
            </feature>
        </gender>
        <politeness>
            <feature polite="polite">
                <xsl:apply-templates select="count(//feature[@polite = 'polite'])"/>
            </feature>
            <feature polite="plain">
                <xsl:apply-templates select="count(//feature[@polite = 'plain'])"/>
            </feature>
            <feature polite="depr">
                <xsl:apply-templates select="count(//feature[@polite = 'depr'])"/>
            </feature>
        </politeness>
        <type>
            <feature type="SFP"><xsl:apply-templates
                select="count(//feature[@type = 'SFP'])"/></feature>
            <feature type="1p"><xsl:apply-templates select="count(//feature[@type = '1p'])"
            /></feature>
            <feature type="2p"><xsl:apply-templates select="count(//feature[@type = '2p'])"
            /></feature>
            <feature type="3p"><xsl:apply-templates select="count(//feature[@type = '3p'])"
            /></feature>
            <feature type="hon"><xsl:apply-templates select="count(//feature[@type = 'hon'])"
            /></feature>
            <feature type="other"><xsl:apply-templates select="count(//feature[@type = 'other'])"
            /></feature>
        </type>
    </xsl:template>
</xsl:stylesheet>
