# OpenShift Vale rules for Asciidoc markup

This repo contains Vale rules for checking Asciidoc markup specific to OpenShift and the [Modular Docs Guidelines](https://redhat-documentation.github.io/modular-docs/).

To add the OpenShift modular docs rules package, edit your local .vale.ini file to include the latest release of this repo. For example:

````
StylesPath = styles

MinAlertLevel = suggestion

Packages = RedHat, \
https://github.com/rohennes/ocp-rules/releases/download/v1/ocp.zip

[*]
BasedOnStyles = RedHat, ocp
````

