<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
    <!-- **************************************************************************-->
    <!-- 2024-11-22 ebb: This XSLT starter file is for the XSLT test in DIGIT 110. 
    Do not alter the stylesheet root element or the output line. 
    
   Your task is to transform the source XML document of Bram Stoker's novel Dracula into HTML with a 
   table of contents linked to a reading view, and styled with CSS. Your XSLT code needs to 
   * process one source XML file and output one valid and well-formed HTML file;
   * contain an HTML table  for the table of contents featuring:
        * each chapter heading
        * each chapter's distinct sorted devices
        * each chapter's distinct sorted places;
       
     
   * contain internal links from the chapter headings in the table of contents to the chapter headings;
   * contain span elements in the reading view to stylize the locations and technologies mentioned. 
   * Prepare CSS to style your HTML. The XSLT should output the CSS link line to your CSS file accurately. 
   
   
    -->
    <!-- **************************************************************************-->

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="/root/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="Dracula.css"/>
            </head>
            <body>
                <h1 id="top">
                    <xsl:value-of select="/root/title"/>
                </h1>

                <!-- Table of Contents -->
                <section id="contents">
                    <h2>Table of Contents</h2>
                    <table>
                        <tr>
                            <th>Chapter Number</th>
                            <th>Locations Mentioned</th>
                            <th>Technologies Mentioned</th>
                        </tr>
                        <xsl:for-each select="/root/chapter">
                            <tr>
                                <td>
                                    <a href="#{generate-id()}">
                                        <xsl:value-of select="heading"/>
                                    </a>
                                </td>
                                <td>
                                    <xsl:for-each
                                        select="p/place[not(@where = preceding::p/place/@where)]">
                                        <xsl:value-of select="@where"/>
                                        <xsl:if test="position() != last()">, </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="p/device[not(. = preceding::p/device)]">
                                        <xsl:value-of select="normalize-space(.)"/>
                                        <xsl:if test="position() != last()">, </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <!-- ebb: prepare the table of contents representing each descendant chapter heading,
                   Hint: use <xsl:apply-templates with @mode here.  -->
                    </table>
                </section>

                <!-- Reading View -->
                <section id="readingView">
                    <!-- ebb: process the same descendant chapter heading elements here, but this time to start processing the reading view.  -->
                    <h2>Reading View</h2>
                    <xsl:for-each select="/root/chapter">
                        <h3 id="{generate-id()}">
                            <xsl:value-of select="heading"/>
                        </h3>
                        <xsl:apply-templates select="p"/>
                    </xsl:for-each>
                </section>
            </body>
        </html>
    </xsl:template>
    <!--ebb: Continue writing template rules, some with @mode for the table of contents, and some without it for the reading view.  -->

    <!-- Template for paragraphs -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Template for places -->
    <xsl:template match="place">
        <span class="location">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <!-- Template for devices -->
    <xsl:template match="device">
        <span class="technology">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

</xsl:stylesheet>
