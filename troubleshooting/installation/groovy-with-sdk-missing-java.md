# Groovy
- Error `groovy: JAVA_HOME not set and cannot find javac to deduce location, please set JAVA_HOME.`:
- Try to install the java by running `sdk install java`
```
➜  ~ curl -s "https://get.sdkman.io" | bash
➜  ~ source "$HOME/.sdkman/bin/sdkman-init.sh"
➜  ~ source "$HOME/.sdkman/bin/sdkman-init.sh"
➜  ~ sdk install groovy

Downloading: groovy 4.0.14

In progress...

##################################################################################################################################################################################### 100.0%

Installing: groovy 4.0.14
Done installing!


Setting groovy 4.0.14 as default.
➜  ~ groovy
groovy: JAVA_HOME not set and cannot find javac to deduce location, please set JAVA_HOME.
➜  ~ groovy --version
groovy: JAVA_HOME not set and cannot find javac to deduce location, please set JAVA_HOME.
➜  ~ sdk install java

Downloading: java 17.0.8.1-tem

In progress...

##################################################################################################################################################################################### 100.0%

Repackaging Java 17.0.8.1-tem...

Done repackaging...

Installing: java 17.0.8.1-tem
Done installing!


Setting java 17.0.8.1-tem as default.
➜  ~ groovy --version
Groovy Version: 4.0.14 JVM: 17.0.8.1 Vendor: Eclipse Adoptium OS: Linux
➜  ~
```
