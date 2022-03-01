handle64 -a -p wechat.exe wechat |  select-string -Pattern '(_wechat_app|WeChat_GlobalConfig_Multi_Process_Mutex)'| %{Invoke-Expression $( $_ -replace '.*?pid:\s*(\d+).+Mutant\s+([A-F0-9]+):.+','handle64  -p $1 -c $2 -y')}
write-host 'ok, open next wechat now'
