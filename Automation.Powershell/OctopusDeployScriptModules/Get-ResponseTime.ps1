function Get-ResponseTime{
    [CmdletBinding()]
    param(            
        [Parameter(Mandatory=$true)]
        [string]$inUrl,
        [Parameter(Mandatory=$true)]
        [int]$inRequests
    ) 

    
    if ($inUrl.StartsWith('http://') -or $inUrl.StartsWith('https://')){
        $url = $inUrl
    }else{
        $url = "http://" + $inUrl   
    }

    $count = 0
    while ($inRequests -gt $count) {
        try {
            [net.httpWebRequest]
            $req = [net.webRequest]::create($url)
            $req.method = "GET"
            $req.ContentType = "application/x-www-form-urlencoded"
            $req.TimeOut = 60000
        
            $start = get-date
            $res = $req.getResponse()
        
            $timetaken = ((get-date) - $start).TotalMilliseconds

            #Write-Output $res.Content
            Write-Host ("Status code: {0} Milliseconds: {1} ({2})" -f $res.StatusCode.value__, [int]$timetaken, $timetaken)
            $req = $null
            $res.Close()
            $res = $null
        } catch [Exception] {
            Write-Output -f $_.ToString()
            break;
        }
        $count++
        $req = $null

        Start-Sleep -Seconds 1
    }
}