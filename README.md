# Примерна реализация на адаптер
Настоящият документ описва разработката на примерен адаптер с име Reference от компанията Contoso.

## Съдържание

<!-- TOC -->
- [Изграждане на основна структура](#реализация)
- [Адрес на услугата](#адрес-на-услугата)
<!-- /TOC -->


## 1. Изграждане на основната структура на проекти
В настоящата инструкция, за разработка на адаптерите се използва .NET Framework. Създават се три проекта със следните типове и примерни имена:

* 1. RegiX.**Name**Adapter с тип Class Library (.NET Standard)
[//]: # (5.1. -- 5.1.5.)
* 2. RegiX.**Name**Adapter.Mock с тип Class Library (.NET Standard)
[//]: # (5.2.)
* 3. RegiX.**Name**Adapter.Test с тип MSTest Test Project (.NET Core)
 [//]: # (5.3.)
Премахват се автоматично създадените класове за всеки от създадените проекти.

### 1.1. Промяна на DefaultNamespace
Променя се DefaultNamespace, така че да съдържат името на компанията разработчик:
  * **Company**.RegiX.**Name**Adapter
  * **Company**.RegiX.**Name**Adapter.Mock
  * **Company**.RegiX.**Name**Adapter.Test
Структурата на Namespace е: **Company**.RegiX.**Name**Adapter
  Пример: Contoso.Regix.ReferenceAdapter
Редактира се описанието на информацията за разработчик на проекта: auhtor, company, description.




* Добавяне на описание включващо необходими файлове в доставяния пакет:
* RegiX.ReferenceAdapter проектът - RegiX.RegiX.DaeuTestAdapter Adapter 
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
кода се добавя между </PropertyGroup> и </Project>


* RegiX.ReferenceAdapter.Mock проектът - RegiX.DaeuTestAdapter.Mock 
```xml
  <ItemGroup>
    <Content Include="XMLData\*\*.xml">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
  </ItemGroup>
```
кода се добавя между </PropertyGroup> и </Project>

Създават се .nuspec файлове чрез изпълнението на `nuget spec` в директориите на **RegiX.ReferenceAdapter** и **RegiX.ReferenceAdapter.Mock** проектите. Съдържанието на .nuspec файловете се променя спрямо описанието -> в стандарта за разработка на адаптери. С дясно копче на проектаи зпълнява се open folder in file explorer  на проекта и после в директорията десен бутон open in visual studio. 
->От директорята натиска се shift + дясно копче на мишката за да се визуализира Open powershell window here избира се и се изписва командата nuget spec
-> PS C:\Users\ismolenov\source\repos\RegiX.DaeuTestAdapter\RegiX.DaeuTestAdapter> C:\Nuget\nuget spec  (като нугет е изтеглен в папка нугет в директоря C:\  итехлен е от адрес:https://docs.microsoft.com/en-us/nuget/install-nuget-client-tools  по този начин се описва пътя къде да се качи C:\Users\ismolenov\source\repos\RegiX.DaeuTestAdapter\RegiX.DaeuTestAdapter> от къде да вземе файла нугет C:\Nuget и се изпълнява командата nuget spec) 
->изтриват се следните тагове в създадените nus spec файловете (RegiX.DaeuTestAdapter.nuspec, RegiX.DaeuTestAdapter.Mock.nuspec): <licenceURL>, <projectURL>, <iconURL>,<copyright2020>, <tags> от RegiX.DaeuTestAdapter и RegiX.DaeuTestAdapter.Mock
-> properties на първия RegiX.DaeuTestAdapterи Package от лява в менюто попълват се необходимите данни : имена на (Autor, company, Description) в описаните полоета. Същото и за DAEU.RegiX.DaeuTestAdapter.Mock

-> Следва създаване на самата структура



Създават се следните папки:
* AdapterService
* APIService
* XMLMetaData\RegiX.ReferenceAdapter - XMLMetaData\RegiX.DaeuTestAdapter
* XMLSamples\RegiX.ReferenceAdapter - XMLSamples\RegiX.DaeuTestAdapter
* XMLSchemas\RegiX.ReferenceAdapter - XMLSchemas\RegiX.DaeuTestAdapter
->open folder in file explorer на RegiX.DaeuTestAdapter -> Open powershell window here -> пред всяко се слага mkdir команда и се изпълнява в poweshell ()
->RegiX.DaeuTestAdapter ->dependencies -> десен бутон Menage Nuget Packeges(]ще се добавят необходимите пакети, съдържащи стандартна функционалност, която могат да преизползват всичките адаптери) 



Добавяне на референция към **RegiX.Adapters.Common** в проект RegiX.ReferenceAdapter - RegiX.DaeuTestAdapter
Добавяне на референция към **RegiX.Adapters.Mocks** в проект RegiX.ReferenceAdapter.Mock - RegiX.DaeuTestAdapter.Mock
Добавяне на референция към **RegiX.Adapters.TestUtils** в проект RegiX.ReferenceAdapter.Test
->Пакетите се вземат от предоставените от Технологика файлове. -> Tools -> Nuget Package Manager -> Package Manager Settings -> От менюто в ляво Nuget Package Manager и от доло Package Sources -> "+" -> Name(име на проекта например local source) -> избираме файла от предоставените от Технологика (regix.adapters.common.1.0.55.nupkg) намиращ се в папка RegiX.SampleAdapter (тук се описва пътя и папката файла се зарежда в последствие).NetCoreHost. 
-> зарежадне на файла -> в проект RegiX.DaeuTestAdapter от менюто в дясно се избира Dependencies -> десен бутон Manager Nuget Packages -> горе в дясно на   Package sourceс от падащото меню се избира ме на проекта например local source и след това в ляво горе в търсачката се избира референция към RegiX.Adapters.Common. -> натиска се на него и след като се появи в дясно  се натиска instal

Създават се следните файлове спрямо описанието в стандарта за раработка на адаптери:
* AdapterService\IReferenceAdapter.cs -AdapterService\IDaeuTestAdapter.cs
* AdapterService\ReferenceAdapter.cs - AdapterService\DaeuTestAdapter.cs
* APIService\IReferenceAPI.cs - APIService\IDaeuTestAPI.cs
* APIService\ReferenceAPI.cs - APIService\DaeuTestAPI.cs

Добавяне на схеми/примерни XML файлове/метаданни/ трансформации:
* XMLMetaData\RegiX.ReferenceAdapter\Example.xml
* XMLSamples\RegiX.ReferenceAdapter\ExampleRequest.xml
* XMLSamples\RegiX.ReferenceAdapter\ExampleResponse.xml
* XMLSchemas\RegiX.ReferenceAdapter\ExampleRequest.designer.cs
* XMLSchemas\RegiX.ReferenceAdapter\ExampleRequest.xsd
* XMLSchemas\RegiX.ReferenceAdapter\ExampleResponse.designer.cs
* XMLSchemas\RegiX.ReferenceAdapter\ExampleResponse.xsd
* XMLSchemas\RegiX.ReferenceAdapter\Transformations\ExampleRequest.sps
* XMLSchemas\RegiX.ReferenceAdapter\Transformations\ExampleRequest.xslt
* XMLSchemas\RegiX.ReferenceAdapter\Transformations\ExampleResponse.sps
* XMLSchemas\RegiX.ReferenceAdapter\Transformations\ExampleResponse.xml
* XMLSchemas\RegiX.ReferenceAdapter\Transformations\ExampleResponse.xslt

Добавяне на тестове в RegiX.ReferenceAdapter.Test проекта:
* ReferenceAdapterAPITest.cs
* ReferenceAdapterMockTest.cs
* ReferenceTests.cs

# Hosting

## NetCore Host -  RegiX.ReferenceAdapter.NetCoreHost

Създаване на .NET Core конзолно приложение
Добавяне на nuget пакети:
* RegiX.ReferenceAdapter
* RegiX.Adapters.NetCoreAdapterHost
* RegiX.Adapters.NetCoreParameterStore
* RegiX.SecureBlackBox.CertFinder.File
* RegiX.SecureBlackBoxSigner.NetCore

Добавяне на стартиращия код: 
```csharp
using Microsoft.AspNetCore.Hosting;
using Host = TechnoLogica.RegiX.Adapters.NetCoreAdapterHost;

namespace RegiX.ReferenceAdapter.NetCoreHost
{
    class Program
    {
        static void Main(string[] args)
        {
            Host.Program.CreateWebHostBuilder(args).Build().Run();
        }
    }
}
```

Добавя се сертификат за подписване в pfx формат - `RegiX3Certificate.pfx`.

Добавя се конфигурационне файл App.config:
```xml
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
  <appSettings>
    <add key="SignResponse" value="true" />
    <add key="CertificateFile" value="RegiX3Certificate.pfx" />
    <add key="CertificatePassword" value="****" />    
    <add key="TimestampServer" value="http://tsa.swisssign.net" />
    <add key="SecureBlackBoxLicenseKey" value="****" />
  </appSettings>
</configuration>
```

## WCF Host - RegiX.ReferenceAdapter.WCFAdapterHost

Създаване на WCF Service Application
Премахват се създадените услуга 

Добавят се следните референции:
RegiX.Adapters.WCFAdapterHost
RegiX.Adapters.ConfigParameterStore
RegiX.SecureBlackBoxSigner
RegiX.SecureBlackBox.CertFinder.WinStore
RegiX.ReferenceAdapter
