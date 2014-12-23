$req = [system.Net.WebRequest]::Create("$Url")
try {
    $res = $req.GetResponse()
} catch [System.Net.WebException] {
    $res = $_.Exception.Response
}
$int = [int]$res.StatusCode
$status = $res.StatusCode
Write-Host "$int $status"

if ($int -ne 200){
    throw "Failed loading site"
}