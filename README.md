# OpenShift Vale rules for Asciidoc markup

This repo contains Vale rules for checking Asciidoc markup specific to [OpenShift Docs Guidelines](https://github.com/openshift/openshift-docs/blob/main/contributing_to_docs/doc_guidelines.adoc) and the [Modular Docs Guidelines](https://redhat-documentation.github.io/modular-docs/).

To add the OpenShift modular docs rules package, edit your local .vale.ini file to include the latest release of this repo. For example:

````
StylesPath = styles

MinAlertLevel = suggestion

Packages = RedHat, \
https://github.com/rohennes/ocp-rules/releases/latest/download/OpenShiftAsciiDocValidation.zip

[*]
BasedOnStyles = RedHat, OpenShiftAsciiDocValidation
````

PR contributions welcome to this repo. 
The current list of potential rules is in the gdoc here: https://docs.google.com/document/d/1xawRkloLUDj0cz3hlbMxTYIFBK31jMbF6X54U3MPGGY/edit?usp=sharing Feel free to add any rules ideas to this gdoc also. 

