echo off 
title �������ݿ� 
cls 
color 0f
echo ���ϵͳ�ϴ�����ΪWEIGHT20�����ݿ� 
echo ����ȫ��������� 
echo �����ѡ��
echo ==================================
echo 1��ʹ��NT��֤��ʽ�ؽ����ݿ⣻
echo 2��ʹ��SQL�˻�sa�ؽ����ݿ⣻(Ĭ������:123)
echo 3��ȡ���ؽ���
echo ==================================
set /p choice=��ѡ�������ʽ��
if /i "%choice%"=="1" goto createdb1 
if /i "%choice%"=="2" goto createdb2 
if /i "%choice%"=="3" goto end 
:createdb1 
osql -E -n -i weight20.sql
pause
exit
:createdb2
osql -U sa -n -i weight20.sql
pause
exit
:end
exit