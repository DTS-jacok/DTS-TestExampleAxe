<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--
############################## Axe Subtest Usage transform ############################################################### 
#
#	Copyright:	(c)Copyright 2011 Odin Technology Ltd. All Rights Reserved.
#	Version:	v1.0 rev 0
#	Contact:	www.odintech.com
#
########################################################################################################################## -->
<xsl:param name="showsys" />
<xsl:param name="sort" />
<xsl:template match="subtest_coverage">
<div>
<div class="mainheading">Axe Subtest Usage Statistics</div>
<div class="subpanel">
	<table class="summary">
    <tr>		
		<td class="value"><a href="objectusage.html">Object Usage</a></td>
		<td class="value"><a href="actionusage.html">Action Usage</a></td>			
    </tr>
	</table>	
</div>

<div class="subpanel">
  <table class="summary">
    <tr>
      <th class="vrowlabel">Project</th>
      <td class="value"><xsl:value-of select="project" /></td>
    </tr>
    <tr>
      <th class="vrowlabel">Configuration</th>
      <td class="value"><xsl:value-of select="config/@name" /></td>
    </tr>
    <tr>
      <th class="vrowlabel">Test Suite</th>
      <td class="value"><xsl:value-of select="testsuite" /></td>
    </tr>
  </table>						
</div>
    
<div class="subpanel">
  <table class="summary">
    <tr>
      <th class="vrowlabel">Total Subtests</th>
<td class="value">
   <xsl:value-of select="count(subtest)"/>
</td>
      <th class="vrowlabel">Unused Subtests</th>

<td class="value">
   <xsl:value-of select="count(subtest[count='0'])"/>
</td>

      <th class="vrowlabel">Usage</th>

<td class="value">
  <xsl:value-of select="format-number((count(subtest) - count(subtest[count='0'])) div count(subtest), '##0.0%')"/>
</td>
    </tr>

  </table>
</div>

<xsl:if test="$sort = 'x'">
		count
</xsl:if>

<div class="subpanel">

<table class="results">
    <tr class="heading">
	<th class="heading">
	<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('subtest')</xsl:attribute>	
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>
	Subtest
	</th>

	<th class="heading">
	<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('count')</xsl:attribute>	
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	Count
	</th>
	
     </tr>

	<xsl:if test="$sort = ''">
		<xsl:apply-templates select="subtest">
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'subtest'">
		<xsl:apply-templates select="subtest">
			<xsl:sort select="name" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'count'">
		<xsl:apply-templates select="subtest">
			<xsl:sort select="count" data-type="number" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	
  </table>
</div>

</div>
</xsl:template>

<xsl:template match="subtest">	
		<tr class="resultrow">
		<td class="value"><xsl:value-of select="name"/></td>
		<td class="value"><xsl:value-of select="count"/></td>				
		</tr>	
</xsl:template>

</xsl:stylesheet>