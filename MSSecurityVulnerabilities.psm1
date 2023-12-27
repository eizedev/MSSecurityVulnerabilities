function Find-MSSecurityVulnerabilities {
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [ValidateSet('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')]
        [string]
        $Month,

        [Parameter(Mandatory)]
        [ValidateScript({ $_ -match '\d{4}' })]
        [string]
        $Year,

        [switch]
        $ReturnProductTree
    )

    $Month = (Get-Culture).TextInfo.ToTitleCase($Month)
    $BaseUrl = 'https://api.msrc.microsoft.com'
    $Splat = @{
        Uri         = "$BaseUrl/cvrf/$Year-$Month`?api-Version=2016"
        ContentType = 'application/json'
    }

    Write-Verbose "Using uri: $($Splat.Uri)"

    try {
        $Result = Invoke-RestMethod @Splat -ErrorAction Stop

        if ($ReturnProductTree) {
            $Products = $Result.ProductTree.FullProductName
            return $Products
        }

        $Result.Vulnerability | ForEach-Object {
            [PSCustomObject]@{
                Title                  = $_.title.Value
                NotesValue             = $_.Notes.Value
                Notes                  = $_.Notes | ForEach-Object {
                    [PSCustomObject]@{
                        Title   = $_.Title
                        Type    = $_.Type
                        Ordinal = $_.Ordinal
                        Value   = $_.Value
                    }
                }
                CVE                    = $_.CVE
                CVSSScoreSets          = $_.CVSSScoreSets | ForEach-Object {
                    [PSCustomObject]@{
                        ProductId     = $Products | Where-Object ProductId -EQ $_.ProductId | Select-Object -exp ProductId
                        Product       = $Products | Where-Object ProductId -EQ $_.ProductId | Select-Object -exp value
                        BaseScore     = $_.BaseScore
                        TemporalScore = $_.TemporalScore
                        Vector        = $_.Vector
                    }
                }
                Remediations           = $_.Remediations | ForEach-Object {
                    [PSCustomObject]@{
                        ProductId       = $Products | Where-Object ProductId -EQ $_.ProductId | Select-Object -exp ProductId
                        Product         = $Products | Where-Object ProductId -EQ $_.ProductId | Select-Object -exp value
                        Description     = $_.Description.Value
                        Type            = $_.Type
                        Url             = $_.URL
                        DateSpecified   = $_.DateSpecified
                        RestartRequired = $_.RestartRequired.Value
                        SubType         = $_.SubType
                        FixedBuild      = $_.FixedBuild
                    }
                }
                Acknowledgments        = $_.Acknowledgments | ForEach-Object {
                    [PSCustomObject]@{
                        Name = $_.Name.Value
                        Url  = $_.Url
                    }
                }
                DiscoveryDateSpecified = $_.DiscoveryDateSpecified
                ReleaseDateSpecified   = $_.ReleaseDateSpecified
                Ordinal                = $_.Ordinal
                ProductStatuses        = $_.ProductStatuses | ForEach-Object {
                    [PSCustomObject]@{
                        ProductId = $_.ProductID | ForEach-Object { [PSCustomObject]@{ ProductId = $Products | Where-Object ProductId -EQ $_ | Select-Object -exp ProductId } }
                        Product   = $_.ProductID | ForEach-Object { [PSCustomObject]@{ Product = $Products | Where-Object ProductId -EQ $_ | Select-Object -exp Value } }
                        Type      = $_.Type
                    }
                }
                RevisionHistory        = $_.RevisionHistory | ForEach-Object {
                    [PSCustomObject]@{
                        Number      = $_.Number
                        Date        = $_.Date
                        Description = $_.Description.Value
                    }
                }
                Threats                = $_.Threats | ForEach-Object {
                    [PSCustomObject]@{
                        ProductId     = $Products | Where-Object ProductId -EQ $_.ProductId | Select-Object -exp ProductId
                        Product       = $Products | Where-Object ProductId -EQ $_.ProductId | Select-Object -exp value
                        Type          = $_.Type
                        DateSpecified = $_.DateSpecified
                        Description   = $_.Description.Value
                    }
                }
            }
        }
    }
    catch {
        Write-Error $_
    }
}
