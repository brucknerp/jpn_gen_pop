<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:variable name="collection" select="collection('xslt/?select=*.xml')"
        as="document-node(element(song))+"/>
    <!-- The $genders, $politeness, and $types variables are used 
        below in loops to create tables for each song -->
    <xsl:variable name="genders" as="xs:string+"
        select="sort(distinct-values($collection//feature/@gen))"/>
    <xsl:variable name="politenesses" as="xs:string+"
        select="sort(distinct-values($collection//feature/@polite))"/>
    <xsl:variable name="types" as="xs:string+"
        select="sort(distinct-values($collection//feature/@type))"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Linguistic feature counts by song</title>
                <style type="text/css">
                    table,
                    tr,
                    th,
                    td {
                        border: 1px solid black;
                    }</style>
            </head>
            <body>
                <h1>Linguistic feature counts by song</h1>
                <xsl:for-each select="$collection">
                    <xsl:apply-templates select="song"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="song">
        <section>
            <h2>
                <xsl:value-of select="string-join(meta/title, ' : ')"/>
            </h2>
            <!-- We removed the <xsl:choose> because it was always choosing the "otherwise" branch -->
            <xsl:apply-templates select="body"/>
        </section>
    </xsl:template>
    <xsl:template match="body">
        <!-- When we run a for-loop over the genders, politenesses, and types, that cuts us off
        from the tree of the song we're processing at the moment. We save the root of that tree
        in a $root variable so that we can access it even within the for-loops -->
        <xsl:variable name="root" as="document-node(element(song))" select="root(.)"/>
        <table>
            <tr>
                <th colspan="2">Gender</th>
            </tr>
            <!-- Loop over the distinct genders and count the matching features; 
            do the same for politenesses and types-->
            <xsl:for-each select="$genders">
                <tr>
                    <th>
                        <xsl:value-of select="current()"/>
                    </th>
                    <td>
                        <xsl:value-of select="count($root//feature[@gen eq current()])"/>
                    </td>
                </tr>
            </xsl:for-each>
            <tr>
                <th colspan="2">Politenesses</th>
            </tr>
            <xsl:for-each select="$politenesses">
                <tr>
                    <th>
                        <xsl:value-of select="current()"/>
                    </th>
                    <td>
                        <xsl:value-of select="count($root//feature[@polite eq current()])"/>
                    </td>
                </tr>
            </xsl:for-each>
            <tr>
                <th colspan="2">Types</th>
            </tr>
            <xsl:for-each select="$types">
                <tr>
                    <th>
                        <xsl:value-of select="current()"/>
                    </th>
                    <td>
                        <xsl:value-of select="count($root//feature[@type eq current()])"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
