# Work in progress... 

**The idea is to separate project specific configurations from TeamCity and in the best case also break the TeamCity specific dependencies down to a build server that can run powershell scripts in the build steps.**

### Dependencies

* Powershell version 3
* ScriptCs
* ScriptCs.Shovel

For integration tests to be able to run

* ScriptCs.NUnit

 Documentation for [ScriptCs](http://scriptcs.net) and the [wiki](https://github.com/scriptcs/scriptcs/wiki) pages.

### First time installation

```
PS>scriptcs .\Start.csx `-- -tasks:Install
```

### TeamCity build step

* Add new build step and select the powershell option
* Set run path to where you have these scripts
* Scriptcs -FileToRun.csx `-- -tasks:Build

Examples:  
*Important: The ` is the powershell escape sign and must be included as shown below.*

Single task:  
```
PS> scriptcs .\FileToRun.csx `-- -tasks:RunGrunt
```  
Mulitple tasks:  
```
PS> scriptcs .\FileToRun.csx `-- -tasks:Clean,Build,Pack,Deploy,Verify
```  
The level of logging can be set explicitly
```
PS> scriptcs .\FileToRun.csx -loglevel Error `-- -tasks:Deploy
```

### Run unit tests

*Important: the debug flag must be set when running unit/integration tests:*

```
PS>scriptcs .\Start.csx `-- -tasks:RunTests
```
