echo off 
title �������ݿ� 
cls 
color 0f
echo ���ϵͳ�ϴ�����ΪWEIGHT20�����ݿ� 
echo ����ȫ��������� 
echo �����ѡ��
set choice= 
set /p choice=���½����밴y,�����밴n:
if /i "%choice%"=="y" goto createdb 
if /i "%choice%"=="n" goto end 
:createdb 
osql -E -n -i weight20.sql
pause
:end
exit