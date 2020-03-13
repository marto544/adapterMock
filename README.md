# Примерна реализация на адаптер
Настоящият документ описва примерни стъпки за разработка на адаптер за RegiX.

## Съдържание

<!-- TOC -->

- [1. Създаване на проект](#heading)
  * [1.1. Промяна на DefaultNamespace](#sub-heading)
  * [1.2. Добавяне на описание на файлове в доставяния пакет](#sub-heading)
- [2. Добавяне на зависимости чрез инсталация на Nuget пакети](#heading-1)
  * [2.1. Създаване на nuspec файлове](#sub-heading-1)



    + [Sub-sub-heading](#sub-sub-heading-1)
- [4. Добавяне на схеми, метаданни, трансформации](#схеми-трансформации)
  * [Sub-heading](#sub-heading-2)
    + [Sub-sub-heading](#sub-sub-heading-2)


<!-- /TOC -->
## 1. Създаване на проект
В настоящата инструкция, за разработка на адаптерите се използва .NET Framework. Създайте три проекта със следните типове и примерни имена:

* RegiX.**Name**Adapter с тип Class Library (.NET Standard)
* RegiX.**Name**Adapter.Mock с тип Class Library (.NET Standard)
* RegiX.**Name**Adapter.Test с тип MSTest Test Project (.NET Core)

След създаване на проектите, премахнете автоматично създадените класове за всеки от създадените проекти.

### 1.1. Промяна на DefaultNamespace
Променете DefaultNamespace, така че да съдържа името на компанията разработчик:

  * **Company**.RegiX.**Name**Adapter
  * **Company**.RegiX.**Name**Adapter.Mock
  * **Company**.RegiX.**Name**Adapter.Test

Структурата на Namespace е: **Company**.RegiX.**Name**Adapter

Редактирайте описанието на проекта (auhtor, company, description) като натиснете десен бутон на мишката върху името на проекта, изберете Properties и то менюто в ляво Package.

### 1.2. Добавяне на описание на файлове в доставяния пакет
За всеки от проектите, натиснете върху наименованието му. Между таговете `</PropertyGroup> и </Project>` добавете:

* За адаптер **Company**.RegiX.**Name**Adapter

```xml
  <ItemGroup>
    <Content Include="XMLSamples\*\*.xml">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="XMLSchemas\*\Transformations\*.xslt">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="XMLSchemas\*\*.xsd">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Content Include="XMLMetaData\*\*.xml">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
  </ItemGroup>
```

* За адаптер **Company**.RegiX.**Name**Adapter.Mock кода се добавя между `</PropertyGroup> и </Project>`.

```xml
  <ItemGroup>
    <Content Include="XMLData\*\*.xml">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
  </ItemGroup>
```

## 2. Добавяне на зависимости чрез инсталация на Nuget пакети

### 2.1. Създаване на nuspec файлове 
За работа по създадените проекти с Nuget Packet Manager, необходимо е да генерирате XML метаописания. В директориите на проектите RegiX.**Name**Adapter и RegiX.**Name**Adapter.Mock изпълнете командата `nuget spec`, за да създадете .nuspec файлове. Последна версия на nuget.exe ще откриете на адрес: https://www.nuget.org/downloads.

Редактирайте съдържанието на .nuspec файловете `RegiX.**Name**Adapter.nuspec` и `RegiX.**Name**Adapter.Mock`, като изтриете елементите `<licenceURL>, <projectURL>, <iconURL>,<copyright2020>, <tags>`.

### 2.2. Разширяване структурата на проектите
В директорията на проект RegiX.**Name**Adapter, създайте следните поддиректории:
* AdapterService
* APIService
* XMLMetaData\RegiX.**Name**Adapter
* XMLSamples\RegiX.**Name**Adapter
* XMLSchemas\RegiX.**Name**Adapter

### 2.3. Добавяне на пакети

#### 2.3.1. Изтегляне на необходимите пакети, които ще бъдат инсталирани
  Добавете път към адрес на местоположение на Nuget пакети, като изберете Tools, Nuget Package Manager, Packet Manager Settings.
  От менюто в ляво се избира: Pacakage Sources. Добавянето на пътя към Nuget пакетите става чрез натискането на бутона плюс и след това попълването на Името и в полето Source се посочва пътя към пакетите. 

#### 2.3.2. Инсталиране на пакети
След задаване на адрес на хранилище с Nuget пакети, е необходимо те да бъдат инсталирани. За проектите добавете следните референции, като натиснете десен бутон върху името на проекта и изберете Manage NuGet Packages от контекстното меню:

* **RegiX.Adapters.Common** в проект RegiX.**Name**Adapter
* **RegiX.Adapters.Mocks** в проект RegiX.**Name**Adapter.Mock
* **RegiX.Adapters.TestUtils** в проект RegiX.**Name**Adapter.Test

## 3. Създаване на класове

Създайте спрямо описанието в стандарта за раработка на адаптери следние файлове, които да служат като класове, в съответните директории.  

`RegiX.**Name**Adapter\RegiX.**Name**Adapter\AdapterService\I**Name**Adapter.cs`
`RegiX.**Name**Adapter\RegiX.**Name**Adapter\AdapterService\NameAdapter.cs`
`RegiX.**Name**Adapter\RegiX.**Name**Adapter\APIService\I**Name**API.cs`
`RegiX.**Name**Adapter\RegiX.**Name**Adapter\APIService\**Name**API.cs`

### 3.1. Добавяне на методи (операции) в класове

Във всеки от създадените в т. 3 класове е необходимо да въведете метод за всяка операция. Кодът използван по-долу е примерен. Необходимо е да промените `namespace` според наименованието на вашите организация и име на проект.

* В I**Name**Adapter.cs използвайте:

```csharp
using System.ComponentModel;
using System.ServiceModel;
using TechnoLogica.RegiX.Common;
using TechnoLogica.RegiX.Common.DataContracts;
using TechnoLogica.RegiX.Common.ObjectMapping;

namespace DAEU.RegiX.SampleAdapter.AdapterService
{
    [ServiceContract]
    [Description("Примерен адаптер")]
    public interface ISampleAdapter : IAdapterServiceWCF
    {
        [OperationContract]
        [Description("Примерна услуга 1")]
        CommonSignedResponse<ExampleRequest, ExampleResponse> Example(ExampleRequest argument, AccessMatrix accessMatrix, AdapterAdditionalParameters aditionalParameters);

        [OperationContract]
        [Description("Примерна услуга 2")]
        CommonSignedResponse<ExampleRequest, ExampleResponse> Example2(ExampleRequest argument, AccessMatrix accessMatrix, AdapterAdditionalParameters aditionalParameters);

        [OperationContract]
        [Description("Примерна услуга 3")]
        CommonSignedResponse<ExampleRequest, ExampleResponse> Example3(ExampleRequest argument, AccessMatrix accessMatrix, AdapterAdditionalParameters aditionalParameters);
    }
}
```

* В **Name**Adapter.cs използвайте:

```csharp
using System.ComponentModel.Composition;
using TechnoLogica.RegiX.Adapters.Common;
using TechnoLogica.RegiX.Adapters.Common.DataContracts;
using TechnoLogica.RegiX.Adapters.Common.ExportExtension;
using TechnoLogica.RegiX.Adapters.Common.ObjectMapping;
using TechnoLogica.RegiX.Common;
using TechnoLogica.RegiX.Common.DataContracts;
using TechnoLogica.RegiX.Common.DataContracts.Parameter;
using TechnoLogica.RegiX.Common.ObjectMapping;
using TechnoLogica.RegiX.Common.Utils;

namespace DAEU.RegiX.SampleAdapter.AdapterService
{
    [Export(typeof(IAdapterService))]
    [ExportFullName(typeof(SampleAdapter), typeof(IAdapterService))]
    [ExportSimpleName(typeof(SampleAdapter), typeof(IAdapterService))]
    public class SampleAdapter : BaseAdapterService, ISampleAdapter
    {
        public CommonSignedResponse<ExampleRequest, ExampleResponse> Example(ExampleRequest argument, AccessMatrix accessMatrix, AdapterAdditionalParameters aditionalParameters)
        {
            ExampleResponse response = new ExampleResponse();
            response.StringData = argument.Identifier;
            response.StringData2 = "Operation 1";
            
            var mapper = new SelfMapper<ExampleResponse>(accessMatrix);
            ExampleResponse result = new ExampleResponse();
            mapper.Map(response, result);

            return SigningUtils.CreateAndSign(argument, result, accessMatrix, aditionalParameters);
        }

        public CommonSignedResponse<ExampleRequest, ExampleResponse> Example2(ExampleRequest argument, AccessMatrix accessMatrix, AdapterAdditionalParameters aditionalParameters)
        {
            ExampleResponse response = new ExampleResponse();
            response.StringData = argument.Identifier;
            response.StringData2 = "Operation 2";

            var mapper = new SelfMapper<ExampleResponse>(accessMatrix);
            ExampleResponse result = new ExampleResponse();
            mapper.Map(response, result);

            return SigningUtils.CreateAndSign(argument, result, accessMatrix, aditionalParameters);
        }

        public CommonSignedResponse<ExampleRequest, ExampleResponse> Example3(ExampleRequest argument, AccessMatrix accessMatrix, AdapterAdditionalParameters aditionalParameters)
        {
            ExampleResponse response = new ExampleResponse();
            response.StringData = argument.Identifier;
            response.StringData2 = "Operation 3";

            var mapper = new SelfMapper<ExampleResponse>(accessMatrix);
            ExampleResponse result = new ExampleResponse();
            mapper.Map(response, result);

            return SigningUtils.CreateAndSign(argument, result, accessMatrix, aditionalParameters);
        }
    }
}
```

* **Name**API.cs

```csharp
using DAEU.RegiX.SampleAdapter.AdapterService;
using System.ComponentModel.Composition;
using TechnoLogica.RegiX.Adapters.Common;
using TechnoLogica.RegiX.Adapters.Common.ExportExtension;
using TechnoLogica.RegiX.Common;
using TechnoLogica.RegiX.Common.TransportObjects;

namespace DAEU.RegiX.SampleAdapter.APIService
{
    [ExportFullName(typeof(ISampleAPI), typeof(IAPIService))]
    [Export(typeof(IAPIService))]
    public class SampleAPI : BaseAPIService, ISampleAPI
    {
        public ServiceResultDataSigned<ExampleRequest, ExampleResponse> Example(ServiceRequestData<ExampleRequest> argument)
        {
            return AdapterClient.Execute<ISampleAdapter, ExampleRequest, ExampleResponse>(
                (i, r, a, o) => i.Example(r, a, o),
                argument);
        }

        public ServiceResultDataSigned<ExampleRequest, ExampleResponse> Example2(ServiceRequestData<ExampleRequest> argument)
        {
            return AdapterClient.Execute<ISampleAdapter, ExampleRequest, ExampleResponse>(
                (i, r, a, o) => i.Example2(r, a, o),
                argument);
        }

        public ServiceResultDataSigned<ExampleRequest, ExampleResponse> Example3(ServiceRequestData<ExampleRequest> argument)
        {
            return AdapterClient.Execute<ISampleAdapter, ExampleRequest, ExampleResponse>(
                (i, r, a, o) => i.Example3(r, a, o),
                argument);
        }
    }
}
```

* I**Name**API.cs

```csharp
using System.ComponentModel;
using System.ServiceModel;
using TechnoLogica.RegiX.Adapters.Common.Attributes;
using TechnoLogica.RegiX.Common;
using TechnoLogica.RegiX.Common.TransportObjects;

namespace DAEU.RegiX.SampleAdapter.APIService
{
    [ServiceContract]
    [XmlSerializerFormat]
    [Description("API на примерен адаптер")]
    public interface ISampleAPI : IAPIService
    {
        [OperationContract]
        [Description("Изпълнява примерна услуга 1")]
        ServiceResultDataSigned<ExampleRequest, ExampleResponse> Example(ServiceRequestData<ExampleRequest> argument);

        [OperationContract]
        [Description("Изпълнява примерна услуга 2")]
        [Info(requestXSD: "ExampleRequest.xsd", responseXSD: "ExampleResponse.xsd",
            sampleRequest: "ExampleRequest.xml",
            sampleResponse: "ExampleResponse.xml",
            requestXSLT: "ExampleRequest.xslt",
            responseXSLT: "ExampleResponse.xslt", metaDataXML: "Example.xml")]
        ServiceResultDataSigned<ExampleRequest, ExampleResponse> Example2(ServiceRequestData<ExampleRequest> argument);

        [OperationContract]
        [Description("Изпълнява примерна услуга 3")]
        [Info(requestXSD: "ExampleRequest.xsd", responseXSD: "ExampleResponse.xsd",
            sampleRequest: "ExampleRequest.xml",
            sampleResponse: "ExampleResponse.xml",
            requestXSLT: "ExampleRequest.xslt",
            responseXSLT: "ExampleResponse.xslt", metaDataXML: "Example.xml")]
        ServiceResultDataSigned<ExampleRequest, ExampleResponse> Example3(ServiceRequestData<ExampleRequest> argument);
    }
}
```

Класовете I**Name**API.cs и **Name**API.cs работят на ядрото на RegiX. I**Name**Adapter.cs и NameAdapter.cs работят при регистъра, за който разработваме адаптер.

## 4. Добавяне на схеми, метаданни, трансформации
Във всеки от класовете е необходимо да въведете метод за всяка операция. Можете да генерирате класове от xml схеми чрез инструмента Xml2Code или да използвате примерния код по-долу. Необходимо е да промените връзките и `namespace`, според наименованието на вашите организация и име на проект и да добавите допълнителни операции.

### 4.1. Попълване на схеми, метаданни и трансформации

`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\ExampleRequest.xsd`
```xsd
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://egov.bg/RegiX/Sample/ExampleRequest" targetNamespace="http://egov.bg/RegiX/Sample/ExampleRequest" elementFormDefault="qualified" attributeFormDefault="unqualified">
  <xs:element name="ExampleRequest">
    <xs:annotation>
      <xs:documentation>Аргумент на примерна операция</xs:documentation>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element name="Identifier" type="xs:string">
          <xs:annotation>
            <xs:documentation>Идентификатор</xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element name="DateFrom" type="xs:dateTime" minOccurs="0">
          <xs:annotation>
            <xs:documentation>От дата</xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element name="DateTo" type="xs:dateTime" minOccurs="0">
          <xs:annotation>
            <xs:documentation>До дата</xs:documentation>
          </xs:annotation>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>
```


`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\ExampleResponse.xsd`
```xsd
<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2008 rel. 2 (http://www.altova.com) by mazuki (darksiderg) -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://egov.bg/RegiX/Sample/ExampleResponse" targetNamespace="http://egov.bg/RegiX/Sample/ExampleResponse" elementFormDefault="qualified" attributeFormDefault="unqualified">
	<xs:element name="ExampleResponse">
		<xs:annotation>
			<xs:documentation>Примерна операция - резултат</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="StringData" type="xs:string" minOccurs="0">
					<xs:annotation>
						<xs:documentation>Поле от тип низ</xs:documentation>
					</xs:annotation>
				</xs:element>
        <xs:element name="StringData2" type="xs:string" minOccurs="0">
          <xs:annotation>
            <xs:documentation>Поле от тип низ 2</xs:documentation>
          </xs:annotation>
        </xs:element>
				<xs:element name="IntData" type="xs:int" minOccurs="0">
					<xs:annotation>
						<xs:documentation>Поле от числов тип</xs:documentation>
					</xs:annotation>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
</xs:schema>
```

`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\ExampleRequest.designer.cs`
```cs
// ------------------------------------------------------------------------------
//  <auto-generated>
//    Generated by Xsd2Code. Version 3.4.0.15985
//    <NameSpace>Contoso.RegiX.ReferenceAdapter</NameSpace><Collection>List</Collection><codeType>CSharp</codeType><EnableDataBinding>False</EnableDataBinding><EnableLazyLoading>False</EnableLazyLoading><TrackingChangesEnable>False</TrackingChangesEnable><GenTrackingClasses>False</GenTrackingClasses><HidePrivateFieldInIDE>False</HidePrivateFieldInIDE><EnableSummaryComment>True</EnableSummaryComment><VirtualProp>False</VirtualProp><IncludeSerializeMethod>False</IncludeSerializeMethod><UseBaseClass>False</UseBaseClass><GenBaseClass>False</GenBaseClass><GenerateCloneMethod>False</GenerateCloneMethod><GenerateDataContracts>False</GenerateDataContracts><CodeBaseTag>Net40</CodeBaseTag><SerializeMethodName>Serialize</SerializeMethodName><DeserializeMethodName>Deserialize</DeserializeMethodName><SaveToFileMethodName>SaveToFile</SaveToFileMethodName><LoadFromFileMethodName>LoadFromFile</LoadFromFileMethodName><GenerateXMLAttributes>True</GenerateXMLAttributes><EnableEncoding>False</EnableEncoding><AutomaticProperties>False</AutomaticProperties><GenerateShouldSerialize>False</GenerateShouldSerialize><DisableDebug>False</DisableDebug><PropNameSpecified>Default</PropNameSpecified><Encoder>UTF8</Encoder><CustomUsings></CustomUsings><ExcludeIncludedTypes>True</ExcludeIncludedTypes><EnableInitializeFields>True</EnableInitializeFields>
//  </auto-generated>
// ------------------------------------------------------------------------------
namespace DAEU.RegiX.SampleAdapter{
    using System;
    using System.Diagnostics;
    using System.Xml.Serialization;
    using System.Collections;
    using System.Xml.Schema;
    using System.ComponentModel;
    using System.Collections.Generic;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("Xsd2Code", "3.4.0.24195")]
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace= "http://egov.bg/RegiX/Sample/ExampleRequest")]
    [System.Xml.Serialization.XmlRootAttribute("ExampleRequest", Namespace= "http://egov.bg/RegiX/Sample/ExampleRequest", IsNullable=false)]
    public partial class ExampleRequest {
        
        private string identifierField;
        
        private System.DateTime dateFromField;
        
        private bool dateFromFieldSpecified;
        
        private System.DateTime dateToField;
        
        private bool dateToFieldSpecified;
        
        /// <summary>
        /// Идентификатор
        /// </summary>
        [System.Xml.Serialization.XmlElementAttribute(Order=0)]
        [System.ComponentModel.DescriptionAttribute("Идентификатор")]
        public string Identifier {
            get {
                return this.identifierField;
            }
            set {
                this.identifierField = value;
            }
        }
        
        /// <summary>
        /// От дата
        /// </summary>
        [System.Xml.Serialization.XmlElementAttribute(Order=1)]
        [System.ComponentModel.DescriptionAttribute("От дата")]
        public System.DateTime DateFrom {
            get {
                return this.dateFromField;
            }
            set {
                this.dateFromField = value;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool DateFromSpecified {
            get {
                return this.dateFromFieldSpecified;
            }
            set {
                this.dateFromFieldSpecified = value;
            }
        }
        
        /// <summary>
        /// До дата
        /// </summary>
        [System.Xml.Serialization.XmlElementAttribute(Order=2)]
        [System.ComponentModel.DescriptionAttribute("До дата")]
        public System.DateTime DateTo {
            get {
                return this.dateToField;
            }
            set {
                this.dateToField = value;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool DateToSpecified {
            get {
                return this.dateToFieldSpecified;
            }
            set {
                this.dateToFieldSpecified = value;
            }
        }
    }
}

```


`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\ExampleResponse.designer.cs`
```cs
// ------------------------------------------------------------------------------
//  <auto-generated>
//    Generated by Xsd2Code. Version 3.4.0.15985
//    <NameSpace>Contoso.RegiX.ReferenceAdapter</NameSpace><Collection>List</Collection><codeType>CSharp</codeType><EnableDataBinding>False</EnableDataBinding><EnableLazyLoading>False</EnableLazyLoading><TrackingChangesEnable>False</TrackingChangesEnable><GenTrackingClasses>False</GenTrackingClasses><HidePrivateFieldInIDE>False</HidePrivateFieldInIDE><EnableSummaryComment>True</EnableSummaryComment><VirtualProp>False</VirtualProp><IncludeSerializeMethod>False</IncludeSerializeMethod><UseBaseClass>False</UseBaseClass><GenBaseClass>False</GenBaseClass><GenerateCloneMethod>False</GenerateCloneMethod><GenerateDataContracts>False</GenerateDataContracts><CodeBaseTag>Net40</CodeBaseTag><SerializeMethodName>Serialize</SerializeMethodName><DeserializeMethodName>Deserialize</DeserializeMethodName><SaveToFileMethodName>SaveToFile</SaveToFileMethodName><LoadFromFileMethodName>LoadFromFile</LoadFromFileMethodName><GenerateXMLAttributes>True</GenerateXMLAttributes><EnableEncoding>False</EnableEncoding><AutomaticProperties>False</AutomaticProperties><GenerateShouldSerialize>False</GenerateShouldSerialize><DisableDebug>False</DisableDebug><PropNameSpecified>Default</PropNameSpecified><Encoder>UTF8</Encoder><CustomUsings></CustomUsings><ExcludeIncludedTypes>True</ExcludeIncludedTypes><EnableInitializeFields>True</EnableInitializeFields>
//  </auto-generated>
// ------------------------------------------------------------------------------
namespace DAEU.RegiX.DaeuTestAdapter
{
    using System;
    using System.Diagnostics;
    using System.Xml.Serialization;
    using System.Collections;
    using System.Xml.Schema;
    using System.ComponentModel;
    using System.Collections.Generic;
    using System.Runtime.Serialization;


    /// <summary>
    /// Справка за примерни данни и тестване  по идентификатор и период - резултат
    /// </summary>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("Xsd2Code", "3.4.0.24199")]
    [System.SerializableAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace= "http://egov.bg/RegiX/DaeuTest/ExampleResponse")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace= "http://egov.bg/RegiX/DaeuTest/ExampleResponse", IsNullable=false)]
    [System.ComponentModel.DescriptionAttribute("Примерна операция - резултат")]
    public partial class ExampleResponse {
        
        private string stringDataField;

        private string stringDataField2;

        private int intDataField;
        
        private bool intDataFieldSpecified;
        
        /// <summary>
        /// ExampleResponse class constructor
        /// </summary>
        public ExampleResponse() {
        }
        
        [System.Xml.Serialization.XmlElementAttribute(Order=0)]
        [System.ComponentModel.DescriptionAttribute("Поле от тип низ")]
        public string StringData {
            get {
                return this.stringDataField;
            }
            set {
                this.stringDataField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute(Order = 1)]
        [System.ComponentModel.DescriptionAttribute("Поле от тип низ")]
        public string StringData2
        {
            get
            {
                return this.stringDataField2;
            }
            set
            {
                this.stringDataField2 = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute(Order=2)]
        [System.ComponentModel.DescriptionAttribute("Поле от числов тип")]
        public int IntData {
            get {
                return this.intDataField;
            }
            set {
                this.intDataField = value;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool IntDataSpecified {
            get {
                return this.intDataFieldSpecified;
            }
            set {
                this.intDataFieldSpecified = value;
            }
        }
    }
}

```




`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\Transformations\ExampleRequest.sps`

```xml

<?xml version="1.0" encoding="UTF-8"?>
<structure version="7" xsltversion="1" cssmode="strict" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" embed-images="1">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="n1" uri="http://egov.bg/RegiX/Dummy/ExampleRequest"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="$XML" main="1" schemafile="D:\Projects\RegiX\RegiX.DummyAdapter\XMLSchemas\ExampleRequest.xsd">
				<xmltablesupport/>
				<textstateicons/>
			</xsdschemasource>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate match="/" matchtype="named" parttype="main">
				<children>
					<template match="$XML" matchtype="schemasource">
						<editorproperties elementstodisplay="5"/>
						<children>
							<paragraph paragraphtag="h2">
								<properties align="center"/>
								<children>
									<text fixtext="Входни параметри на справка за примерни данни и тестване  по идентификатор и период"/>
								</children>
							</paragraph>
							<newline/>
							<table>
								<properties align="center" border="0" width="100%"/>
								<styles width="50%"/>
								<children>
									<tablebody>
										<children>
											<tablerow>
												<children>
													<tablecell>
														<children>
															<text fixtext="Идентификатор">
																<styles font-weight="bold"/>
															</text>
														</children>
													</tablecell>
													<tablecell>
														<children>
															<template match="n1:ExampleRequest" matchtype="schemagraphitem">
																<editorproperties elementstodisplay="5"/>
																<children>
																	<template match="n1:Identifier" matchtype="schemagraphitem">
																		<editorproperties elementstodisplay="5"/>
																		<children>
																			<content>
																				<format datatype="string"/>
																			</content>
																		</children>
																	</template>
																</children>
															</template>
														</children>
													</tablecell>
												</children>
											</tablerow>
											<tablerow>
												<children>
													<tablecell>
														<children>
															<text fixtext="Дата от">
																<styles font-weight="bold"/>
															</text>
														</children>
													</tablecell>
													<tablecell>
														<children>
															<template match="n1:ExampleRequest" matchtype="schemagraphitem">
																<editorproperties elementstodisplay="5"/>
																<children>
																	<template match="n1:DateFrom" matchtype="schemagraphitem">
																		<editorproperties elementstodisplay="5"/>
																		<children>
																			<content>
																				<format string="DD. MM. YYYY hh:mm:ss" datatype="dateTime"/>
																			</content>
																			<button>
																				<action>
																					<datepicker/>
																				</action>
																			</button>
																		</children>
																	</template>
																</children>
															</template>
														</children>
													</tablecell>
												</children>
											</tablerow>
											<tablerow>
												<children>
													<tablecell>
														<children>
															<text fixtext="Дата до">
																<styles font-weight="bold"/>
															</text>
														</children>
													</tablecell>
													<tablecell>
														<children>
															<template match="n1:ExampleRequest" matchtype="schemagraphitem">
																<editorproperties elementstodisplay="5"/>
																<children>
																	<template match="n1:DateTo" matchtype="schemagraphitem">
																		<editorproperties elementstodisplay="5"/>
																		<children>
																			<content>
																				<format string="DD. MM. YYYY hh:mm:ss" datatype="dateTime"/>
																			</content>
																			<button>
																				<action>
																					<datepicker/>
																				</action>
																			</button>
																		</children>
																	</template>
																</children>
															</template>
														</children>
													</tablecell>
												</children>
											</tablerow>
										</children>
									</tablebody>
								</children>
							</table>
							<newline/>
						</children>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<pagelayout/>
	<designfragments/>
</structure>

```

`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\Transformations\ExampleResponse.sps`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<structure version="7" xsltversion="1" cssmode="strict" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" embed-images="1">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="n1" uri="http://egov.bg/RegiX/Dummy/ExampleResponse"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="$XML" main="1" schemafile="D:\Projects\RegiX\RegiX.DummyAdapter\XMLSchemas\ExampleResponse.xsd" workingxmlfile="ExampleResponse.xml">
				<xmltablesupport/>
				<textstateicons/>
			</xsdschemasource>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate match="/" matchtype="named" parttype="main">
				<children>
					<template match="$XML" matchtype="schemasource">
						<editorproperties elementstodisplay="5"/>
						<children>
							<paragraph paragraphtag="h2">
								<properties align="center"/>
								<children>
									<text fixtext="Справка за примерни данни и тестване по идентификатор и период"/>
								</children>
							</paragraph>
							<template match="n1:ExampleResponse" matchtype="schemagraphitem">
								<editorproperties elementstodisplay="5"/>
								<children>
									<newline/>
									<paragraph paragraphtag="p">
										<styles padding-left="5%"/>
										<children>
											<text fixtext="Поле от тип низ:">
												<styles font-weight="bold"/>
											</text>
											<text fixtext=" "/>
											<template match="n1:StringData" matchtype="schemagraphitem">
												<editorproperties elementstodisplay="5"/>
												<children>
													<content>
														<format datatype="string"/>
													</content>
												</children>
											</template>
										</children>
									</paragraph>
									<paragraph paragraphtag="p">
										<styles padding-left="5%"/>
										<children>
											<text fixtext="Поле от числов тип:">
												<styles font-weight="bold"/>
											</text>
											<text fixtext=" "/>
											<template match="n1:IntData" matchtype="schemagraphitem">
												<editorproperties elementstodisplay="5"/>
												<children>
													<content>
														<format datatype="int"/>
													</content>
												</children>
											</template>
										</children>
									</paragraph>
									<newline/>
									<paragraph paragraphtag="p">
										<styles padding-left="5%" padding-right="5%"/>
										<children>
											<text fixtext="Списъчни данни:">
												<styles font-size="15pt" font-weight="bold"/>
											</text>
											<text fixtext=" ">
												<styles font-size="15pt"/>
											</text>
										</children>
									</paragraph>
									<condition>
										<children>
											<conditionbranch xpath="count(  n1:ListData/n1:ListElement )  &gt; 0">
												<children>
													<template match="n1:ListData" matchtype="schemagraphitem">
														<editorproperties elementstodisplay="5"/>
														<children>
															<template match="n1:ListElement" matchtype="schemagraphitem">
																<editorproperties elementstodisplay="5"/>
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="string-length( . ) &gt; 0">
																				<children>
																					<paragraph paragraphtag="p">
																						<styles font-size="14pt" font-weight="bold" padding-left="7%" padding-right="5%"/>
																						<children>
																							<text fixtext="Елемент на списъка ">
																								<styles font-size="13pt" font-weight="bold"/>
																							</text>
																							<autocalc xpath="position()">
																								<styles font-weight="bold"/>
																								<format string="0" datatype="integer"/>
																							</autocalc>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Начална дата на валидност:">
																								<styles font-weight="bold"/>
																							</text>
																							<text fixtext=" "/>
																							<template match="n1:DateFrom" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format string="DD.MM.YYYY" datatype="date"/>
																									</content>
																									<button>
																										<action>
																											<datepicker/>
																										</action>
																									</button>
																								</children>
																							</template>
																							<text fixtext=" г."/>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Крайна дата на валидност:">
																								<styles font-weight="bold"/>
																							</text>
																							<text fixtext=" "/>
																							<template match="n1:DateTo" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format string="DD.MM.YYYY" datatype="date"/>
																									</content>
																									<button>
																										<action>
																											<datepicker/>
																										</action>
																									</button>
																								</children>
																							</template>
																							<text fixtext=" г."/>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Брой: ">
																								<styles font-weight="bold"/>
																							</text>
																							<template match="n1:Count" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format datatype="int"/>
																									</content>
																								</children>
																							</template>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Община:">
																								<styles font-weight="bold"/>
																							</text>
																							<text fixtext=" "/>
																							<template match="n1:Minucipality" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format datatype="string"/>
																									</content>
																								</children>
																							</template>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Област:">
																								<styles font-weight="bold"/>
																							</text>
																							<text fixtext=" "/>
																							<template match="n1:Area" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format datatype="string"/>
																									</content>
																								</children>
																							</template>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Град:">
																								<styles font-weight="bold"/>
																							</text>
																							<text fixtext=" "/>
																							<template match="n1:Town" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format datatype="string"/>
																									</content>
																								</children>
																							</template>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Район:">
																								<styles font-weight="bold"/>
																							</text>
																							<text fixtext=" "/>
																							<template match="n1:District" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format datatype="string"/>
																									</content>
																								</children>
																							</template>
																						</children>
																					</paragraph>
																					<paragraph paragraphtag="p">
																						<styles padding-left="9%" padding-right="5%"/>
																						<children>
																							<text fixtext="Адрес:">
																								<styles font-weight="bold"/>
																							</text>
																							<text fixtext=" "/>
																							<template match="n1:Address" matchtype="schemagraphitem">
																								<editorproperties elementstodisplay="5"/>
																								<children>
																									<content>
																										<format datatype="string"/>
																									</content>
																								</children>
																							</template>
																						</children>
																					</paragraph>
																				</children>
																			</conditionbranch>
																			<conditionbranch/>
																		</children>
																	</condition>
																</children>
															</template>
														</children>
													</template>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<text fixtext="Няма информация"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<newline/>
									<newline/>
								</children>
							</template>
							<newline/>
						</children>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<pagelayout/>
	<designfragments/>
</structure>


```


`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\Transformations\ExampleRequest.xslt`

```cs

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

```





`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\Transformations\ExampleResponse.xml`

```cs



```

`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSchemas\RegiX.**Name**Adapter\Transformations\ExampleResponse.xslt`

`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLMetaData\RegiX.**Name**Adapter\Example.xml`

`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSamples\RegiX.**Name**Adapter\ExampleRequest.xml`
`RegiX.**Name**Adapter\RegiX.**Name**Adapter\XMLSamples\RegiX.**Name**Adapter\ExampleResponse.xml`



* ExampleRequest.xsd

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://egov.bg/RegiX/DaeuTest/ExampleRequest" targetNamespace="http://egov.bg/RegiX/DaeuTest/ExampleRequest" elementFormDefault="qualified" attributeFormDefault="unqualified">
  <xs:element name="ExampleRequest">
    <xs:annotation>
      <xs:documentation>Аргумент на примерна операция</xs:documentation>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element name="Identifier" type="xs:string">
          <xs:annotation>
            <xs:documentation>Идентификатор</xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element name="DateFrom" type="xs:dateTime" minOccurs="0">
          <xs:annotation>
            <xs:documentation>От дата</xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element name="DateTo" type="xs:dateTime" minOccurs="0">
          <xs:annotation>
            <xs:documentation>До дата</xs:documentation>
          </xs:annotation>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

* ExampleResponse.xsd
```xml


