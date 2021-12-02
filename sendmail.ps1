
[CmdletBinding()]
param (
    [Parameter(ValueFromRemainingArguments=$true)]
    $Attachments  = $null,
    $Bcc = $null,
    $Body = $null,
    $BodyAsHtml = $null,
    $Encoding  = $null,
    $Cc  = $null,
    $DeliveryNotificationOption  = $null,
    $From  = $null,
    $SmtpServer = 'smtp.sendgrid.net',
    $Priority = $null,
    $ReplyTo = $null,
    $Subject = $null,
    [String[]]$To = $null,
    #$Credential = $null,
    $UseSsl = $null,
    $Port  = 587
)
$p = APIKEY.FOR.SENDGRID |ConvertTo-SecureString -AsPlainText -Force
$u = 'apikey'
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $u, $p

$mailParams=@{}

If($Attachments -ne $null){
    $mailParams.Add('Attachments',$Attachments)
}
If($Body -ne $null){
    $mailParams.Add('$Body',$body)
}
If($BodyAsHtml -ne $null){
    $mailParams.Add('$BodyAsHtml', $BodyAsHtml)
}
If($Encoding  -ne $null){
    $mailParams.Add('Encoding',$Encoding)
}
If($Cc  -ne $null){
    $mailParams.Add('Cc',$Cc)
}
If($DeliveryNotificationOption  -ne $null){
    $mailParams.Add('DeliveryNotificationOption',$DeliveryNotificationOption)
}
If($From  -ne $null){
    $mailParams.Add('From',$From)
}
If($SmtpServer -ne $null){
    $mailParams.Add('SmtpServer',$SmtpServer)
}
If($Priority -ne $null){
    $mailParams.Add('Priority',$Priority)
}
If($ReplyTo -ne $null){
    $mailParams.Add('ReplyTo',$ReplyTo)
}
If($Subject -ne $null){
    $mailParams.Add('Subject',$Subject)
}
If($To -ne $null){
    $mailParams.Add('To',$To)
}
If($Credential -ne $null){
    $mailParams.Add('Credential',$Credential)
}
If($UseSsl -ne $null){
    $mailParams.Add('UseSsl',$UseSsl)
}
If($Port -ne $null){
    $mailParams.Add('Port',$Port)
}
$ErrorActionPreference = 'stop'

try{
    Send-MailMessage @mailParams
    $mailParams
}
catch{
    Write-Host 'Fail'
    $mailParams

}