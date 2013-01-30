# ---------------------------------------------------------------------------------------
$drives     = get-wmiobject win32_diskdrive
$emailfrom  = "DriveWatch"
$emailto    = ""
$subject    = "ERROR!"
$body       = ""
$SMTPServer = "smtp.gmail.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
# ---------------------------------------------------------------------------------------
$SMTPClient.EnableSsl   = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($username, $password)
# ---------------------------------------------------------------------------------------
$error = $false
# ---------------------------------------------------------------------------------------
foreach($drive in $drives) 
{
  if($drive.status -ne "OK") 
  {
    $error      = $true
    $partitions = $drive.getrelated("Win32_DiskPartition")
    $body       = "The following partitions have drives that are not ok: `n`n"		
    foreach($partition in $partitions) 
    {
      $letter = $partition.getrelated("Win32_LogicalDisk")
      foreach($l in $letter) 
      { 
        $body += "`t" + $l.caption
      }
    }
  }
  $body += "`n"
}
# ---------------------------------------------------------------------------------------
if($error) 
{
  $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
}
# ---------------------------------------------------------------------------------------
