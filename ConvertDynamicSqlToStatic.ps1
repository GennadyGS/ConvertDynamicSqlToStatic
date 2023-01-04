$regex = "(?s)^exec sp_executesql N'(?<query>.*?[^'])'(?:,N'(?<decls>.*?[^'])',(?<sets>.*))?$"

$inputText = [string](Get-Clipboard)
if (!($inputText -match $regex)) {
    return
}

$resultBuilder = [System.Text.StringBuilder]::new()
if ($matches["decls"]) {
    $resultBuilder.AppendLine("DECLARE $($matches["decls"])")
    $matches["sets"].Split(',') | ForEach-Object {
        $resultBuilder.AppendLine("SET $_");
    }
}
$resultBuilder.AppendLine($matches["query"].Replace("''", "'"));
Set-Clipboard $resultBuilder.ToString()
