<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
	method="html"
	indent="yes"
	version="1.0"
	encoding="ISO-8859-1"
	media-type="html"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="no"/>
	

  <xsl:template match="/">
    <xsl:element name="html">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text()">
	<xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="comment()">
	<xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="img">
	<xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="div">
	<xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="info">
  </xsl:template>
  
  <xsl:template match="stylesheet">
  </xsl:template>

  
  <xsl:template match="document">
  	<xsl:element name="head">
	  	<xsl:element name="title"><xsl:value-of select="@title"/></xsl:element>
	  	<xsl:element name="link">
	  		<xsl:attribute name="rel">StyleSheet</xsl:attribute>
	  		<xsl:attribute name="href">stylesheet.css</xsl:attribute>
	  		<xsl:attribute name="type">text/css</xsl:attribute>
	  	</xsl:element>
  	</xsl:element>
    <xsl:element name="body">
      <xsl:element name="div">
      	<xsl:attribute name="id">showimage</xsl:attribute>
      </xsl:element>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="style">
	<xsl:choose>
		<xsl:when test="@name = 'heading 1'">
			<xsl:element name="h1">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 2'">
			<xsl:element name="h2">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 3'">
			<xsl:element name="h3">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 4'">
			<xsl:element name="h4">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 5'">
			<xsl:element name="h5">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 6'">
			<xsl:element name="h6">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 7'">
			<xsl:element name="h7">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 8'">
			<xsl:element name="h8">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@name = 'heading 9'">
			<xsl:element name="h9">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:when test="@bold = '1'">
			<xsl:element name="b">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates/>
		</xsl:otherwise>
	</xsl:choose>
  </xsl:template>

  <xsl:template match="para">
  	<xsl:if test="count(ancestor::cell)=0">
  		<xsl:element name="p">
		    <xsl:choose>
				<xsl:when test="@style = 'heading 1'">
					<xsl:element name="h1">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 2'">
					<xsl:element name="h2">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 3'">
					<xsl:element name="h3">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 4'">
					<xsl:element name="h4">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 5'">
					<xsl:element name="h5">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 6'">
					<xsl:element name="h6">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 7'">
					<xsl:element name="h7">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 8'">
					<xsl:element name="h8">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@style = 'heading 9'">
					<xsl:element name="h9">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:when test="@bold = '1'">
	  				<xsl:element name="b">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>

    </xsl:if>
  	<xsl:if test="count(ancestor::cell) &gt; 0">
  		<xsl:apply-templates/>
  		<xsl:element name="br"/>
  	</xsl:if> 
  </xsl:template>
  
  <xsl:template match="table">
    <xsl:element name="table">
	  <xsl:if test="@width">
	  	<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
	  </xsl:if>
	  <xsl:if test="not(@width)">
	  	<xsl:attribute name="width">100%</xsl:attribute>
	  </xsl:if>
      <xsl:attribute name="border">1</xsl:attribute>
      <xsl:attribute name="cellpadding">2</xsl:attribute>
      <xsl:attribute name="cellspacing">2</xsl:attribute>
      <xsl:attribute name="frame">VOID</xsl:attribute>
      <xsl:attribute name="rules">ROWS</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="row">
	<xsl:variable name="maxcol">
		<xsl:for-each select="ancestor::table/row">
		  <xsl:sort select="count(cell)" data-type="number" order="descending"/>
		  <xsl:if test="position() = 1">
		    <xsl:value-of select="count(cell)"/>
		  </xsl:if>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="curcol">
		<xsl:value-of select="count(cell)"/>
	</xsl:variable>

	<xsl:if test="$curcol &gt; 0">
	    <xsl:element name="tr">
	   	  <xsl:attribute name="maxcol"><xsl:value-of select="$maxcol"/></xsl:attribute>
		  <xsl:attribute name="curcol"><xsl:value-of select="$curcol"/></xsl:attribute>
	      
	      <xsl:apply-templates>
	      	<xsl:with-param name="colspan">
	      		<xsl:value-of select="$maxcol - $curcol + 1"/>
	      	</xsl:with-param>
	      </xsl:apply-templates>
	      
	    </xsl:element>
    </xsl:if>
	<xsl:if test="$curcol = 0">
	      <xsl:apply-templates/>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="cell">
  	<xsl:param name="colspan">0</xsl:param>
	<xsl:if test="count(following-sibling::cell) = 0">
		  <xsl:apply-templates/>
	</xsl:if>
  	<xsl:if test="count(following-sibling::cell) &gt; 0">
		<xsl:element name="td">
		  <xsl:if test="@width">
		  	<xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
		  </xsl:if>
		  <xsl:if test="$colspan &gt; 1 and child::para and (count(following-sibling::cell)=1 or count(following-sibling::cell[descendant::*[string-length(text()) &gt; 0]])=0)">
		  	<xsl:attribute name="colspan"><xsl:value-of select="$colspan"/></xsl:attribute>
		  	<xsl:if test="count(preceding-sibling::cell) &gt; 0">
		  		<xsl:attribute name="align">center</xsl:attribute>
		  	</xsl:if>
		  </xsl:if>
		  <xsl:apply-templates/>
		</xsl:element>
	</xsl:if>
  </xsl:template>
  
  <xsl:template match="item">
    <xsl:element name="li">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="list">
    <xsl:element name="ul">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="b">
    <xsl:element name="b">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="sup">
    <xsl:element name="sup">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="i">
    <xsl:element name="i">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="a">
  	<xsl:element name="a">
	  	<xsl:if test="@*">
		      <xsl:copy-of select="@*"/>
	    </xsl:if>
		<xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  
  <xsl:template match="topic">
  	<xsl:if test="@linkname">
  		<xsl:element name="div">
  			<xsl:attribute name="topic"><xsl:value-of select="@name"/></xsl:attribute>
  			<xsl:attribute name="level"><xsl:value-of select="@level"/></xsl:attribute>
			<xsl:element name="a">
				<xsl:attribute name="name"><xsl:value-of select="@linkname"/></xsl:attribute>
				<xsl:attribute name="topic"><xsl:value-of select="@name"/></xsl:attribute>
			</xsl:element>	      	
	      	<xsl:apply-templates/>
		</xsl:element>	      	
    </xsl:if>
  </xsl:template>
<!--
	<xsl:template match="navigation">
  	<xsl:if test="@linkname">
  		<xsl:element name="previous">
  			<xsl:attribute name="previous"><xsl:value-of select="@name"/></xsl:attribute>
			<xsl:element name="next">
				<xsl:attribute name="next"><xsl:value-of select="@linkname"/></xsl:attribute>
			</xsl:element>	      	
	      	<xsl:apply-templates/>
		</xsl:element>	      	
    </xsl:if>
  </xsl:template>
-->
  <xsl:template match="*">
	<xsl:value-of select="."/>
  </xsl:template>

</xsl:stylesheet>
