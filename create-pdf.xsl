<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
  <xsl:template match="country">
    <fo:root font-family="Helvetica, Arial, sans-serif">
        "http://www.w3.org/1999/XSL/Format"
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4-portrait"
                               page-height="29.7cm"
                               page-width="21.0cm" 
                               margin="2cm">
          <fo:region-body region-name="xsl-region-body" 
                          margin-bottom=".5in" 
                          margin-top=".50in"/>
          <fo:region-before region-name="xsl-region-before" 
                            extent="5in"/>
          <fo:region-after region-name="xsl-region-after" 
                           extent=".2in"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4-portrait" 
                        font-size="12pt">
      <fo:static-content flow-name="xsl-region-before">
           <fo:block font-size="10pt" 
                     text-align="right">
            <xsl:value-of select="name"/></fo:block>
      </fo:static-content>
      <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align-last="justify"
                    text-align="right"
                    font-size="10pt">
             Eder Jair Tejada Ortigoza
          <fo:leader leader-pattern="space" />
             Page <fo:page-number/> of <fo:page-number-citation ref-id="last-page" />
          </fo:block>
      </fo:static-content>
       
        <fo:flow flow-name="xsl-region-body">
            
        <fo:block font-size="20pt" 
                  text-align="center"
                  font-weight="bold">
          Czech Technical University
          </fo:block>
            
        <fo:block font-size="20pt" 
                  text-align="center"
                  font-weight="bold">
          BIE-XML
          </fo:block>
            
         <fo:block font-size="18pt" 
                   font-weight="bold">Table of content:</fo:block>
            <fo:list-block page-break-after="always">
                <fo:list-item>
                    <fo:list-item-label>
                        <fo:block></fo:block>
                    </fo:list-item-label>
                    
                    <fo:list-item-body> 
                        <fo:block font-size="15pt"
                                  color="#006699">
                        <xsl:apply-templates select='introduction | geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues' mode="link"/>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block> 
            
          <fo:block font-size="20pt" 
                    text-align="center">
          <xsl:value-of select="name"/>
          </fo:block>  

          <fo:block> 
                <xsl:apply-templates select='title'/>
              <!--Pictures-->
                    <fo:inline><fo:external-graphic src="url('{/country/title/image[1]}')"
                    content-height="270px"
                    content-width="270px"/></fo:inline>
                    <fo:inline><fo:external-graphic src="url('{/country/title/image[2]}')"
                    content-height="200px"
                    content-width="200px"/></fo:inline>
                    <fo:block><fo:external-graphic src="url('{/country/title/image[3]}')"
                    content-height="300px"
                    content-width="300px"/></fo:block>
              <!--Pictures-->
                <xsl:apply-templates select='introduction'/>
                <xsl:apply-templates select='geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues'/>
          </fo:block>
          <fo:block id="last-page"> </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
    

<xsl:template match='introduction | geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues' mode="link">
<fo:basic-link internal-destination="{generate-id(.)}">
          <xsl:value-of select='@header'/>
          <fo:block>&#xA;</fo:block>
</fo:basic-link>
</xsl:template>
    
<xsl:template match='title'> 
    <fo:block background-color="#006699" 
              color="white" 
              padding="10px">
    <xsl:value-of select='@type'/>
    </fo:block>
</xsl:template>
    
<xsl:template match='introduction'> 
    <fo:block color="#334d4d" 
              font-size="18pt" 
              id="{generate-id(.)}">
        <xsl:value-of select='@header'/>
    </fo:block>
    
    <fo:block background-color="lightblue" 
              color="#006699" 
              padding="10px"><xsl:value-of select='introduction/@type'/></fo:block>
    
    <fo:block color="gray">
        <xsl:value-of select='.'/>
    </fo:block>
</xsl:template>

<!--TEMPLATES-->
<xsl:template match='geography | people-society | government | economy | energy | communications |  transportation | military-security | transnational-issues'> 
    <fo:block color="#334d4d" 
              font-size="18pt" 
              id="{generate-id(.)}">
        <xsl:value-of select='@header'/></fo:block>
    
    <xsl:for-each select="child::*">
    <fo:block background-color="lightblue" 
              color="#006699" 
              padding="10px">
    <fo:inline font-weight="bold">
    <xsl:value-of select='@type'/>
    </fo:inline>
    </fo:block>

    <fo:block linefeed-treatment="preserve" 
              color="gray">
        <xsl:for-each select="child::*">
        <xsl:apply-templates select='@name'/>
        <xsl:value-of select="."/>
        <fo:block>&#xA;</fo:block>
        </xsl:for-each>
    </fo:block>
    </xsl:for-each>

</xsl:template>
    
<xsl:template match='@name'>
   <fo:inline font-weight="bold">
       <xsl:value-of select='.'/>
    </fo:inline>
</xsl:template>
<!--TEMPLATES-->
</xsl:stylesheet>
