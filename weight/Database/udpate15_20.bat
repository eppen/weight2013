echo off 
title �������ݿ� 
cls 
color 0f 
echo ���ļ����ڽ�WEIGHT15������WEIGHT20�汾
echo �˲������������WEIGHT20������,�Ƿ����?  
set choice= 
set /p choice=�����밴y,�����밴n:
if /i "%choice%"=="y" goto updatedb 
if /i "%choice%"=="n" goto end 
:updatedb 
osql -E -n -i update15_20.sql
pause
:end
exit