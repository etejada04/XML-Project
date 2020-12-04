<xsl:stylesheet version = '2.0'
     xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
    
<!--Generate main menu-->
<xsl:template match="source">
<xsl:result-document href="index.html"> 
<html>
<head></head>
<title>BIE-XML</title>
<body style="background-color: lightblue">
<h1 style="text-align: center; color: #334d4d"> Project BIE-XML </h1>
<h2 style="color: #334d4d"> Table of content </h2>
<ul type="I">
<xsl:apply-templates select='country' mode='contents' />
</ul>
</body>
</html>
</xsl:result-document>
<xsl:apply-templates select='country' mode='page' />
</xsl:template>

<xsl:template match='country' mode='contents'>
<li>
<a href="{@code}.html"> 
<xsl:value-of select='name'/>
</a>
</li>
</xsl:template>
<!--Generate main menu-->
    
<!--Generate country html file-->    
<xsl:template match='country' mode='page'>
<xsl:result-document href="{@code}.html"> 
<html>
<head></head>
<title>BIE-XML</title>
<body>
<h1 style="text-align: center"><xsl:value-of select='name'/></h1>
<h2 style="color: #334d4d"> Table of content </h2>
<!--Find a better solution-->
<ul type="i">
   <xsl:apply-templates select='introduction | geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues' mode="link"/>
</ul>
<!--Find a better solution-->
<xsl:apply-templates select='title'/>
<div style="background-color: #ffffcc">
<xsl:apply-templates select="*/image"/>
</div>
<xsl:apply-templates select='introduction'/>
<xsl:apply-templates select='geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues'/>
</body>
</html>
</xsl:result-document>
</xsl:template>
    
<!--Generate country menu-->    
<xsl:template match='introduction | geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues' mode="link">
<li> 
  <a href="#h{generate-id()}"> 
      <xsl:value-of select='@header'/> 
  </a>
</li>
</xsl:template>
<!--Generate country menu-->    
    
<xsl:template match='title'> 
    <p style="background-color: #006699; color: white; padding: 10px;">
    <b>
    <xsl:value-of select='@type'/>
    </b>
    </p>
</xsl:template>
    
<xsl:template match='introduction'> 
    <h2 id="h{generate-id()}" style="color: #334d4d">
        <xsl:value-of select='@header'/>
    </h2>
    
    <p style="background-color: lightblue; color: #006699; padding: 10px;">
    <b>
    <xsl:value-of select='introduction/@type'/>
    </b>
    </p>
    
    <p style="color: gray">
        <xsl:value-of select='.'/>
    </p>
</xsl:template>

<xsl:template match='geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues'> 
    <h2 id="h{generate-id()}" style="color: #334d4d">
        <xsl:value-of select='@header'/>
    </h2>
    
    <xsl:for-each select="child::*">
    <p style="background-color: lightblue; color: #006699; padding: 10px;">
    <b>
    <xsl:value-of select='@type'/>
    </b>
    </p>

    <p style="color: gray">
        <xsl:for-each select="child::*">
        <xsl:apply-templates select='@name'/>
        <xsl:value-of select="."/>
        <br/>
        <br/>
        </xsl:for-each>
    </p>
    </xsl:for-each>

</xsl:template>
    
<xsl:template match='@name'>
    <b><xsl:value-of select='.'/></b>
</xsl:template>
    
<xsl:template match="image">
    <xsl:element name="img">
       <xsl:attribute name="src">
           <xsl:value-of select="." />
       </xsl:attribute>
     </xsl:element>
</xsl:template>
<!--Generate country html file-->    

</xsl:stylesheet>
