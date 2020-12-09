@echo off

set root_dir=%CD%
set escher_dir=c:\users\FASTSH~1\Escher

if [%1]==[] goto run
if [%1]==[-h] goto run
if [%1]==[--help] goto run


for %%a in (%*)	do set last_arg=%%a


set target=%last_arg%
set file_name=%last_arg%.json

if NOT exist %file_name% goto run
copy %file_name% "%escher_dir%"


:run
cd "%escher_dir%"
python escher.py %*

if [%file_name%]==[] goto end
if [%1]==[-n] set target=%file_name%
if [%1]==[--new] set target=%file_name%

move %target% "%root_dir%"
del %file_name%

:end
cd %root_dir%
