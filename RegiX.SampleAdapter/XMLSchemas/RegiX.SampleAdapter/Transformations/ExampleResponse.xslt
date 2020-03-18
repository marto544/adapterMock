<?xml version="1.0" encoding="UTF-8"?>
<!--Designed and generated by Altova StyleVision Enterprise Edition 2008 rel. 2 sp1 - see http://www.altova.com/stylevision for more information.-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:n1="http://egov.bg/RegiX/Dummy/ExampleResponse" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:altova="http://www.altova.com">
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
							<xsl:text>Справка за примерни данни и тестване по идентификатор и период</xsl:text>
						</span>
					</h2>
					<xsl:for-each select="n1:ExampleResponse">
						<br/>
						<p style="padding-left:5%; ">
							<span style="font-weight:bold; ">
								<xsl:text>Поле от тип низ:</xsl:text>
							</span>
							<span>
								<xsl:text>&#160;</xsl:text>
							</span>
							<xsl:for-each select="n1:StringData">
								<xsl:apply-templates/>
							</xsl:for-each>
						</p>
						<p style="padding-left:5%; ">
							<span style="font-weight:bold; ">
								<xsl:text>Поле от числов тип:</xsl:text>
							</span>
							<span>
								<xsl:text>&#160;</xsl:text>
							</span>
							<xsl:for-each select="n1:IntData">
								<xsl:apply-templates/>
							</xsl:for-each>
						</p>
						<br/>
						<p style="padding-left:5%; padding-right:5%; ">
							<span style="font-size:15pt; font-weight:bold; ">
								<xsl:text>Списъчни данни:</xsl:text>
							</span>
							<span style="font-size:15pt; ">
								<xsl:text>&#160;</xsl:text>
							</span>
						</p>
						<xsl:choose>
							<xsl:when test="count(  n1:ListData/n1:ListElement )  &gt; 0">
								<xsl:for-each select="n1:ListData">
									<xsl:for-each select="n1:ListElement">
										<xsl:choose>
											<xsl:when test="string-length( . ) &gt; 0">
												<p style="font-size:14pt; font-weight:bold; padding-left:7%; padding-right:5%; ">
													<span style="font-size:13pt; font-weight:bold; ">
														<xsl:text>Елемент на списъка </xsl:text>
													</span>
													<span style="font-weight:bold; ">
														<xsl:value-of select="format-number(number(position()), '0')"/>
													</span>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Начална дата на валидност:</xsl:text>
													</span>
													<span>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:for-each select="n1:DateFrom">
														<span>
															<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
															<xsl:text>.</xsl:text>
															<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
															<xsl:text>.</xsl:text>
															<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
														</span>
													</xsl:for-each>
													<span>
														<xsl:text> г.</xsl:text>
													</span>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Крайна дата на валидност:</xsl:text>
													</span>
													<span>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:for-each select="n1:DateTo">
														<span>
															<xsl:value-of select="format-number(number(substring(string(string(.)), 9, 2)), '00')"/>
															<xsl:text>.</xsl:text>
															<xsl:value-of select="format-number(number(substring(string(string(.)), 6, 2)), '00')"/>
															<xsl:text>.</xsl:text>
															<xsl:value-of select="format-number(number(substring(string(string(string(.))), 1, 4)), '0000')"/>
														</span>
													</xsl:for-each>
													<span>
														<xsl:text> г.</xsl:text>
													</span>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Брой: </xsl:text>
													</span>
													<xsl:for-each select="n1:Count">
														<xsl:apply-templates/>
													</xsl:for-each>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Община:</xsl:text>
													</span>
													<span>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:for-each select="n1:Minucipality">
														<xsl:apply-templates/>
													</xsl:for-each>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Област:</xsl:text>
													</span>
													<span>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:for-each select="n1:Area">
														<xsl:apply-templates/>
													</xsl:for-each>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Град:</xsl:text>
													</span>
													<span>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:for-each select="n1:Town">
														<xsl:apply-templates/>
													</xsl:for-each>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Район:</xsl:text>
													</span>
													<span>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:for-each select="n1:District">
														<xsl:apply-templates/>
													</xsl:for-each>
												</p>
												<p style="padding-left:9%; padding-right:5%; ">
													<span style="font-weight:bold; ">
														<xsl:text>Адрес:</xsl:text>
													</span>
													<span>
														<xsl:text>&#160;</xsl:text>
													</span>
													<xsl:for-each select="n1:Address">
														<xsl:apply-templates/>
													</xsl:for-each>
												</p>
											</xsl:when>
											<xsl:otherwise/>
										</xsl:choose>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<span>
									<xsl:text>Няма информация</xsl:text>
								</span>
							</xsl:otherwise>
						</xsl:choose>
						<br/>
						<br/>
					</xsl:for-each>
					<br/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
