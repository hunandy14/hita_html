# 產生日期格式
function NewDatetime {
    param (
        [string]$date = "",
        [string]$formatType = "yyyy-MM-dd HH:mm:ss"
    )
    # 未輸入日期則返回當前時間
    if ([string]::IsNullOrEmpty($date)) {
        $newDate = (Get-Date)
    }
    # 格式化日期
    else {
        $newDate = [DateTime]::ParseExact(
            $date.Trim(), $formatType,
            [CultureInfo]::InvariantCulture
        )
    }
    return $newDate
}
# 讀取檔案日期
function readFileDate {
    param (
        [string]$FileName
    )
    $file = Get-Item $FileName;
    Write-Host "建立日期" $file.CreationTime;     #建立日期
    Write-Host "修改日期" $file.LastWriteTime;    #修改日期
    Write-Host "存取日期" $file.LastAccessTime;   #存取日期
}
# 改變檔案日期
function ChangeFileDate {
    param (
        # [Parameter(Mandatory, Position=0)]
        [Parameter(Mandatory, Position=0)]
        [string]$FileName,
        [Parameter(ParameterSetName="setDetail")]
        [datetime]$CreationTime,
        [Parameter(ParameterSetName="setDetail")]
        [datetime]$LastWriteTime,
        [Parameter(ParameterSetName="setDetail")]
        [datetime]$LastAccessTime,
        [Parameter(ParameterSetName="setAll")]
        [datetime]$AllTime,
        [switch]$Preview
    )
    if ($AllTime) {
        $CreationTime   = $AllTime;
        $LastWriteTime  = $AllTime;
        $LastAccessTime = $AllTime;
    }
    
    $file = Get-Item $FileName
    if ($Preview) {
        Write-Host "[$FileName]"
        Write-Host "  " $file.CreationTime "-->" $CreationTime
        Write-Host "  " $file.LastWriteTime "-->" $LastWriteTime
        Write-Host  "  " $file.LastAccessTime "-->" $LastAccessTime
    } else {
        if ($CreationTime) {
            $file.CreationTime = $CreationTime; #建立日期
        } if ($LastWriteTime) {
            $file.LastWriteTime = $LastWriteTime; #修改日期
        } if ($LastAccessTime) {
            $file.LastAccessTime = $LastAccessTime; #存取日期
        }
    }
}


function GetFileItem {
    param (
        [Parameter(Mandatory, Position=0)]
        [string] $FilePath,
        [Parameter(ParameterSetName="FilterFile")]
        [string] $FilterFile,
        [Parameter(ParameterSetName="FilterDir")]
        [string] $FilterDir,
        [Parameter(ParameterSetName="Excludedir")]
        [string] $Excludedir
    )
    # 轉換檔案
    ###############################################################
    # 修復路徑
    $FilePath = $FilePath.TrimEnd('\')
    # 資料夾名稱
    $MainDirName = $FilePath.Substring($FilePath.LastIndexof("\")+1)
    # 獲取複製項目相對路徑
    if ($FilterFile) {
        $FileItem1 =  Get-ChildItem -Path $FilePath `
                        -Recurse -Include $FilterFile | Sort-Object
        return $FileItem1
    }
    # 搜索路徑字串
    if ($FilterDir) {
        $FileItem2 = ((Get-ChildItem -Recurse `
                        -Path $FilePath -Excludedir $ExcludeFile -File)`
                        -match "$FilterDir") | Sort-Object
        return $FileItem2
    }
    # 排除路徑字串
    if ($Excludedir) {
        $FileItem3 = ((Get-ChildItem -Recurse `
                        -Path $FilePath -Excludedir $ExcludeFile -File)`
                        -notmatch "$Excludedir") | Sort-Object
        return $FileItem2
    }
}
############################ 設置 ############################
cd $PSScriptRoot
[String]$name = "day35_1. hibernate第三天回顾与目标.avi"
[String]$date = "2021-05-12 12:00:00"


[String]$FilePath = "C:\Users\hunan\Downloads\"
[String]$FilterFile = @("*.avi")
[String]$FilterStr = "day35"
##############################################################
# $newDate = NewDatetime $date
$List = (GetFileItem $FilePath -FilterFile $FilterFile) -match $FilterStr
$List.FullName


# 單一檔案
# ChangeFileDate $name -LastWriteTime $newDate -Preview
# ChangeFileDate $name -AllTime $newDate -Preview


# 資料夾
# $fileList = GetFileItem $FilePath
foreach ($item in $fileList) {
    # ChangeFileDate $item.FullName -LastWriteTime $newDate -Preview
}
