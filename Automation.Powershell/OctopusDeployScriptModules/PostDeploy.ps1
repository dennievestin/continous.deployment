$stepName = $OctopusParameters["Octopus.Step.Name"]
$webroot = $OctopusParameters["Octopus.Action[$stepName].IISWebSite.WebRoot"]
$setting = $OctopusParameters["xml-preprocessor-target-setting"] 

TransformConfigurations $setting $webroot