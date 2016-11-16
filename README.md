# MSSecurityUpdate
A PowerShell module for retrieving information regarding Microsoft security updates using the Security Updates API Preview

https://portal.msrc.microsoft.com/en-us/developer

You'll need to sign in and retrieve your API key in order to make calls using this module.

### Example
$Key = 'fe6ff006ada446a2bc9250b242d0cf78'
Find-MSSecurityUpdate -Month Sep -Year 2016 -ApiKey $Key
