
function Find-MSSecurityUpdate
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [ValidateSet("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")]
        [string]
        $Month,
        
        [Parameter(Mandatory)]
        [ValidateScript({$_ -match "\d{4}"})]
        [string]
        $Year,
        
        [string]
        $ApiKey
    )

    $Month = (Get-Culture).TextInfo.ToTitleCase($Month)
    $BaseUrl = 'https://api.msrc.microsoft.com'
    $Splat = @{
        Uri         = "$BaseUrl/cvrf/$Year-$Month`?api-Version=2016"
        Headers     = @{'Api-Key' = $ApiKey}
        ContentType = "application/json"
    }

    try
    {
        $Result = Invoke-RestMethod @Splat -ErrorAction Stop

        $Products = $Result.ProductTree.FullProductName
        
        $Result.Vulnerability | ForEach-Object {
            [PSCustomObject]@{
                Title         = $_.title.Value
                Notes         = $_.Notes.Value
                CVE           = $_.CVE
                CVSSScoreSets = $_.CVSSScoreSets
                Remediations  = $_.Remediations | foreach {
                    [PSCustomObject]@{
                        Product       = $Products | Where productid -eq $_.ProductId | select -exp value
                        ID            = $_.Description.Value
                        Url           = $_.URL
                        DateSpecified = $_.DateSpecified
                        AffectedFiles = $_.AffectedFiles
                    }
                }
                Acknowledgments = $_.Acknowledgments | foreach {
                    [PSCustomObject]@{
                        Name = $_.Name.Value
                        Url  = $_.Url
                    }
                }
            }
        }
    }
    catch
    {
        Write-Error $_
    }
}
