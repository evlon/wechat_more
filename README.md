# 使用Powershell脚本实现微信多开


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

 
