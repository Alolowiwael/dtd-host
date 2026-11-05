<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="remote-heavy">
    <xsl:param name="n" select="5"/>
    <xsl:choose>
      <xsl:when test="$n &gt; 0">
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
        <xsl:call-template name="remote-heavy"><xsl:with-param name="n" select="$n - 1"/></xsl:call-template>
      </xsl:when>
      <xsl:otherwise><a/></xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
