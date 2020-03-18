<?xml version="1.0" encoding="UTF-8"?>
<!--Designed and generated by Altova StyleVision Enterprise Edition 2008 rel. 2 sp1 - see http://www.altova.com/stylevision for more information.-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:n1="http://egov.bg/RegiX/Dummy/ExampleRequest" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:altova="http://www.altova.com">
	<xsl:output version="4.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
	<xsl:param name="SV_OutputFormat" select="'HTML'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<body>
				<xsl:for-each select="$XML">
					<h2 align="center">
						<span>
							<xsl:text>Входни параметри на справка за примерни данни и тестване&#160; по идентификатор и период</xsl:text>
						</span>
					</h2>
					<br/>
					<table style="width:50%; " align="center" border="0" width="100%">
						<tbody>
							<tr>
								<td>
									<span style="font-weight:bold; ">
										<xsl:text>Идентификатор</xsl:text>
									</span>
								</td>
								<td>
									<xsl:for-each select="n1:ExampleRequest">
										<xsl:for-each select="n1:Identifier">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<span style="font-weight:bold; ">
										<xsl:text>Дата от</xsl:text>
									</span>
								</td>
								<td>
									<xsl:for-each select="n1:ExampleRequest">
										<xsl:for-each select="n1:DateFrom">
											<span>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
												<xsl:text>. </xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
												<xsl:text>. </xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 12, 2)), '00')"/>
												<xsl:text>:</xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 15, 2)), '00')"/>
												<xsl:text>:</xsl:text>
												<xsl:choose>
													<xsl:when test="contains(string(string(.)), 'Z')">
														<xsl:value-of select="format-number(number(substring-after(substring-after(substring-before(string(string(.)), 'Z'), ':'), ':')), '00')"/>
													</xsl:when>
													<xsl:when test="contains(string(string(.)), '+')">
														<xsl:value-of select="format-number(number(substring-after(substring-after(substring-before(string(string(.)), '+'), ':'), ':')), '00')"/>
													</xsl:when>
													<xsl:when test="contains(substring(string(string(.)), 18), '-')">
														<xsl:value-of select="format-number(number(substring-before(substring(string(string(.)), 18), '-')), '00')"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="format-number(number(substring(string(string(.)), 18)), '00')"/>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<span style="font-weight:bold; ">
										<xsl:text>Дата до</xsl:text>
									</span>
								</td>
								<td>
									<xsl:for-each select="n1:ExampleRequest">
										<xsl:for-each select="n1:DateTo">
											<span>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
												<xsl:text>. </xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
												<xsl:text>. </xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 12, 2)), '00')"/>
												<xsl:text>:</xsl:text>
												<xsl:value-of select="format-number(number(substring(string(string(.)), 15, 2)), '00')"/>
												<xsl:text>:</xsl:text>
												<xsl:choose>
													<xsl:when test="contains(string(string(.)), 'Z')">
														<xsl:value-of select="format-number(number(substring-after(substring-after(substring-before(string(string(.)), 'Z'), ':'), ':')), '00')"/>
													</xsl:when>
													<xsl:when test="contains(string(string(.)), '+')">
														<xsl:value-of select="format-number(number(substring-after(substring-after(substring-before(string(string(.)), '+'), ':'), ':')), '00')"/>
													</xsl:when>
													<xsl:when test="contains(substring(string(string(.)), 18), '-')">
														<xsl:value-of select="format-number(number(substring-before(substring(string(string(.)), 18), '-')), '00')"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="format-number(number(substring(string(string(.)), 18)), '00')"/>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>