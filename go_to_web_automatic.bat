:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                               ��һ��ָ��txt����ַ                              ::
::                                    1:49 2013/5/1                                 ::
::                                   QQ:2279164298                                  ::
::                       8:50 2013/5/19����֧����ַ�а��������ַ�                   ::
::                       12:50 2013/8/7����ע�ᵽע���֧������Ҽ�               ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
title С��Ĺ��� 23:02 2013/4/30����
mode con cols=50 lines=16
color 0d
::�����ӳ�
setlocal enabledelayedexpansion

rem ����txt����·��
rem set weburl=everyday.txt
rem ����ȥ����һ�е�ע��"rem"����һ�м�ע��"rem"����Դ�ͬĿ¼��everyday.txt�д���ַ
set weburl=%1

echo.
echo.
echo.
echo.
echo.
echo     ���Եȣ��ű���Ϊ����!weburl!��������վ
ping -n 4 127.1>nul
cls

if not exist !weburl! goto :error


:::::::::::::::::::::::::::::::::::::::
::������
set j=0
for /f "tokens=1,2 eol=& delims= " %%i in (!weburl!) do (
rem �滻��ַ�������ַ�>>>>>>>>>>>>>>>>>>>>>>>>
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
set str=���ڴ򿪵�!j!����վ��%%j...
call :onechar !str!
echo.
:::::::::::::::::
call :jindu
call :openUrl %%i
)
echo.
echo �˴����нű�������%j%��ַ
echo.
pause
exit

:error
echo.
echo.
echo     �ű��޷��ٵ�ǰĿ¼�ҵ�!weburl!�ĵ�
echo.
echo     �뽫����Ҫ�򿪵���ַ���ڱ��ű�Ŀ¼��!weburl!�ĵ���
echo.
echo     ���߷�������������Ԥ֪�Ĵ���
echo.
pause
exit

::::::::::::::::::::::
::ѭ���ƴ�
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
::open web by url һ������
:openUrl
start "" %1
goto :eof
:::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::
:onechar һ������

set char=%1
	echo.
	echo.
for /l %%j in (0,1,20) do (
 set/p= !char:~%%j,1!<nul
 rem ����ȡ������char�е�ÿһ���ַ�������ʾ��

 ping -n 1 127.1>nul
 rem �������ÿ���ַ���ʱ���ӳ١�
)
goto :eof
:::::::::::::::::::::::::::::::::--����--::::::::::::::::::::::::::::::::