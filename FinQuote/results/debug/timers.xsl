<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- ############################# AXE TRANSACTIONS TRANSFORM ################################################################# 
#
#	Copyright:	(c)Copyright 2010-2011 Odin Technology Ltd. All Rights Reserved.
#	Version:	v1.0
#	Contact:	www.odintech.com
#
########################################################################################################################## !-->
<xsl:output method="html" />
	<xsl:template match="testsuite">
		<p>					
		<div class="subpanel">		
		<div class="panelheading">Transaction Timers</div>
		<table class="summary">					
			<tr>
				<th class="heading">Run</th>
				<th class="heading">Test</th>
				<th class="heading">Result</th>
				<th class="heading">Transaction</th>
				<th class="heading">Time</th>
			</tr>										
			<xsl:for-each select="//subtest/step/timer">
				<tr>				
					<td class="value"><xsl:value-of select="../../../../name"/></td>					
					<td class="value"><xsl:value-of select="../../../id"/></td>
					<td class="value"><xsl:value-of select="../../../result"/></td>						
					<td class="value"><xsl:value-of select="@name"/></td>
					<td class="value"><xsl:value-of select="@time"/></td>
				</tr>						
			</xsl:for-each> 	
		</table>
		</div>				
		</p>
	</xsl:template>
</xsl:stylesheet>