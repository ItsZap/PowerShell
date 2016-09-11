#$targetXml = "C:\temp\detikcom_nasional.xml"
$detikLink = "C:\temp\detiklink.txt"

$targetRSS = "detikcom_nasional", "detikcom_internasional", "detikcom_bbc","detikcom_lapsus","detikcom_wawancara"," detikcom_prokontra"

Remove-Item $detikLink -Force -ErrorAction Ignore

$targetRSS |% {

   $url = "http://rss.detik.com/index.php/" + $_
   $targetXml = "C:\temp\" + $_ + ".xml"

   Invoke-WebRequest -Uri $url -OutFile $targetXml -ErrorAction Stop

   [xml]$Content = gc $targetXml
   $Feed = $Content.rss.channel

   $Feed.Item |% {
   $msg = $_

  # $Description = ($msg.description).Substring(0,($msg.description).IndexOf('<BR>'))

    Write-host $msg.link
    Add-Content $detikLink $msg.link


   }
}






