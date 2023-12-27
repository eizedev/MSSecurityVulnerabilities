# MSSecurityVulnerabilities

A PowerShell module for retrieving information regarding Microsoft security vulnerabilities using the Security Updates API from https://portal.msrc.microsoft.com/en-us/developer

> As of `2021-02` the API Key is not needed anymore for the MSRC CVRF API, so it was removed from the code
>
> You will find the API documentation at https://api.msrc.microsoft.com/cvrf/v2.0/swagger/index
>
> There is also an official powershell module for the `2.0` REST API with additional functionallity available: [MSRC-Microsoft-Security-Updates-API](https://github.com/microsoft/MSRC-Microsoft-Security-Updates-API)
>
> This powershell module/code here in this repository only parses the resultend `vulnerabilities` from the api and output it in a specific way
>
> A comparable command that outputs the raw information with the official module would be `$cvrfDoc = Get-MsrcCvrfDocument -ID 2023-Dec -Verbose`.  
> For this you will need to install the official module first (not needed here for the `Find-MSSecurityVulnerabilities` function).

## Examples

Below you will find some examples

### without API Key

```powershell
Find-MSSecurityVulnerabilities -Month Dec -Year 2023
```

Add `-Verbose` to get verbose output (f.e. url)

Example result:

```powershell
Title                  : Chromium: CVE-2023-6508 Use after free in Media Stream
Notes                  : {@{Title=Description; Type=2; Ordinal=0; Value=<p>This CVE was assigned by Chrome.  Microsoft Edge (Chromium-based) ingests Chromium, which addresses this
                         vulnerability. Please see <a href="https://chromereleases.googleblog.com/2023">Google Chrome Releases</a> for more information.</p>
                         }, @{Title=FAQ; Type=4; Ordinal=10; Value=<p><strong>Why is this Chrome CVE included in the Security Update Guide?</strong></p>
                         <p>The vulnerability assigned to this CVE is in Chromium Open Source Software (OSS) which is consumed by Microsoft Edge (Chromium-based). It is being documented in
                         the Security Update Guide to announce that the latest version of Microsoft Edge (Chromium-based) is no longer vulnerable.</p>
                         <p><strong>How can I see the version of the browser?</strong></p>
                         <ol>
                         <li>In your Microsoft Edge browser, click on the 3 dots (...) on the very right-hand side of the window</li>
                         <li>Click on <strong>Help and Feedback</strong></li>
                         <li>Click on <strong>About Microsoft Edge</strong></li>
                         </ol>
                         }, @{Title=FAQ; Type=4; Ordinal=10; Value=<p><strong>What is the version information for this release?</strong></p>
                         <table>
                         <thead>
                         <tr>
                         <th>Microsoft Edge Version</th>
                         <th>Date Released</th>
                         <th>Based on Chromium Version</th>
                         </tr>
                         </thead>
                         <tbody>
                         <tr>
                         <td>120.0.2210.61</td>
                         <td>12/7/2023</td>
                         <td>120.0.6099.62/.63</td>
                         </tr>
                         </tbody>
                         </table>
                         }, @{Title=Microsoft Edge (Chromium-based); Type=7; Ordinal=20; Value=Microsoft Edge (Chromium-based)}…}
CVE                    : CVE-2023-6508
CVSSScoreSets          :
Remediations           : @{ProductId=11655; Product=Microsoft Edge (Chromium-based); Description=Release Notes; Type=2; Url=; DateSpecified=False; RestartRequired=No; SubType=Security
                         Update; FixedBuild=120.0.2210.61}
Acknowledgments        :
DiscoveryDateSpecified : False
ReleaseDateSpecified   : False
Ordinal                : 39
ProductStatuses        : @{ProductId=; Product=; Type=3}
RevisionHistory        : @{Number=1.0; Date=07.12.2023 18:58:56; Description=<p>Information published.</p>
                         }
Threats                : {@{ProductId=11655; Product=Microsoft Edge (Chromium-based); Type=0; DateSpecified=False; Description=}, @{ProductId=11655; Product=Microsoft Edge (Chromium-based);
                         Type=3; DateSpecified=False; Description=}, @{ProductId=; Product=; Type=1; DateSpecified=False; Description=DOS:N/A}}
```

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

