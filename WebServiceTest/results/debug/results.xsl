<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- ############################# AXE RESULTS TRANSFORM ################################################################# 
#
#	Copyright:	(c)Copyright 2004-2009 Odin Technology Ltd. All Rights Reserved.
#	Version:	v2.0rev1
#	Contact:	www.odintech.com
#
########################################################################################################################## !-->
	<!-- ############################# External Parameters Passed to Transform ######################### !-->
	<xsl:output method="html" />
	<xsl:param name="type" />
	<xsl:param name="runid" />
	<xsl:param name="testindex" />
	<xsl:param name="subtestid" />
	<xsl:param name="rmcall" />
	<xsl:param name="failonly" />
	<!-- ############################# Generic Page Header ############################# !-->
	<xsl:template match="testsuite">
		<div class="mainheading">
		Test Results - <xsl:value-of select="name" /></div>
		<p />
		<!-- ############################# RUN Display Page ############################## 
	 #	Page shows Run Summary information, and expandable panels for each run 
	 #  for testsuite
	 ############################################################################## !-->
		<div class="panelheading">			
			Test Suite - <xsl:value-of select="build/name" /><xsl:if test="$failonly='y' and $type = 'Run'">&#160;(Showing Fails only)</xsl:if>
		</div>
		<div class="subpanel">
			<table class="summary">
				<tr>
					<th class="vrowlabel">		
							Configuration
						</th>
					<td class="value">
						<xsl:value-of select="build/config/@name" />
					</td>
					<td>&#160;&#160;&#160;</td>
					<th class="vrowlabel">		
							Links
						</th>
					<td class="value">
						<xsl:if test="$type = 'Test'">
							<a>
							<xsl:attribute name="href">documentation.html?testid=<xsl:value-of select="build/run[name=$runid]/test[index=$testindex]/id"/></xsl:attribute>
							View Documentation
							</a>	
						</xsl:if>
						<xsl:if test="$type = 'Run'">
							<a href="documentation.html">Test Documentation</a>
						</xsl:if>
					</td>
					<td class="value"><a href="objectusage.html">Object Usage</a></td>
					<td class="value"><a href="actionusage.html">Action Usage</a></td>
					<td class="value"><a href="subtestusage.html">Subtest Usage</a></td>
					<xsl:if test="$type = 'Run'">
						<td class="value">
							<a href="timers.html">Transaction Timers</a>
						</td>
					</xsl:if>
					<xsl:if test="$type = 'Test'">
						<td class="value">
							<a href="index.html">Run Summary</a>
						</td>
					</xsl:if>
					<xsl:if test="$type = 'Run'">
						<td>
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
						</td>
						<td>
						<input type="button">
							<xsl:if test="$failonly = 'y'">
								<xsl:attribute name="onclick">applyXSLT("Run","<xsl:value-of select='$runid' />","","","","","","")</xsl:attribute>
								<xsl:attribute name="value">Show all tests</xsl:attribute>
							</xsl:if>
							<xsl:if test="$failonly != 'y'">
								<xsl:attribute name="onclick">applyXSLT("Run","<xsl:value-of select='$runid' />","","","","y","")</xsl:attribute>
								<xsl:attribute name="value">Show only fails</xsl:attribute>
							</xsl:if>
						</input>
						</td>
					</xsl:if>
				</tr>
			</table>
		</div>
		<p/>
		<!-- ## RUN Master - Summary of all runs ############################# !-->
		<xsl:if test="$type = 'Run'">
			
			<xsl:for-each select="build/run_master">
				<xsl:variable name="expname" select="'||run_master||'" />
				<div class="expandableheading">
					<table class="resultsheading">
						<tr>
							<xsl:choose>
								<xsl:when test="contains($runid,$expname)">
									<xsl:attribute name="onmousedown"> applyXSLT('Run','<xsl:value-of select="concat(substring-before($runid,$expname),substring-after($runid,$expname))" />','','','','<xsl:value-of select='$failonly' />','')</xsl:attribute>
									<td class="expbutton">-</td>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="onmousedown"> applyXSLT('Run','<xsl:value-of select="concat($runid,$expname)" />','','','','<xsl:value-of select='$failonly' />','')</xsl:attribute>
									<td class="expbutton">+</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="expandabletitle">
							Run Summary
							</td>
						</tr>
					</table>
				</div>
				<xsl:if test="contains($runid,$expname)">
					<div class="subpanel">
						<table class="summary">
							<tr>
								<th class="rowlabel">
							Tests
						</th>
								<td class="value">
									<xsl:value-of select="testcount" />
								</td>
								<th class="rowlabel">
							Passed
						</th>
								<td class="value">
									<xsl:value-of select="passcount" />
								</td>
								<th class="rowlabel">
							Failed
						</th>
								<td class="value">
									<xsl:value-of select="failcount" />
								</td>
								<th class="rowlabel">
							Not Run
						</th>
								<td class="value">
									<xsl:value-of select="notruncount" />
								</td>
							</tr>
						</table>
						<!-- # RUN MASTER Table of Tests ############################# !-->
						<p />
						<table class="results">
							<tr class="heading">
								<th>Test</th>
								<th>Result</th>
								<th>Run</th>
								<th>Finish</th>
								<th>Time</th>
								<th>Description</th>
								<th>Screenshot</th>
							</tr>
							<!-- # Row in Table For Each Test in Run Master############################# !-->
							<xsl:for-each select="test">
								<xsl:variable name="runname" select="run" />
								<xsl:variable name="exprunname" select="concat('|',$runname,'|')" />
								<xsl:if test="($failonly='y' and result!='Pass') or $failonly=''">
									<tr class="resultrow">
										<td>
											<xsl:if test="result='Pass' or result='Fail' or result='Aborted' or result='Dependency' or result='Basestate'">
												<xsl:attribute name="onclick">gotoTest('<xsl:value-of select="$runname" />','<xsl:value-of select="test_index" />')</xsl:attribute>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="result='Pass'">
													<xsl:attribute name="class">valuepassclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Fail'">
													<xsl:attribute name="class">valuefailclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Aborted'">
													<xsl:attribute name="class">valuefailclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Basestate'">
													<xsl:attribute name="class">valuefailclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Dependency'">
													<xsl:attribute name="class">valuefailprereqclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='NotRun'">
													<xsl:attribute name="class">valuenotrun</xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="class">value</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="id" />
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(result)=""'>&#160;</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="result" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="valuelink">
											<xsl:if test="result='Pass' or result='Fail' or result='Aborted' or result='FailPreReq'">
												<xsl:attribute name="onmousedown">applyXSLT('Run','<xsl:value-of select="$exprunname" />','','','<xsl:value-of select='$rmcall' />','<xsl:value-of select='$failonly' />')</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="run" />
										</td>
										<td class="value">
											<xsl:value-of select="finish" />
										</td>
										<td class="value">
											<xsl:value-of select="time" />
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(description)=""'>&#160;</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="description" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(image)=""'>
	            &#160;
	          </xsl:when>
												<xsl:otherwise>
													<a target="new">
											<xsl:attribute name="href">
															<xsl:value-of select="image" />
														</xsl:attribute>
											View
											</a>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if> <!-- Check for fail for display !-->
							</xsl:for-each> <!-- For each Test in run_master !-->
						</table> <!-- Table of tests !-->
					</div> <!-- Summary Panel !-->
				</xsl:if> <!-- Check for Run_Master in runid !-->
			</xsl:for-each> <!-- For each Run_master -->
			<!-- # RUN - For Each overall run in the results ############################# !-->
			<p />
			<xsl:for-each select="build/run">
				<xsl:variable name="name" select="name" />
				<xsl:variable name="expname" select="concat('|',name,'|')" />
				<div class="expandableheading">
					<table class="resultsheading">
						<tr>
							<xsl:choose>
								<xsl:when test="contains($runid,$expname)">
									<xsl:attribute name="onmousedown"> applyXSLT('Run','<xsl:value-of select="concat(substring-before($runid,$expname),substring-after($runid,$expname))" />','<xsl:value-of select="index" />','','','<xsl:value-of select="$failonly" />')</xsl:attribute>
									<td class="expbutton">-</td>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="onmousedown"> applyXSLT('Run','<xsl:value-of select="concat($runid,$expname)" />','<xsl:value-of select="index" />','','','<xsl:value-of select="$failonly" />')</xsl:attribute>
									<td class="expbutton">+</td>
								</xsl:otherwise>
							</xsl:choose>
							<td class="value">
								<xsl:choose>
									<xsl:when test="translate(success, 'true', 'TRUE')='TRUE'">
										<xsl:attribute name="class">valuepassclick</xsl:attribute>
										Pass
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">valuefailclick</xsl:attribute>
										&#160;Fail
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="expandabletitle">
							Run: <xsl:value-of select="$name" />
							</td>
						</tr>
					</table>
				</div>
				<!-- # Check that RUN is to be Expanded ############################# !-->
				<xsl:if test="contains($runid,$expname)">
					<div class="subpanel">
						<table class="results">
							<tr>
								<th class="rowlabel">
							Start
						</th>
								<td class="value">
									<xsl:value-of select="start" />
								</td>
								<th class="rowlabel">
							Finish
						</th>
								<td class="value">
									<xsl:value-of select="finish" />
								</td>
							</tr>
						</table>
						<p />
						<table class="summary">
							<tr>
								<th class="rowlabel">
							Tests
						</th>
								<td class="value">
									<xsl:value-of select="testcount" />
								</td>
								<th class="rowlabel">
							Passed
						</th>
								<td class="value">
									<xsl:value-of select="passcount" />
								</td>
								<th class="rowlabel">
							Failed
						</th>
								<td class="value">
									<xsl:value-of select="failcount" />
								</td>
							</tr>
						</table>
						<!-- # Table of Tests in Run ############################# !-->
						<p />
						<table class="results">
							<tr class="heading">
								<th>Test</th>
								<th>Result</th>
								<th>Finish</th>
								<th>Time</th>
								<th>Description</th>
								<th>Screenshot</th>
							</tr>
							<!-- # Row for Each Test ############################# !-->
							<xsl:for-each select="test">
								<xsl:if test="($failonly='y' and result!='Pass') or $failonly=''">
									<tr class="resultrow">
										<td>
											<xsl:if test="result='Pass' or result='Fail' or result='Aborted' or result='Dependency' or result='Basestate'">
												<xsl:attribute name="onclick">gotoTest('<xsl:value-of select="$name" />','<xsl:value-of select="index" />')</xsl:attribute>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="result='Pass'">
													<xsl:attribute name="class">valuepassclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Fail'">
													<xsl:attribute name="class">valuefailclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Aborted'">
													<xsl:attribute name="class">valuefailclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Basestate'">
													<xsl:attribute name="class">valuefailclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='Dependency'">
													<xsl:attribute name="class">valuefailprereqclick</xsl:attribute>
												</xsl:when>
												<xsl:when test="result='NotRun'">
													<xsl:attribute name="class">valuenotrun</xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="class">value</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="id" />
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(result)=""'>&#160;</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="result" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<xsl:value-of select="finish" />
										</td>
										<td class="value">
											<xsl:value-of select="time" />
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(description)=""'>&#160;</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="description" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(image)=""'>
	            &#160;
	          </xsl:when>
												<xsl:otherwise>
													<a target="new">
											<xsl:attribute name="href">
															<xsl:value-of select="image" />
														</xsl:attribute>
											View
											</a>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if> <!-- Check for Fail only display !-->
							</xsl:for-each> <!-- For each Test !-->
						</table> <!-- Table of Tests !-->
					</div> <!-- Panel for Run !-->
					<p />
				</xsl:if> <!-- Check that run should be shown !-->
			</xsl:for-each> <!-- For each Run  !-->
		</xsl:if> <!--  Check for Summary Display page (Run) !-->
		<!-- ############################# TEST Display Page ############################## 
	 # Page shows Test Information, and expandable panels for each subtest.	
	 #
	 ############################################################################## !-->
		<xsl:if test="$type = 'Test'">
			<!-- find the test to display !-->
			<xsl:for-each select="build/run[name=$runid]/test[index=$testindex]">
				<xsl:variable name="testimage" select="image" />
				<xsl:variable name="imagesubtestindex" select="image/@subtest_index" />
				<xsl:variable name="imagestepindex" select="image/@step_index" />
				<div class="panelheading">
					Run: <xsl:value-of select="$runid" /> - Test: <xsl:value-of select="id" />
				</div>
				<div class="subpanel">
					<table class="summary">
						<tr>
							<th class="vrowlabel">
							Result
						</th>
							<td class="value" colspan="5">
								<xsl:choose>
									<xsl:when test="result='Pass'">
										<xsl:attribute name="class">valuepassclick</xsl:attribute>
									</xsl:when>
									<xsl:when test="result='Fail'">
										<xsl:attribute name="class">valuefailclick</xsl:attribute>
									</xsl:when>
									<xsl:when test="result='Aborted'">
										<xsl:attribute name="class">valuefailclick</xsl:attribute>
									</xsl:when>
									<xsl:when test="result='Basestate'">
										<xsl:attribute name="class">valuefailclick</xsl:attribute>
									</xsl:when>
									<xsl:when test="result='Dependency'">
										<xsl:attribute name="class">valuefailprereqclick</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">value</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test='normalize-space(result)=""'>&#160;</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="result" />
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<th class="vrowlabel">
							Start
						</th>
							<td class="value">
								<xsl:value-of select="start" />
							</td>
							<th class="vrowlabel">
							Finish
						</th>
							<td class="value">
								<xsl:value-of select="finish" />
							</td>
							<th class="vrowlabel">
							Time
						</th>
							<td class="value">
								<xsl:value-of select="time" />
							</td>
						</tr>
						<tr>
							<th class="vrowlabel">
							Description
						</th>
							<td class="value" colspan="5">
								<xsl:choose>
									<xsl:when test='normalize-space(description)=""'>&#160;</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="description" />
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<th class="vrowlabel">
							Table
						</th>
							<td class="value" colspan="5">
								<xsl:value-of select="table/@name" />
							</td>
						</tr>
						<tr>
							<th class="vrowlabel">
							File
						</th>
							<td class="value" colspan="5">
								<xsl:value-of select="table/@file" />
							</td>
						</tr>
						<tr>
							<th class="vrowlabel">
							Screenshot
						</th>
							<td class="value" colspan="5">
								<xsl:choose>
									<xsl:when test='normalize-space(image)=""'>n/a</xsl:when>
									<xsl:otherwise>
										<a target="new">
											<xsl:attribute name="href">
												<xsl:value-of select="image" />
											</xsl:attribute>
											View
											</a>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<!-- # Dependency Section !-->
					<xsl:if test='normalize-space(dependency/index)!=""'>
						<p />
						<table class="summary">
							<tr>
								<th class="spanninglabel" colspan="4">
							Dependencies
							</th>
							</tr>
							<xsl:for-each select="dependency">
								<tr>
									<th class="rowlabel">
							Test
						</th>
									<td class="value">
										<xsl:value-of select="id" />
									</td>
									<th class="rowlabel">
							Result
						</th>
									<td class="value">
										<xsl:choose>
											<xsl:when test="result='Pass'">
												<xsl:attribute name="class">valuepassclick</xsl:attribute>
											</xsl:when>
											<xsl:when test="result='Fail'">
												<xsl:attribute name="class">valuefailclick</xsl:attribute>
											</xsl:when>
											<xsl:when test="result='Aborted'">
												<xsl:attribute name="class">valuefailclick</xsl:attribute>
											</xsl:when>
											<xsl:when test="result='Basestate'">
												<xsl:attribute name="class">valuefailclick</xsl:attribute>
											</xsl:when>
											<xsl:when test="result='Dependency'">
												<xsl:attribute name="class">valuefailprereqclick</xsl:attribute>
											</xsl:when>
											<xsl:when test="result='NotRun'">
												<xsl:attribute name="class">valuenotrun</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="class">value</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:value-of select="result" />
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<!-- # End of Dependency Section # !-->
					<p />
					<table class="summary">
						<tr>
							<th class="rowlabel">
							Sub-tests
						</th>
							<td class="value">
								<xsl:value-of select="testcount" />
							</td>
							<th class="rowlabel">
							Passed
						</th>
							<td class="value">
								<xsl:value-of select="passcount" />
							</td>
							<th class="rowlabel">
							Failed
						</th>
							<td class="value">
								<xsl:value-of select="failcount" />
							</td>
						</tr>
					</table>
					<p />
				</div>
				<p />
													
				<!-- # BASESTATE ############################# !-->
				<xsl:for-each select="basestate">
					<xsl:variable name="bsindex" select="concat('|basestate',index,'|')" />
					<div class="expandableheading">
						<table class="resultsheading">
							<tr class="resultrow">
								<xsl:choose>
									<xsl:when test="contains($subtestid,$bsindex)">
										<td class="expbutton">
									<xsl:attribute name="onmousedown"> applyXSLT('Test','<xsl:value-of select="$runid" />','<xsl:value-of select="$testindex" />','<xsl:value-of select="concat(substring-before($subtestid,$bsindex),substring-after($subtestid,$bsindex))" />','<xsl:value-of select='$rmcall' />','<xsl:value-of select='$failonly' />')</xsl:attribute>
									-</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="expbutton">
									<xsl:attribute name="onmousedown"> applyXSLT('Test','<xsl:value-of select="$runid" />','<xsl:value-of select="$testindex" />','<xsl:value-of select="concat($subtestid,$bsindex)" />','<xsl:value-of select='$rmcall' />','<xsl:value-of select='$failonly' />')</xsl:attribute>
									+</td>
									</xsl:otherwise>
								</xsl:choose>
								<td>
									<xsl:choose>
										<xsl:when test="success='True'">
											<xsl:attribute name="class">valuepass</xsl:attribute>
											Pass
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="class">valuefail</xsl:attribute>
											Fail&#160;
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="expandabletitle">
								&#160;Basestate - <xsl:value-of select="action" />
							</td>
							</tr>
						</table>
					</div>
					<xsl:if test="contains($subtestid,$bsindex) or $subtestid='*'">
						<div class="subpanel">
							<table class="summary">
								<tr class="heading">
									<th>&#160;&#160;&#160;&#160;</th>
									<th>Action</th>
									<th>Start</th>
									<th>Finish</th>
									<th>Time</th>
									<th>Result</th>
									<th>Error No.</th>
									<th>Error Msg.</th>
								</tr>
								<tr>
									<td class="value">
										<xsl:value-of select="index" />
									</td>
									<td class="value">
										<xsl:value-of select="action" />
									</td>
									<td class="value">
										<xsl:value-of select="start" />
									</td>
									<td class="value">
										<xsl:value-of select="finish" />
									</td>
									<td class="value">
										<xsl:value-of select="time" />
									</td>
									<td class="value">
										<xsl:value-of select="result" />
									</td>
									<td class="value">
										<xsl:value-of select="error_no" />
									</td>
									<td class="value">
										<xsl:value-of select="error_msg" />
									</td>
								</tr>
								<xsl:for-each select="info">
									<tr>
										<th class="rowlabel">&gt;</th>
										<td class="message" colspan="11">
											<xsl:value-of select="." />
										</td>
									</tr>
								</xsl:for-each>
							</table>
						</div>
						<p />
					</xsl:if> <!-- End Expand Basestate Check !-->
				</xsl:for-each> <!-- End for each Basestate !-->
				<!-- # SUBTEST ############################# !-->
				<xsl:for-each select="subtest">
					<xsl:variable name="expindex" select="concat('|',index,'|')" />
					<xsl:variable name="subtestindex" select="index" />
					<div class="expandableheading">
						<table class="resultsheading">
							<tr class="resultrow">
								<xsl:choose>
									<xsl:when test="contains($subtestid,$expindex)">
										<td class="expbutton">
									<xsl:attribute name="onmousedown"> applyXSLT('Test','<xsl:value-of select="$runid" />','<xsl:value-of select="$testindex" />','<xsl:value-of select="concat(substring-before($subtestid,$expindex),substring-after($subtestid,$expindex))" />','<xsl:value-of select='$rmcall' />','<xsl:value-of select='$failonly' />')</xsl:attribute>
									-</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="expbutton">
									<xsl:attribute name="onmousedown"> applyXSLT('Test','<xsl:value-of select="$runid" />','<xsl:value-of select="$testindex" />','<xsl:value-of select="concat($subtestid,$expindex)" />','<xsl:value-of select='$rmcall' />','<xsl:value-of select='$failonly' />')</xsl:attribute>
									+</td>
									</xsl:otherwise>
								</xsl:choose>
								<td>
									<xsl:choose>
										<xsl:when test="success='True'">
											<xsl:attribute name="class">valuepass</xsl:attribute>
											Pass
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="class">valuefail</xsl:attribute>
											Fail&#160;
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="expandabletitle">
								&#160;<xsl:value-of select="index" /> - Sub-test: <xsl:value-of select="table/@name" />&#160;-&#160;<xsl:value-of select="id" />
							</td>
							</tr>
						</table>
					</div>
					<xsl:if test="contains($subtestid,$expindex) or $subtestid='*'">
						<div class="subpanel">
							<table class="results">
								<tr>
									<th class="vrowlabel">
							Start
						</th>
									<td class="value">
										<xsl:value-of select="start" />
									</td>
									<th class="vrowlabel">
							Finish
						</th>
									<td class="value">
										<xsl:value-of select="finish" />
									</td>
									<th class="vrowlabel">
							Time
						</th>
									<td class="value">
										<xsl:value-of select="time" />
									</td>
								</tr>
								<tr>
									<th class="vrowlabel">
							Description
						</th>
									<td class="value" colspan="7">
										<xsl:value-of select="description" />
									</td>
								</tr>
								<tr>
									<th class="vrowlabel">
							Table
						</th>
									<td class="value" colspan="7">
										<xsl:value-of select="table/@name" />
									</td>
								</tr>
								<tr>
									<th class="vrowlabel">
							File
						</th>
									<td class="value" colspan="7">
										<xsl:value-of select="table/@file" />
									</td>
								</tr>
							</table>
							<p />
							<table class="summary">
								<tr>
									<th class="rowlabel">
							Steps
					</th>
									<td class="value">
										<xsl:value-of select="testcount" />
									</td>
									<th class="rowlabel">
							Passed
						</th>
									<td class="value">
										<xsl:value-of select="passcount" />
									</td>
									<th class="rowlabel">
							Failed
						</th>
									<td class="value">
										<xsl:value-of select="failcount" />
									</td>
								</tr>
							</table>
							<p />
							<table class="summary">
								<tr class="heading">
									<th>Step</th>
									<th>Object</th>
									<th>Action</th>
									<th>Data</th>
									<th>Start</th>
									<th>Finish</th>
									<th>Time</th>
									<th>Result</th>
									<th>Expected</th>
									<th>Actual</th>
									<th>Error No.</th>
									<th>Error Msg.</th>
									<th>Image</th>
								</tr>
								<!-- # STEP ############################# !-->
								<xsl:for-each select="step">
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="success='True'">
													<xsl:attribute name="class">valuepass</xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="class">valuefail</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="index" />
										</td>
										<td class="value">
											<xsl:value-of select="object" />
										</td>
										<td class="value">
											<xsl:value-of select="action" />
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(data)=""'>
  	            &#160;
	          </xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="data" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<xsl:value-of select="start" />
										</td>
										<td class="value">
											<xsl:value-of select="finish" />
										</td>
										<td class="value">
											<xsl:value-of select="time" />
										</td>
										<td class="value">
											<xsl:value-of select="result" />
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(expected)=""'>
	            &#160;
	          </xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="expected" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(actual)=""'>
	            &#160;
	          </xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="actual" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(error_no)=""'>
	            &#160;
	          </xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="error_no" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<xsl:choose>
												<xsl:when test='normalize-space(error_msg)=""'>
	            &#160;
	          </xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="error_msg" />
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="value">
											<!--# Check if Failed step and display Screenshot link #!-->
											<xsl:choose>
											<xsl:when test='index=$imagestepindex and $subtestindex=$imagesubtestindex'>
												<a target="new">
												<xsl:attribute name="href">
												<xsl:value-of select="$testimage" />
													</xsl:attribute>
												View
												</a>
											</xsl:when>
											<xsl:otherwise>
											<!--# Check for and display Screenshot link #!-->
											
												<xsl:choose>
													<xsl:when test='normalize-space(image)=""'>
	            &#160;
	          </xsl:when>
													<xsl:otherwise>
														<a target="new">
											<xsl:attribute name="href">
																<xsl:value-of select="image" />
															</xsl:attribute>
											Show Image
											</a>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<!-- # Display Repeating Info Rows for this Step # !-->
									<xsl:for-each select="info">
										<tr>
											<th class="rowlabel">&gt;</th>
											<td class="message" colspan="12">
												<xsl:value-of select="." />
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="timer">
										<tr>
											<th class="rowlabel">&gt;</th>
											<td class="message" colspan="12">
												Transaction Timer: name=<xsl:value-of select="@name" /> time=<xsl:value-of select="@time" />
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each> <!-- For each Step !-->
							</table> <!-- Table of Steps !-->
						</div> <!-- Expandable SubTest Panel !-->
						<p />
					</xsl:if> <!-- Expand SubTest Check End !-->
				</xsl:for-each> <!-- For Each SubTest !-->
				
				<!-- Transaction Timers -->
				<xsl:if test="count(subtest/step/timer) &gt; 0">
					<p>					
					<div class="subpanel">		
					<div class="panelheading">Transaction Timers</div>
					<table class="summary">					
						<tr>
							<th class="heading">Name</th>
							<th class="heading">Time</th>
						</tr>										
						<xsl:for-each select="subtest/step/timer">
							<tr>									
								<td class="value"><xsl:value-of select="@name"/></td>
								<td class="value"><xsl:value-of select="@time"/></td>
							</tr>						
						</xsl:for-each> 	
					</table>
					</div>				
					</p>
				</xsl:if>

				</xsl:for-each> <!-- For Each Matching Test in the Run (Always One) !-->
		</xsl:if> <!-- If Test Type Display Page !-->
	<p class="copyright">Axe Test Automation Platform - <a href="http://www.odintech.com">Odin Technology</a> - <a href="http://www.odintech.com">www.odintech.com</a></p>
	</xsl:template>
</xsl:stylesheet>