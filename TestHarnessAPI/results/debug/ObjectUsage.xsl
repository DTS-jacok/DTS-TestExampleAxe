<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--
############################## Axe Object Usage transform ############################################################### 
#
#	Copyright:	(c)Copyright 2004-2011 Odin Technology Ltd. All Rights Reserved.
#	Version:	v3.3 rev 0
#	Contact:	www.odintech.com
#
########################################################################################################################## -->
<xsl:param name="showsys" />
<xsl:param name="sort" />
<xsl:template match="object_coverage">
 <div>
<div class="mainheading">Axe Object Usage Statistics</div>
<div class="subpanel">
	<table class="summary">
    <tr>		
		<td class="value"><a href="actionusage.html">Action Usage</a></td>
		<td class="value"><a href="subtestusage.html">Subtest Usage</a></td>
		<td>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
		<td>	
			<xsl:if test="$showsys = 'True'">
				<input type="button" onclick="resultdiv.innerHTML = applyXSLT('False','')" value="Suppress System Maps"/>	
			</xsl:if>
			<xsl:if test="$showsys = 'False'">		
				<input type="button" onclick="resultdiv.innerHTML = applyXSLT('True','');" value="Show All"/>	
			</xsl:if>
		</td>		
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
      <th class="vrowlabel">Total Objects</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
   <xsl:value-of select="count(object)"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
   <xsl:value-of select="count(object[@system='False'])"/>
</td>
</xsl:if>
   
      <th class="vrowlabel">Untested Objects</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
   <xsl:value-of select="count(object[@count='0'])"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
   <xsl:value-of select="count(object[@system='False' and @count='0'])"/>
</td>
</xsl:if>
   
      <th class="vrowlabel">Coverage</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
  <xsl:value-of select="format-number((count(object) - count(object[@count='0'])) div count(object), '##0.0%')"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
  <xsl:value-of select="format-number((count(object[@system='False']) - count(object[@system='False' and @count='0'])) div count(object[@system='False']), '##0.0%')"/>
</td>
</xsl:if>
    </tr>

    <tr>
      <th class="vrowlabel">Windows</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
   <xsl:value-of select="count(object[contains(@name, '.') = false])"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
   <xsl:value-of select="count(object[contains(@name, '.') = false and @system='False'])"/>
</td>
</xsl:if>
   
      <th class="vrowlabel">Objects/Window</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
  <xsl:value-of select="format-number((count(object) - count(object[contains(@name, '.') = false])) div count(object[contains(@name, '.') = false]), '#.0')"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
  <xsl:value-of select="format-number((count(object[@system='False']) - count(object[contains(@name, '.') = false and @system='False'])) div count(object[contains(@name, '.') = false and @system='False']), '#.0')"/>
</td>
</xsl:if>
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
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'object')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False', 'object')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>
	Object
	</th>

	<th class="heading">
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'count')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False','count')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	Count
	</th>

	<th class="heading">
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'mapfile')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False','mapfile')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	Map
	</th>

	<xsl:if test="$showsys = 'True'">
	<th class="heading">
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'system')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False','system')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	System
	</th>
	</xsl:if>


	<th class="heading">
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'class')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False','class')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	Class
	</th>

        </tr>

	<xsl:if test="$sort = ''">
		<xsl:apply-templates select="object">
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'object'">
		<xsl:apply-templates select="object">
			<xsl:sort select="@object" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'count'">
		<xsl:apply-templates select="object">
			<xsl:sort select="@count" data-type="number" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'mapfile'">
		<xsl:apply-templates select="object">
			<xsl:sort select="@mapfile" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'class'">
		<xsl:apply-templates select="object">
			<xsl:sort select="@class" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'system'">
		<xsl:apply-templates select="object">
			<xsl:sort select="@system" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>

  </table>
</div>

</div>
</xsl:template>

<xsl:template match="object">
	<xsl:choose>

	<xsl:when test="$showsys = 'True'">

	<tr class="resultrow">
	<td class="value"><xsl:value-of select="@name"/></td>
	<td class="value"><xsl:value-of select="@count"/></td>
	<td class="value"><xsl:value-of select="@mapfile"/></td>
	<td class="value"><xsl:value-of select="@system"/></td>
	<td class="value"><xsl:value-of select="@class"/></td>
	</tr>

	</xsl:when>

	<xsl:otherwise>
		<xsl:if test="@system = 'False'">
		<tr class="resultrow">
		<td class="value"><xsl:value-of select="@name"/></td>
		<td class="value"><xsl:value-of select="@count"/></td>
		<td class="value"><xsl:value-of select="@mapfile"/></td>
		<td class="value"><xsl:value-of select="@class"/></td>
		</tr>
		</xsl:if>
	</xsl:otherwise>

</xsl:choose>
 
</xsl:template>

</xsl:stylesheet>