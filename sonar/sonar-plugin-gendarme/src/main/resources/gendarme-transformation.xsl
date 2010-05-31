<?xml version="1.0" encoding="UTF-8"?>
<!--

    Maven and Sonar plugin for .Net
    Copyright (C) 2010 Jose Chillan and Alexandre Victoor
    mailto: jose.chillan@codehaus.org or alexvictoor@codehaus.org

    Sonar is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 3 of the License, or (at your option) any later version.

    Sonar is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with Sonar; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02

-->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
  <xsl:template match="/">
    <issues>
      <xsl:apply-templates select="//results/rule/target/defect"></xsl:apply-templates>
    </issues>
  </xsl:template>
  <xsl:template match="//defect">
    <issue>
      <key>
        <xsl:value-of select="ancestor::rule/@Name" />
      </key>
      <message>
        <xsl:value-of select="ancestor::rule/problem" /><xsl:value-of select="ancestor::rule/solution" /> 
      </message>
     <!-- <level>
        <xsl:value-of select="@Severity" />
      </level> --> 
      <assembly-name>
        <xsl:value-of select="ancestor::target/@Assembly" />
      </assembly-name>
      <source>
        <xsl:value-of select="@Source" />
      </source>
    </issue>
  </xsl:template>
</xsl:stylesheet>