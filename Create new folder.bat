::Switch off echo
@echo off

::Set global path
SET currentPath=%~dp0
SET templateFullPath=%currentPath%Template

::Set to the current path
cd %currentPath%

::Check if template folder exist
IF NOT EXIST Template (
	echo Template folder does not exist. Create folder named 'Template'
	echo Script will end..
	pause
	exit /b
)

::User input and set some of the variables
SET /p sprintName="Podaj nazwe sprint: "
SET /p testName="Podaj nazwe testu: "
SET sprintDirName="Test-Dev %sprintName%"

::Check if sprint folder exist
IF EXIST "%sprintDirName%" (
	echo "Folder exist"
) ELSE (
	echo "Folder does not exist"
	mkdir %sprintDirName%
)

::Go to sprint folder
cd %currentPath%\%sprintDirName%

::Check if test name exist
IF EXIST "%testName%" (
	echo Test name already in use.. Choose another one name
	echo Script will end..
	pause
	exit /b
) Else (
	mkdir "%testname%"
	robocopy "%templateFullPath%" "%testName%" /E
)

pause
