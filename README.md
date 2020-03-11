# Примерна реализация на адаптер
Настоящият документ описва разработката на примерен адаптер с име Reference от компанията Contoso.

## Съдържание

<!-- TOC -->
- [Изграждане на основна структура](#реализация)
- [Адрес на услугата](#адрес-на-услугата)
<!-- /TOC -->


## 1. Изграждане на основната структура на проекти
В настоящата инструкция, за разработка на адаптерите се използва .NET Framework. Създават се три проекта със следните типове и примерни имена:

* RegiX.**Name**Adapter с тип Class Library (.NET Standard)
[//]: # (5.1. -- 5.1.5.)
* RegiX.**Name**Adapter.Mock с тип Class Library (.NET Standard)
[//]: # (5.2.)
* RegiX.**Name**Adapter.Test с тип MSTest Test Project (.NET Core)
 [//]: # (5.3.)
Премахват се автоматично създадените класове за всеки от създадените проекти.

### 1.1. Промяна на DefaultNamespace
Променя се DefaultNamespace, така че да съдържат името на компанията разработчик:

  * **Company**.RegiX.**Name**Adapter
  * **Company**.RegiX.**Name**Adapter.Mock
  * **Company**.RegiX.**Name**Adapter.Test

Структурата на Namespace е: **Company**.RegiX.**Name**Adapter
Пример: Contoso.Regix.ReferenceAdapter

Редактирайте описанието на проекта (auhtor, company, description) като натиснете десен бутон на мишката върху името на проекта, изберете Properties и то менюто в ляво Package.

## 1.2. Добавяне на описание на файлове в доставяния пакет:
За всеки от проектите, натиснете върху наименованието му. Добавете кода между тагове `</PropertyGroup> и </Project>`:
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

## 1.3. Създаване на nuspec файлове 

За работа по създадените проекти с Nuget Packet Manager, необходимо е да генерирате XML метаописания. В директориите на проектите RegiX.**Name**Adapter и RegiX.**Name**Adapter.Mock изпълнете командата `nuget spec`, за да създадете .nuspec файлове. Последна версия на nuget.exe ще откриете на адрес: https://www.nuget.org/downloads.

 Редактирайте съдържанието на .nuspec файловете `RegiX.**Name**Adapter.nuspec` и `RegiX.**Name**Adapter.Mock`, като изтриете таговете `<licenceURL>, <projectURL>, <iconURL>,<copyright2020>, <tags>`.
