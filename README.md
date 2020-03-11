# Примерна реализация на адаптер
Настоящият документ описва стъпките за разработката на примерен адаптер за RegiX.

## Съдържание

<!-- TOC -->
- [Изграждане на основна структура](#основна-структура)
- [Адрес на услугата](#адрес-на-услугата)
<!-- /TOC -->


## 1. Изграждане на основна структура на проекти
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

### 1.3. Добавяне на зависимости чрез инсталация на Nuget пакети

#### 1.3.1. Създаване на nuspec файлове 

За работа по създадените проекти с Nuget Packet Manager, необходимо е да генерирате XML метаописания. В директориите на проектите RegiX.**Name**Adapter и RegiX.**Name**Adapter.Mock изпълнете командата `nuget spec`, за да създадете .nuspec файлове. Последна версия на nuget.exe ще откриете на адрес: https://www.nuget.org/downloads.

Редактирайте съдържанието на .nuspec файловете `RegiX.**Name**Adapter.nuspec` и `RegiX.**Name**Adapter.Mock`, като изтриете елементите `<licenceURL>, <projectURL>, <iconURL>,<copyright2020>, <tags>`.

#### 1.3.2. Разширяване структурата на проектите

В директорията на проект RegiX.**Name**Adapter, създайте следните поддиректории:
* AdapterService
* APIService
* XMLMetaData\RegiX.**Name**Adapter
* XMLSamples\RegiX.**Name**Adapter
* XMLSchemas\RegiX.**Name**Adapter

#### 1.3.3. Инсталиране на пакети

##### 1.3.3.1. Изтегляне на необходимите пакети, които ще бъдат инсталирани

Придобиването на необходимите пакети за работата на адаптера може да стане по следните начини:
* Изтеглянето им на локалната машина и посочването на пътя към тях, което става по следния начин:
  Добавете път към адрес на местоположение на Nuget пакети, като изберете Tools, Nuget Package Manager, Packet Manager Settings.
  От менюто в ляво се избира: Pacakage Sources. Добавянето на пътя към Nuget пакетите става чрез натискането на бутона плюс и след това попълването на Името и в полето Source се посочва пътя към пакетите. 

##### 1.3.3.2.
След задаване на адрес на хранилище с Nuget пакети, е необходимо те да бъдат инсталирани. За проектите добавете следните референции, като натиснете десен бутон върху името на проекта и изберете Manage NuGet Packages от контекстното меню:

* **RegiX.Adapters.Common** в проект RegiX.**Name**Adapter
* **RegiX.Adapters.Mocks** в проект RegiX.**Name**Adapter.Mock
* **RegiX.Adapters.TestUtils** в проект RegiX.**Name**Adapter.Test
