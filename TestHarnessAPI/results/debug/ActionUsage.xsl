<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--
############################## Axe Action Usage transform ############################################################### 
#
#	Copyright:	(c)Copyright 2011 Odin Technology Ltd. All Rights Reserved.
#	Version:	v1.0 rev 0
#	Contact:	www.odintech.com
#
########################################################################################################################## -->
<xsl:param name="showsys" />
<xsl:param name="sort" />
<xsl:template match="action_coverage">
<div>
<div class="mainheading">Axe Action Usage Statistics</div>
<div class="subpanel">
	<table class="summary">
    <tr>		
		<td class="value"><a href="objectusage.html">Object Usage</a></td>
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
      <th class="vrowlabel">Total Actions</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
   <xsl:value-of select="count(action)"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
   <xsl:value-of select="count(action[@system='False'])"/>
</td>
</xsl:if>
   
      <th class="vrowlabel">Unused Actions</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
   <xsl:value-of select="count(action[@count='0'])"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
   <xsl:value-of select="count(action[@system='False' and @count='0'])"/>
</td>
</xsl:if>
   
      <th class="vrowlabel">Usage</th>
<xsl:if test="$showsys = 'True'">
<td class="value">
  <xsl:value-of select="format-number((count(action) - count(action[@count='0'])) div count(action), '##0.0%')"/>
</td>
</xsl:if>
<xsl:if test="$showsys = 'False'">
<td class="value">
  <xsl:value-of select="format-number((count(action[@system='False']) - count(action[@system='False' and @count='0'])) div count(action[@system='False']), '##0.0%')"/>
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
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'action')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False', 'action')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>
	Action
	</th>

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
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'documentation')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False','documentation')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	Documentation
	</th>

	<th class="heading">
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'overriden')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False','overriden')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	Overriden
	</th>

	<th class="heading">
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('True', 'documentation_overriden')</xsl:attribute>	
	</xsl:when>
	<xsl:otherwise>
		<xsl:attribute name="onmousedown">resultdiv.innerHTML = applyXSLT('False','documentation_overriden')</xsl:attribute>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:attribute name="style">cursor: pointer</xsl:attribute>							
	Docs Overriden
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

     </tr>

	<xsl:if test="$sort = ''">
		<xsl:apply-templates select="action">
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'action'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@action" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'count'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@count" data-type="number" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'documentation'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@documentation" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'documentation_overriden'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@documentation_overriden" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'mapfile'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@mapfile" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'overriden'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@overriden" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'class'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@class" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>
	<xsl:if test="$sort = 'system'">
		<xsl:apply-templates select="action">
			<xsl:sort select="@system" data-type="text" order="ascending"/>
		</xsl:apply-templates>
	</xsl:if>

  </table>
</div>

</div>
</xsl:template>

<xsl:template match="action">
	<xsl:choose>
	<xsl:when test="$showsys = 'True'">
		<tr class="resultrow">
		<td class="value"><xsl:value-of select="@action"/></td>
		<td class="value"><xsl:value-of select="@class"/></td>
		<td class="value"><xsl:value-of select="@count"/></td>
		<td class="value"><xsl:value-of select="@documentation"/></td>
		<td class="value"><xsl:value-of select="@overriden"/></td>
		<td class="value"><xsl:value-of select="@documentation_overriden"/></td>
		<td class="value"><xsl:value-of select="@mapfile"/></td>
		<td class="value"><xsl:value-of select="@system"/></td>		
		</tr>
	</xsl:when>
	<xsl:otherwise>
		<xsl:if test="@system = 'False'">
		<tr class="resultrow">
		<td class="value"><xsl:value-of select="@action"/></td>
		<td class="value"><xsl:value-of select="@class"/></td>
		<td class="value"><xsl:value-of select="@count"/></td>
		<td class="value"><xsl:value-of select="@documentation"/></td>
		<td class="value"><xsl:value-of select="@overriden"/></td>
		<td class="value"><xsl:value-of select="@documentation_overriden"/></td>
		<td class="value"><xsl:value-of select="@mapfile"/></td>	
		</tr>
		</xsl:if>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>