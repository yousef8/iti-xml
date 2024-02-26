<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>My CD Collection</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Title</th>
                        <th>Artist</th>
                        <th>Price</th>
                    </tr>
                    <xsl:apply-templates select="catalog/cd[year &gt; 1990]">
                        <xsl:sort select="country"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="cd">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:value-of select="artist"/>
            </td>
            <xsl:apply-templates select="price"/>
        </tr>
    </xsl:template>

    <xsl:template match="price">
        <xsl:choose>
            <xsl:when test=". >= 10">
                <td style="background-color:red;">
                    <xsl:value-of select="."/>
                </td>
            </xsl:when>
            <xsl:when test=". >= 8">
                <td style="background-color:blue;">
                    <xsl:value-of select="."/>
                </td>
            </xsl:when>
            <xsl:when test=". &lt; 8">
                <td style="background-color:green;">
                    <xsl:value-of select="."/>
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:value-of select="."/>
                </td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>