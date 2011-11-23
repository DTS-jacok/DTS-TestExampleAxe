<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--
############################## Axe Results Summary ############################################################### 
#
#	Copyright:	(c)Copyright 2007-2009 Odin Technology Ltd. All Rights Reserved.
#	Version:	v2.0 rev 1
#	Contact:	www.odintech.com
#
########################################################################################################################## -->
	<xsl:template match="resultssummary">
	<div>
		<div class="mainheading">Axe Results Summary</div>
		<p />
		<div class="subpanel">
			<table class="summary">
				<tr>
					<th class="vrowlabel">Folder</th>
					<td class="value">
						<xsl:value-of select="resultsfolder" />
					</td>
				</tr>
				<tr>
					<th class="vrowlabel">Last Updated</th>
					<td class="value">
						<xsl:value-of select="timestamp" />
					</td>
				</tr>
			</table>
		</div>
		<p />
		<div class="subpanel">
			<table class="summary">
				<tr class="heading">
					<th class="heading">Project</th>
					<th class="heading">TestSuite</th>
					<th class="heading">Status</th>
					<th class="heading">Tests</th>
					<th class="heading">Passed</th>
					<th class="heading">Failed</th>
					<th class="heading">Not Run</th>
					<th class="heading">Object Usage</th>
					<th class="heading">Documentation</th>
				</tr>
				<xsl:apply-templates select="runresult"></xsl:apply-templates>
				<tr class="resultrow">
					<td />
					<td />
					<td />
					<td class="value" style="text-align=right;font-weight: bold">
						<xsl:value-of select="sum(runresult/testcount)" />
					</td>
					<td class="value" style="text-align=right;font-weight: bold">
						<xsl:value-of select="sum(runresult/passcount)" />
					</td>
					<td class="value" style="text-align=right;font-weight: bold">
						<xsl:value-of select="sum(runresult/failcount)" />
					</td>
					<td class="value" style="text-align=right;font-weight: bold">
						<xsl:value-of select="sum(runresult/notruncount)" />
					</td>
					<td />
				</tr>
				<tr class="resultrow">
					<th />
					<th />
					<th />
					<th class="heading" style="text-align=right">
						Tests
					</th>
					<th class="heading" style="text-align=right">
						Passed
					</th>
					<th class="heading" style="text-align=right">
						Failed
					</th>
					<th class="heading" style="text-align=right">
						NotRun
					</th>
					<th />
				</tr>
				
			</table>
		</div>
	</div>
	</xsl:template>
	<xsl:template match="runresult">
		<tr class="resultrow">
		<td class="value">
				<xsl:value-of select="projectname" />
		</td>
			<td>
				<xsl:attribute name="onclick">
					javascript:location.href='<xsl:value-of select="index" />';
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="testcount=passcount and failcount=0 and notruncount=0 and testcount>0">
						<xsl:attribute name="class">valuepassclick</xsl:attribute>
					</xsl:when>
					<xsl:when test="notruncount>0">
						<xsl:attribute name="class">valuenotrun</xsl:attribute>
						<xsl:attribute name="style">cursor:pointer;</xsl:attribute>
					</xsl:when>
					<xsl:when test="failcount>0 and notruncount=0">
						<xsl:attribute name="class">valuefailclick</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="class">value</xsl:attribute>
						<xsl:attribute name="style">cursor:pointer;</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="buildname" />
			</td>
			<td>
					<xsl:choose>
						<xsl:when test="testcount=passcount and failcount=0 and notruncount=0 and testcount>0">
						<xsl:attribute name="class">valuepass</xsl:attribute>
						Pass
					</xsl:when>
						<xsl:when test="notruncount>0">
						<xsl:attribute name="class">valuenotrun</xsl:attribute>
						Not Run
					</xsl:when>
						<xsl:when test="failcount>0 and notruncount=0">
						<xsl:attribute name="class">valuefail</xsl:attribute>
						Fail
					</xsl:when>
						<xsl:otherwise>
						<xsl:attribute name="class">value</xsl:attribute>
						Unknown
					</xsl:otherwise>
					</xsl:choose>
				</td>
			<td class="value" style="text-align=right">
				<xsl:value-of select="testcount" />
			</td>
			<td class="value" style="text-align=right">
				<xsl:value-of select="passcount" />
			</td>
			<td class="value" style="text-align=right">
				<xsl:value-of select="failcount" />
			</td>
			<td class="value" style="text-align=right">
				<xsl:value-of select="notruncount" />
			</td>
			<td class="value">
				<xsl:if test="objectusage!=''">
					<a>
					<xsl:attribute name="href">
							<xsl:value-of select="objectusage" />
						</xsl:attribute>
					View
				</a>
				</xsl:if>
			</td>
			<td class="value">
				<xsl:if test="documentation!=''">
					<a>
					<xsl:attribute name="href">
							<xsl:value-of select="documentation" />
						</xsl:attribute>
					View
				</a>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>