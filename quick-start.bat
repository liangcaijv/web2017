@echo off
echo [Pre-Requirement] Makesure install JDK 6.0+ and set the JAVA_HOME.
echo [Pre-Requirement] Makesure install Maven 3.0.3+ and set the PATH.

set MVN=mvn
set MAVEN_OPTS=%MAVEN_OPTS% -XX:MaxPermSize=128m

echo [Step 1] Install all  modules  to local maven repository.

call %MVN% clean install
if errorlevel 1 goto error

echo [Step 2] start rbac project.
cd rbac-service
call %MVN% jetty:run
if errorlevel 1 goto error
cd ..\..


echo [INFO] Please wait a moment. When you see "[INFO] Started Jetty Server" in  popup console, you can access below demo sites:
echo [INFO] http://localhost:8080

goto end
:error
echo Error Happen!!
:end
pause