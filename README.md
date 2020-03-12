# Примерна реализация на адаптер
Настоящият документ описва стъпките за разработката на примерен адаптер за RegiX.

## Съдържание

<!-- TOC -->
- [Изграждане на основна структура](#основна-структура)
- [Адрес на услугата](#адрес-на-услугата)
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

### 1.2. Добавяне на описание на файлове в доставяния пакет:
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

Придобиването на необходимите пакети за работата на адаптера може да стане по следните начини:
* Изтеглянето им на локалната машина и посочването на пътя към тях, което става по следния начин:
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
