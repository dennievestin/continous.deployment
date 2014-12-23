# Various scripts for TeamCity and Octopus Deploy

## /Automation.Powershell/

**Octopus Deploy scripts**


- Try start octopus service if not responding    
- Try start octopus tentacle service of not responding  
- Clean directory before deploy  
- Stop IIS  
- Start IIS  
- Xml transform module for XmlPreprocessor  
- Verify deployment  
- Create version file   

**Nuget spec**  

*Run CopyReleaseFiles.ps1 first*  
Webroot -> content (with dll in bin folder)   
Tools -> tools  
Settings -> settings  

**Generic**  

- Get response time of site
- Powershell module to run scriptcs build tasks

## /Automation/

**Resting peacefully... the idea was to separate project specific configurations from TeamCity in order to fast set up new projects with even more generic build-templates. Also to be able to run integration tests of some parts of the continous deployment process. As for now I'm using parts of it only.**

Description within that folder.
