<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--
############################## Axe HTML documentation transform ########################################################## 
#
#	Copyright:	(c)Copyright 2004-2009 Odin Technology Ltd. All Rights Reserved.
#	Version:	v2.0rev1
#	Contact:	www.odintech.com
#
########################################################################################################################## !-->
	<xsl:param name="type" />
	<xsl:param name="testid" />
	<xsl:param name="manualview" />
	<xsl:template match="*">
	<div>
		<xsl:if test="$type = 'Summary'">
			<div class="mainheading"><xsl:value-of select="name" /> - Documentation Index</div>
		</xsl:if>
		<p />
		<!-- ############################# Transform for Summary ############################# !-->
		<xsl:if test="$type = 'Summary'">
			<div>
				<table class="docsteps" width="100%">
					<tr>
						<th width="20%" class="docheading">Configuration</th>
						<td class="docvalue">
							<xsl:value-of select="build/config/@name" />
						</td>
					</tr>
					<tr>
					<th width="20%" class="docheading">Build Timestamp</th>
						<td class="docvalue">
							<xsl:value-of select="build/buildtimestamp" />
						</td>
					</tr>
				</table>
				<p/>
				<table class="docsteps" width="100%">
					<tr>
						<th width="1%" class="docheading">Test</th>
						<th width="99%" class="docheading">Description</th>
					</tr>
					<xsl:for-each select="build/run_master/test">
						<tr>
							<td class="docvaluelink">
								<xsl:attribute name="onmousedown">applyXSLT('Test','tests/<xsl:value-of select="id" />.xml',true,'y')</xsl:attribute>
								<xsl:value-of select="id" />
							</td>
							<td class="docvalue">
								<xsl:value-of select="description" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<p/>
			<div class="subpanel">
				<table class="summary">
					<tr>
						<th class="rowlabel">Total tests:</th>
						<td class="value">
							<xsl:value-of select="build/run_master/testcount" />
						</td>
					</tr>
				</table>
			</div>
			
		</xsl:if>
		<!-- ############################# Transform for Test ############################# !-->
		<!-- ## Test Header Information ## !-->
		<xsl:if test="$type = 'Test'">	
			<div>
				<table width="100%">
					<tr>
					<td width="95%">
						<p class="heading1">Test: <xsl:value-of select="id" /></p>
					</td>
					<td width="%5">
						<div class="button">
							<input type="button">
								<xsl:if test="$manualview = 'y'">
									<xsl:attribute name="onclick">applyXSLT('Test','tests/<xsl:value-of select="id" />.xml',false,'n')</xsl:attribute>
									<xsl:attribute name="value">Axe view</xsl:attribute>
								</xsl:if>
								<xsl:if test="$manualview != 'y'">
									<xsl:attribute name="onclick">applyXSLT('Test','tests/<xsl:value-of select="id" />.xml',false,'y')</xsl:attribute>
									<xsl:attribute name="value">Manual view</xsl:attribute>
								</xsl:if>
							</input>
						</div>
					</td>
					</tr>
				</table>
				<table width="100%">
					<tr>
						<td width="95%">
							<p class="heading2" ><xsl:value-of select="description" /></p>
						</td>
						<td width="%5">
							<span class="hyperlink">
								<a href="documentation.html">&lt;Index</a>
							</span>
						</td>
					</tr>
				</table>
				<p/>
				<table class="docsteps" width="100%">
				<tr>
						<th width="22%" class="docheading">Configuration</th>
						<td class="docvalue">
							<xsl:value-of select="configuration" />
						</td>
					</tr>
					<tr>
					<th width="22%" class="docheading">Build Timestamp</th>
						<td class="docvalue">
							<xsl:value-of select="buildtimestamp" />
						</td>
					</tr>
					<tr>
						<th width="22%" class="docheading">Depends on test(s)</th>
						<td width="78%" class="docvalue">
							<xsl:choose>
								<xsl:when test='normalize-space(dependency)=""'>
											n/a
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="dependency" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					<tr>
					<th class="docheading">Basestate description</th>
						<td class="docvalue">
							<xsl:choose>
								<xsl:when test='normalize-space(basestate/description)=""'>
									n/a
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="basestate/description" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
				<p/>
				<!-- ## Test Steps Information ## !-->
				<!-- ## Header ## !-->
				<div>
				<table class="docsteps" width="100%">
					<tr class="docheading">
						<xsl:if test="$manualview = 'y'">
							<th class="docheading" width="1%">Step</th>
							<th class="docheading" width="55%">Description</th>
							<th class="docheading" width="20%">Expected</th>
							<th class="docheading" width="20%">Actual</th>
						</xsl:if>
						<xsl:if test="$manualview != 'y'">
							<th class="docheading" width="1%">Step</th>
							<th class="docheading" width="15%">Object</th>
							<th class="docheading" width="15%">Action</th>
							<th class="docheading" width="25%">Data</th>
							<th class="docheading" width="40%">Description</th>
						</xsl:if>
					</tr>
				<!-- ## Subtest by Subtest ## !-->
					<xsl:for-each select="subtest">
						<tr>
							<td class="docvaluefirstsub">
								<xsl:number count="subtest" level="single"/>
							</td>
							<xsl:if test="$manualview = 'y'">
								<td class="docsub">
									<xsl:value-of select="description"/>
								</td>
								<td class="docsub">
										&#160;
								</td>
								<td class="docsub">
								&#160;
								</td>
							</xsl:if>
							
							<xsl:if test="$manualview != 'y'">
								<td class="docsub" colspan="4">
									<xsl:value-of select="description" /> (Sub-test: <xsl:value-of select="table/@name" />, id: <xsl:value-of select="id" />)
								</td>
							</xsl:if>							
							
							
						</tr>
				<!-- ## Step by Step ## !-->
								<xsl:for-each select="step">
								<tr >
									<!-- Manual View !-->
									<xsl:if test="$manualview = 'y'">
										<td class="docvaluefirst">
											<xsl:number count="subtest" level="single"/>.<xsl:number count="step" level="single"/>
										</td>
										<td class="docvalue">
											<xsl:choose>
												<xsl:when test='normalize-space(description)=""'>
												&#160;
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="description" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="docvalue">
											<xsl:choose>
												<xsl:when test="@type='Val'">
													<xsl:choose>
														<xsl:when test='normalize-space(data)=""'>
															<i>Value is expected to be blank</i>		
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="data" />
														</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
													&#160;		
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="docvalue">
										&#160;
										</td>
									</xsl:if>
									<!-- Axe View !-->
									<xsl:if test="$manualview != 'y'">
										<td class="docvaluefirst">
											<xsl:number count="subtest" level="single"/>.<xsl:number count="step" level="single"/>
										</td>
										<td class="docvalue">
											<xsl:value-of select="object" />
										</td>
										<td class="docvalue">
											<xsl:value-of select="action" />
										</td>
										<td class="docvalue">
												<xsl:choose>
												<xsl:when test='normalize-space(data)=""'>
												&#160;
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="data" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="docvalue">
											<xsl:choose>
												<xsl:when test='normalize-space(description)=""'>
												&#160;
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="description" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</xsl:if>
								</tr>
							</xsl:for-each>
				</xsl:for-each>
				</table>
				</div>
				<table width="100%">
					<tr>
						<td width="95%">
							&#160;
						</td>
						<td width="%5">
							<span class="hyperlink">
								<a href="documentation.html">&lt;Index</a>
							</span>
						</td>
					</tr>
				</table>
			</div>
		</xsl:if>
		<p class="copyright">Axe Test Automation Platform - <a href="http://www.odintech.com">Odin Technology</a> - <a href="http://www.odintech.com">www.odintech.com</a></p>
	</div>
	</xsl:template>
</xsl:stylesheet>