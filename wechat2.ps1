chcp 65001

handle64 -a -p wechat.exe wechat |  select-string -Pattern '(_wechat_app|WeChat_GlobalConfig_Multi_Process_Mutex)'| %{Invoke-Expression $( $_ -replace '.*?pid:\s*(\d+).+Mutant\s+([A-F0-9]+):.+','handle64  -p $1 -c $2 -y')}

write-host 'start wechat...'

$reg_key = 'HKCU:\SOFTWARE\Tencent\WeChat'
$default_path = Get-ItemPropertyvalue -Path $reg_key -Name InstallPath
$user='apphost'
$cmd = 'runas /user:$user /sa "$default_path\WeChat.exe"'
write-host $cmd
Invoke-Expression $cmd


