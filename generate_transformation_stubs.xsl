<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" method="xml"/>

  <xsl:template match="/">
    <xsl:element name="xsl:stylesheet">
      <xsl:namespace name="xsl" select="'http://www.w3.org/1999/XSL/Transform'"/>
      <xsl:attribute name="version" select="'2.0'"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="xs:import">
    <xsl:text>&#xA;</xsl:text>
    <xsl:comment><xsl:value-of select="@schemaLocation"/> was not imported.</xsl:comment>
  </xsl:template>

  <xsl:template match="xs:include">
    <xsl:text>&#xA;</xsl:text>
    <xsl:comment><xsl:value-of select="@schemaLocation"/> was not included.</xsl:comment>
  </xsl:template>

  <xsl:template match="xs:element[@name]">
    <xsl:text>&#xA;&#xA;</xsl:text>
    <xsl:comment> auto generated stub for element <xsl:value-of select="@name"/>
    </xsl:comment>
    <xsl:text>&#xA;</xsl:text>
    <xsl:element name="xsl:template">
      <xsl:attribute name="match" select="@name"/>
      <xsl:element name="xsl:apply-templates"/>
    </xsl:element>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>