<xsl:stylesheet version = '2.0'
     xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
<xsl:output indent='yes'/>

  <!-- copy all nodes -->
  <xsl:template match="node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
    
  <!--kepp the value of all attributes-->
  <xsl:template match="@*">
    <xsl:attribute name="{name()}" />
  </xsl:template>

  <xsl:template match="*">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <!-- ignore text content of nodes-->
  <xsl:template match="*/text()">
  <xsl:text> </xsl:text>
  </xsl:template>
    
    
</xsl:stylesheet>

