<?xml version="1.0" encoding="UTF-8"?><structure version="7" xsltversion="1" cssmode="strict" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" embed-images="1">	<parameters/>	<schemasources>		<namespaces>			<nspair prefix="n1" uri="http://egov.bg/RegiX/Dummy/ExampleRequest"/>		</namespaces>		<schemasources>			<xsdschemasource name="$XML" main="1" schemafile="D:\Projects\RegiX\RegiX.DummyAdapter\XMLSchemas\ExampleRequest.xsd">				<xmltablesupport/>				<textstateicons/>			</xsdschemasource>		</schemasources>	</schemasources>	<modules/>	<flags>		<scripts/>		<globalparts/>		<designfragments/>		<pagelayouts/>	</flags>	<scripts>		<script language="javascript"/>	</scripts>	<globalstyles/>	<mainparts>		<children>			<globaltemplate match="/" matchtype="named" parttype="main">				<children>					<template match="$XML" matchtype="schemasource">						<editorproperties elementstodisplay="5"/>						<children>							<paragraph paragraphtag="h2">								<properties align="center"/>								<children>									<text fixtext="Входни параметри на справка за примерни данни и тестване  по идентификатор и период"/>								</children>							</paragraph>							<newline/>							<table>								<properties align="center" border="0" width="100%"/>								<styles width="50%"/>								<children>									<tablebody>										<children>											<tablerow>												<children>													<tablecell>														<children>															<text fixtext="Идентификатор">																<styles font-weight="bold"/>															</text>														</children>													</tablecell>													<tablecell>														<children>															<template match="n1:ExampleRequest" matchtype="schemagraphitem">																<editorproperties elementstodisplay="5"/>																<children>																	<template match="n1:Identifier" matchtype="schemagraphitem">																		<editorproperties elementstodisplay="5"/>																		<children>																			<content>																				<format datatype="string"/>																			</content>																		</children>																	</template>																</children>															</template>														</children>													</tablecell>												</children>											</tablerow>											<tablerow>												<children>													<tablecell>														<children>															<text fixtext="Дата от">																<styles font-weight="bold"/>															</text>														</children>													</tablecell>													<tablecell>														<children>															<template match="n1:ExampleRequest" matchtype="schemagraphitem">																<editorproperties elementstodisplay="5"/>																<children>																	<template match="n1:DateFrom" matchtype="schemagraphitem">																		<editorproperties elementstodisplay="5"/>																		<children>																			<content>																				<format string="DD. MM. YYYY hh:mm:ss" datatype="dateTime"/>																			</content>																			<button>																				<action>																					<datepicker/>																				</action>																			</button>																		</children>																	</template>																</children>															</template>														</children>													</tablecell>												</children>											</tablerow>											<tablerow>												<children>													<tablecell>														<children>															<text fixtext="Дата до">																<styles font-weight="bold"/>															</text>														</children>													</tablecell>													<tablecell>														<children>															<template match="n1:ExampleRequest" matchtype="schemagraphitem">																<editorproperties elementstodisplay="5"/>																<children>																	<template match="n1:DateTo" matchtype="schemagraphitem">																		<editorproperties elementstodisplay="5"/>																		<children>																			<content>																				<format string="DD. MM. YYYY hh:mm:ss" datatype="dateTime"/>																			</content>																			<button>																				<action>																					<datepicker/>																				</action>																			</button>																		</children>																	</template>																</children>															</template>														</children>													</tablecell>												</children>											</tablerow>										</children>									</tablebody>								</children>							</table>							<newline/>						</children>					</template>				</children>			</globaltemplate>		</children>	</mainparts>	<globalparts/>	<pagelayout/>	<designfragments/></structure>