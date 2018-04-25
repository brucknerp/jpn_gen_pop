<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:variable name="collection" select="collection('xslt/?select=*.xml')" as="document-node(element(song))+"/>
    <xsl:template match="/">s
        <xsl:message><xsl:value-of select="count($collection)"/></xsl:message>
        
        
            <xsl:for-each select="$collection">
                <xsl:variable name="filename" select="concat(substring-before(tokenize(base-uri(current()), '/')[last()], '.xml'), '.xhtml')"/>
          <xsl:message><xsl:value-of select="$filename"/></xsl:message>
                <xsl:result-document method="xhtml" href="{$filename}">
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="songs.css"/>
                    <title>Songs</title>
                </head>
                <body class="body">
                    <div class="img">
                        <img src="feature_key.jpg" alt="Key of Feature abbreviations"/>
                    </div>
                    <div class="main">
                        <xsl:apply-templates/>
                    </div>
                </body>
            </html>
              </xsl:result-document>
        </xsl:for-each>
        
    </xsl:template>
    <xsl:template match="meta">
        <section class="meta">
            <h3><xsl:text>Title | Singer | Songwriter | Release Date</xsl:text></h3>
            <h3><xsl:apply-templates select="title | singer | lyricist | release"/></h3>
            
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
                <span class="japanese">
                    <xsl:apply-templates/>
                </span>
                <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <span class="english">
                    <xsl:apply-templates/>
                </span>
                <br/>
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template> 
    <xsl:template match="verse | chorus | pre-chorus | bridge">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="feature">
        <span class="tooltip">
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
        </span>
    </xsl:template>
    <xsl:template match="line">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::line">
            <br/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
