To include the OpenShift modular docs rule set, edit your local .vale.ini file to reference the latest package in the zipped-packages folder. For example:

````
StylesPath = styles

MinAlertLevel = suggestion

Packages = RedHat, \
https://rohennes.github.io/ocp-vale/zipped-packages/ocp-modular-rules.zip

[*]
BasedOnStyles = RedHat, ocp
````

**_NOTE:_** The repo is hosted on Github Pages so if want to include a package from this repo in your local .vale.ini file, add the link in the following format: https://rohennes.github.io/ocp-vale/zipped-packages/[zip-name].zip