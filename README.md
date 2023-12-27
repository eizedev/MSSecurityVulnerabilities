# MSSecurityVulnerabilities

A PowerShell module for retrieving information regarding Microsoft security vulnerabilities using the Security Updates API from https://portal.msrc.microsoft.com/en-us/developer

> As of `2021-02` the API Key is not needed anymore for the MSRC CVRF API, so it was removed from the code
>
> You will find the API documentation at https://api.msrc.microsoft.com/cvrf/v2.0/swagger/index
>
> There is also an official powershell module for the `2.0` REST API with additional functionallity available: https://github.com/microsoft/MSRC-Microsoft-Security-Updates-API
>
> This powershell module/code here in this repsitory only parses the resultend `vulnerabilities` from the api and output it in a specific way

## Examples

Below you will find some examples

### without API Key

```powershell
Find-MSSecurityVulnerabilities -Month Dec -Year 2023
```

Add `-Verbose` to get verbose output (f.e. url)

### only return Product Tree

```powershell
Find-MSSecurityVulnerabilities -Month Dec -Year 2023 -ReturnProductTree
```

Example result

```powershell
ProductID Value
--------- -----
10049     Windows Server 2008 R2 for x64-based Systems Service Pack 1 (Server Core installation)
10051     Windows Server 2008 R2 for x64-based Systems Service Pack 1
10287     Windows Server 2008 for 32-bit Systems Service Pack 2 (Server Core installation)
10378     Windows Server 2012
10379     Windows Server 2012 (Server Core installation)
10483     Windows Server 2012 R2
10543     Windows Server 2012 R2 (Server Core installation)
10729     Windows 10 for 32-bit Systems
10735     Windows 10 for x64-based Systems
10753     Microsoft Office 2016 (32-bit edition)
10754     Microsoft Office 2016 (64-bit edition)
10816     Windows Server 2016
10852     Windows 10 Version 1607 for 32-bit Systems
10853     Windows 10 Version 1607 for x64-based Systems
10855     Windows Server 2016 (Server Core installation)
11568     Windows 10 Version 1809 for 32-bit Systems
11569     Windows 10 Version 1809 for x64-based Systems
11570     Windows 10 Version 1809 for ARM64-based Systems
11571     Windows Server 2019
11572     Windows Server 2019 (Server Core installation)
11573     Microsoft Office 2019 for 32-bit editions
11574     Microsoft Office 2019 for 64-bit editions
11655     Microsoft Edge (Chromium-based)
11664     Microsoft Dynamics 365 (on-premises) version 9.0
11762     Microsoft 365 Apps for Enterprise for 32-bit Systems
11763     Microsoft 365 Apps for Enterprise for 64-bit Systems
11921     Microsoft Dynamics 365 (on-premises) version 9.1
11923     Windows Server 2022
11924     Windows Server 2022 (Server Core installation)
11926     Windows 11 version 21H2 for x64-based Systems
11927     Windows 11 version 21H2 for ARM64-based Systems
11929     Windows 10 Version 21H2 for 32-bit Systems
11930     Windows 10 Version 21H2 for ARM64-based Systems
11931     Windows 10 Version 21H2 for x64-based Systems
11951     Microsoft Office LTSC for Mac 2021
11952     Microsoft Office LTSC 2021 for 64-bit editions
11953     Microsoft Office LTSC 2021 for 32-bit editions
12085     Windows 11 Version 22H2 for ARM64-based Systems
12086     Windows 11 Version 22H2 for x64-based Systems
12097     Windows 10 Version 22H2 for x64-based Systems
12098     Windows 10 Version 22H2 for ARM64-based Systems
12099     Windows 10 Version 22H2 for 32-bit Systems
12143     Azure DevOps Server 2020.1.2
12183     Microsoft Malware Protection Platform
12228     Azure Logic Apps
12242     Windows 11 Version 23H2 for ARM64-based Systems
12243     Windows 11 Version 23H2 for x64-based Systems
12244     Windows Server 2022, 23H2 Edition (Server Core installation)
12263     Microsoft Power Platform
12264     Azure Connected Machine Agent
12266     Azure Machine Learning SDK
12267     Dynamics 365 for Finance and Operations Version 10.0.37 Platform Update 61
12268     Dynamics 365 for Finance and Operations Version 10.0.38 Platform Update 62
12269     Dynamics 365 for Finance and Operations Platform Update 60
12270     Azure DevOps Server 2022.1
9312      Windows Server 2008 for 32-bit Systems Service Pack 2
9318      Windows Server 2008 for x64-based Systems Service Pack 2
9344      Windows Server 2008 for x64-based Systems Service Pack 2 (Server Core installation)
```

## Contribution

Thanks [@opexxx](https://github.com/opexxx) for the initial version and idea

