**Resting peacefully... the idea was to separate project specific configurations from TeamCity in order to fast set up new projects with even more generic build-templates. Also to be able to run integration tests of some parts of the continous deployment process. As for now I'm using parts of it only.**

### Dependencies

* Powershell version 3
* ScriptCs
* ScriptCs.Shovel
* ScriptCs.NUnit

 Documentation of [ScriptCs](http://scriptcs.net) and the [wiki](https://github.com/scriptcs/scriptcs/wiki) pages.

### Install dependent modules

```
PS>scriptcs .\Start.csx `-- -tasks:Install
```

### Run tasks from command line

```
PS> scriptcs .\FileToRun.csx `-- -tasks:Deploy
```

### To run within  TeamCity build steps

* Add new build step and select the powershell option
* Set run path to where you have these scripts
* Scriptcs -FileToRun.csx `-- -tasks:Build

### Examples  

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
