# Vale ruleset for Asciidoc

This repo contains Vale rules for checking Asciidoc markup specific to [Modular Docs Guidelines](https://redhat-documentation.github.io/modular-docs/) and [OpenShift Docs Guidelines](https://github.com/openshift/openshift-docs/blob/main/contributing_to_docs/doc_guidelines.adoc).

PR contributions are welcome to this repo. Or please raise GitHub issues if you find problems.

If you have any ideas for additional rules, please add these here: https://docs.google.com/document/d/1xawRkloLUDj0cz3hlbMxTYIFBK31jMbF6X54U3MPGGY/edit?usp=sharing  

## Testing the `AsciiDoc` rule set
To test this rule set locally, add a vale config file in your modules directory. This won't effect other rule sets you have already. You can also add this new vale config file to a glboal gitignore file in your home directory to avoid any conflicts.

1. Add the following to a .gitignore file in your home directory:

`modules/.vale.ini `

If you didn't have a .gitignore file previously in your home dir, you may need to make git aware of this global .gitignore file by running the following:

`git config --global core.excludesFile '~/.gitignore'`

2. Create a .vale.ini file in your openshift-docs/modules directory and add the following:

```
StylesPath = ../.vale/styles

MinAlertLevel = suggestion

Packages = RedHat, \
https://github.com/rohennes/vale-asciidoc/releases/latest/download/AsciiDoc.zip

[[!.]*.adoc]
BasedOnStyles = RedHat, AsciiDoc
```

3. Run `vale sync` in the modules directory.

You should see two packages installed. To verify, run `vale ls-config`  in the modules directory and you should see two packages "RedHat" and "AsciiDoc". 


