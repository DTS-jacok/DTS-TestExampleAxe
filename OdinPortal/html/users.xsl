<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="table">
<div>
<table class="data" id="Users">
  <tr>
    <th class="label">UserId</th>
    <th class="label">Title</th>
    <th class="label">Name</th>
    <th class="label">Gender</th>
    <th class="label">Date Of Birth</th>
  </tr>
  <xsl:for-each select="record">
    <tr>
      <td class="value"><xsl:value-of select="UserId"/></td>
      <td class="value"><xsl:value-of select="Title"/></td>
      <td class="value"><xsl:value-of select="Name"/></td>
      <td class="value"><xsl:value-of select="Gender"/></td>
      <td class="value"><xsl:value-of select="DateOfBirth"/></td>
    </tr>
  </xsl:for-each>
</table>
<table id="totalTable">
  <tr>
    <td>Total of <span id="totalUsers"><xsl:value-of select="count(record)"/></span> users</td>
  </tr>
</table>
</div>
</xsl:template>
</xsl:stylesheet>
