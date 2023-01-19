# 使用Powershell脚本实现微信多开1


## 下载
#### 1. 下载脚本：[wechat2.ps1](https://github.com/evlon/wechat_more/raw/main/wechat2.ps1)  解压到 PATH环境变量所在的目录， 比如  C:\WINDOWS\ 目录
  

#### 2. 下载微软官方的handle64 [传送门(https://docs.microsoft.com/zh-cn/sysinternals/downloads/handle)](https://docs.microsoft.com/zh-cn/sysinternals/downloads/handle) 解压到 PATH环境变量所在的目录， 比如  C:\WINDOWS\ 目录

## 使用方法：

#### 1. 先打开一个微信。

#### 2. 打开 powershell , 键入 wechat2 
```
PS C:\Users\evlon> wechat2

Nthandle v4.22 - Handle viewer
Copyright (C) 1997-2019 Mark Russinovich
Sysinternals - www.sysinternals.com

  3E4: Mutant        \Sessions\1\BaseNamedObjects\_WeChat_App_Instance_Identity_Mutex_Name

Handle closed.

Nthandle v4.22 - Handle viewer
Copyright (C) 1997-2019 Mark Russinovich
Sysinternals - www.sysinternals.com

  75C: Mutant        \Sessions\1\BaseNamedObjects\WeChat_GlobalConfig_Multi_Process_Mutex

Handle closed.
ok, open next wechat now
```
### 3. 启动另一个微信。


# 免扫码登录自己的第二个微信
## 背景
微信支持了免扫码登录微信，我想让我的两个微信可以在电脑上都可以这样便捷的登录。

## 下面是方法：
#### 1. 下载微软官方的handle64 传送门：（https://docs.microsoft.com/zh-cn/sysinternals/downloads/handle）
注意解压到 PATH环境变量所在的目录， 比如  C:\WINDOWS\ 目录

#### 2. 新建一个Windows账户，名称为apphost。
使用 apphost 登录，确保可以成功运行微信。

#### 3. 新建一个PowerShell文件， 文件名随意，比如 wechat2.ps1
```
chcp 65001

handle64 -a -p wechat.exe wechat |  select-string -Pattern '(_wechat_app|WeChat_GlobalConfig_Multi_Process_Mutex)'| %{Invoke-Expression $( $_ -replace '.*?pid:\s*(\d+).+Mutant\s+([A-F0-9]+):.+','handle64  -p $1 -c $2 -y')}

write-host 'start wechat...'

$reg_key = 'HKCU:\SOFTWARE\Tencent\WeChat'
$default_path = Get-ItemPropertyvalue -Path $reg_key -Name InstallPath
$user='apphost'
$cmd = 'runas /user:$user /sa "$default_path\WeChat.exe"'
write-host $cmd
Invoke-Expression $cmd
```
####  4. 新建一个快捷方式， 让PowerShell可以执行wechat2.ps1
注意：第一次运行，需要输入账户 apphost 的密码， 以后会自动保存， 就不用输入了。

## 最终效果
桌面两个快捷方式，第一个是微信1， 第二个是微信2， 都是双击进入，不用输入密码，不用扫码。 爽歪歪！！
 
