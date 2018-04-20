<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="index.css"/>
                <title>Songs</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta">
        <section class="meta">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="body">
        <section class="lyrics">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="title | singer | lyricist | release">
        <xsl:choose>
            <xsl:when test="@language = 'japanese'">
                <h2 class="japanese">
                    <xsl:apply-templates/>
                </h2>
            </xsl:when>
            <xsl:otherwise>
                <h2 class="english">
                    <xsl:apply-templates/>
                </h2>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="verse | chorus">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="feature">
        <div class="tooltip">
            <xsl:apply-templates/>
            <span class="tooltiptext">
                <xsl:value-of select="@type"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="@gen"/>
                <xsl:if test="@polite">
                    <xsl:text>, </xsl:text>
                <xsl:value-of select="@polite"/>
                </xsl:if>
                <xsl:if test="@quote">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="@quote"/>
                </xsl:if>
            </span>
        </div>
    </xsl:template>
    <xsl:template match="line">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::line">
            <br/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
