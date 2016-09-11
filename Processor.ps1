$sourceCSV = "d:\Temp\src.csv"
$targetCSV = "d:\Temp\cleanSrc.csv"

(Import-Csv $sourceCSV -Header "url","Desc description","BodyText") |% {
    $_.BodyText = $_.BodyText -replace "\\n" , " "
    $_
} | Export-Csv $targetCSV -NoTypeInformation 

