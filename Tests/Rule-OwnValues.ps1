# What only this mod asserts: the counts of the ported genes, the packageId and dependencies, the shipped assembly,
# the player pawn kinds and creepjoiner forms, the longevity factor and the patch files.
# The generic checks (XML, defNames, About.xml shape, textures, translation coverage) are the shared scripts', run by Test-Mod.ps1.
# Takes -ModRoot (repository root) and -SharedDir (unused, kept for the Test-Mod.ps1 contract); prints findings, exits 1 on any.
param([string]$ModRoot = (Join-Path $PSScriptRoot '..'), [string]$SharedDir)
$ErrorActionPreference = 'Stop'
$ModRoot = (Resolve-Path -LiteralPath $ModRoot).Path
$mod = Join-Path $ModRoot 'Mod'
$script:findings = New-Object System.Collections.Generic.List[string]
function Assert-True($Condition, [string]$Message) { if (-not $Condition) { $script:findings.Add("FAIL: $Message") } }

$defs = New-Object System.Xml.XmlDocument
$defs.LoadXml('<Defs/>')
foreach ($file in Get-ChildItem (Join-Path $mod 'Defs') -Recurse -Filter *.xml -File) {
    $xml = New-Object System.Xml.XmlDocument
    $xml.Load($file.FullName)
    foreach ($node in $xml.SelectNodes('/Defs/*')) { [void]$defs.DocumentElement.AppendChild($defs.ImportNode($node, $true)) }
}
function Count-Genes([string]$Prefix) { @($defs.SelectNodes('/Defs/GeneDef[defName]') | Where-Object { $_.defName -clike "$Prefix*" }).Count }

$meta = [xml](Get-Content (Join-Path $mod 'About/About.xml') -Raw)
Assert-True ($meta.ModMetaData.packageId -ceq 'nelim.serenbiotechextended') 'packageId'
Assert-True ($meta.ModMetaData.name -ceq 'Seren Biotech Extended') 'name'
Assert-True (@($meta.ModMetaData.supportedVersions.li) -contains '1.6') 'RimWorld 1.6 declared'
$deps = @($meta.ModMetaData.modDependencies.li.packageId)
foreach ($d in 'odysseylotus.serenbiotech', 'Ludeon.RimWorld.Biotech', 'OskarPotocki.VanillaFactionsExpanded.Core', 'brrainz.harmony') {
    Assert-True ($deps -contains $d) "Hard dependency $d"
}
Assert-True ($deps.Count -eq 4) 'Four hard dependencies'
Assert-True (@($meta.ModMetaData.loadAfter.li) -contains 'odysseylotus.serenbiotech') 'Loads after the Biotech fork'
Assert-True (Test-Path (Join-Path $mod 'Assemblies/SerenBiotechExtended.dll')) 'Tinting assembly shipped'
Assert-True (-not (Test-Path (Join-Path $mod 'LoadFolders.xml'))) 'No LoadFolders.xml (single folder mod)'

Assert-True ((Count-Genes 'SerenOriginalMask_') -eq 12) 'Twelve body mask genes'
Assert-True ((Count-Genes 'SerenOriginalHorns_') -eq 8) 'Eight horn genes'
Assert-True ((Count-Genes 'SerenAccent_') -eq 12) 'Twelve accent colour genes'
Assert-True ((Count-Genes 'OL_SerenLongevity') -eq 1) 'One longevity gene'
Assert-True ((Count-Genes 'OL_SpaceBorn') -eq 1) 'One space-born gene'

$kinds = $defs.SelectNodes('/Defs/PawnKindDef[defName]')
Assert-True ($kinds.Count -eq 7) 'Seven player pawn kinds of the original scenarios'
$forms = @($defs.SelectNodes('/Defs/CreepJoinerFormKindDef[defName]'))
Assert-True ($forms.Count -eq 8) 'Eight Seren creepjoiner forms'

$longevity = Get-Content (Join-Path $mod 'Defs/GeneDefs_SerenLongevity.xml') -Raw
Assert-True ($longevity.Contains('0.214')) 'Longevity factor 0.214 documented in the def'

foreach ($patch in 'FaceSet_VTE.xml', 'SerenLongevity.xml', 'SerenSkinWeights.xml') {
    Assert-True (Test-Path (Join-Path $mod "Patches/$patch")) "Patch file $patch present"
}
foreach ($language in 'English', 'French') {
    Assert-True (Test-Path (Join-Path $mod "Languages/$language/Keyed/SerenBiotechExtended.xml")) "$language Keyed file present"
}

if ($script:findings.Count) { $script:findings; exit 1 }
Write-Output 'PASS: Rule-OwnValues'
