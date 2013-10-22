:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                               逐一打开指定txt中网址                              ::
::                                    1:49 2013/5/1                                 ::
::                                   QQ:2279164298                                  ::
::                       8:50 2013/5/19升级支持网址中包含特殊字符                   ::
::                       12:50 2013/8/7升级注册到注册表，支持鼠标右键               ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
title 小马的工具 23:02 2013/4/30制作
mode con cols=50 lines=16
color 0d
::变量延迟
setlocal enabledelayedexpansion

rem 设置txt所在路径
rem set weburl=everyday.txt
rem 比如去掉上一行的注释"rem"给下一行加注释"rem"则可以从同目录的everyday.txt中打开网址
set weburl=%1

echo.
echo.
echo.
echo.
echo.
echo     请稍等！脚本将为您打开!weburl!中所列网站
ping -n 4 127.1>nul
cls

if not exist !weburl! goto :error


:::::::::::::::::::::::::::::::::::::::
::主程序
set j=0
for /f "tokens=1,2 eol=& delims= " %%i in (!weburl!) do (
rem 替换地址中特殊字符>>>>>>>>>>>>>>>>>>>>>>>>
set "newurl=%%i"
rem  ^^\@*/%#^<^>$&
set "newurl=!newurl:&=^&!"
set "newurl=!newurl:#=^#!"
set "newurl=!newurl:%=^%!"
set "newurl=!newurl:^==^^=!"
rem >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
call :jici
echo.
echo.
set str=正在打开第!j!个网站：%%j...
call :onechar !str!
echo.
:::::::::::::::::
call :jindu
call :openUrl %%i
)
echo.
echo 此次运行脚本共打开了%j%网址
echo.
pause
exit

:error
echo.
echo.
echo     脚本无法再当前目录找到!weburl!文档
echo.
echo     请将您需要打开的网址放在本脚本目录下!weburl!文档中
echo.
echo     或者发生了其他不可预知的错误
echo.
pause
exit

::::::::::::::::::::::
::循环计次
:jici
set /a j+=1
goto :eof
::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::
::jin du tiao
:jindu
for /l %%i in (1,2,120) do set/p ap=^><nul&ping /n 0 127.1>nul
cls
goto :eof
:::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::
::open web by url 一个参数
:openUrl
start "" %1
goto :eof
:::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::
:onechar 一个参数

set char=%1
	echo.
	echo.
for /l %%j in (0,1,20) do (
 set/p= !char:~%%j,1!<nul
 rem 依次取出变量char中的每一个字符，并显示。

 ping -n 1 127.1>nul
 rem 设置输出每个字符的时间延迟。
)
goto :eof
:::::::::::::::::::::::::::::::::--结束--::::::::::::::::::::::::::::::::