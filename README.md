# Vale ruleset for Asciidoc

This repo contains Vale rules for checking Asciidoc markup. These syntax rules were derived from Red Hat's [Modular Docs Guidelines](https://redhat-documentation.github.io/modular-docs/) and [OpenShift Docs Guidelines](https://github.com/openshift/openshift-docs/blob/main/contributing_to_docs/doc_guidelines.adoc).

For Vale installation steps, see here: https://vale.sh/docs/vale-cli/installation/

**_NOTE:_** If you need Vale rules to lint AsciiDoc content, not AsciiDoc syntax, see the vale-at-red-hat project: https://github.com/redhat-documentation/vale-at-red-hat/

## Testing the `AsciiDoc` rule set
To test the `AsciiDoc` rule set, add a `.vale.ini` configuration file in your modules directory. 

1. Add a `.vale.ini` file to your **/modules** directory with the following content:

  ```
  StylesPath = ../.vale/styles

  MinAlertLevel = suggestion

  Packages = RedHat, \
  https://github.com/rohennes/vale-asciidoc/releases/latest/download/AsciiDoc.zip

  [[!.]*.adoc]
  BasedOnStyles = RedHat, AsciiDoc
  ```

  **Note:** This is a separate `vale.ini` file that is designed for modules only - not assemblies.  If you are using this with `openshift-docs` or any other repo, don't overwrite existing `vale.ini` files.

2. Run `vale sync` in the modules directory.

  ### Verification

  To verify, run `vale ls-config` in your modules directory to check that the `AsciiDoc` package is installed. 

  _Example output_

  ```
  {
  "BlockIgnores": {},
  "Checks": null,
  "Formats": {},
  "Asciidoctor": {},
  ...
  "SBaseStyles": {
    "[!.]*.adoc": [
      "AsciiDoc"
    ]
  ...
  }
  ```

## Optional: Exclude the Vale configuration file from Git
 
To exclude the `.vale.ini` configuration file from Git, add the file to the list of ignored files in a global `.gitignore` file in your home directory.

1. Add the following content to a `.gitignore` file in your home directory:

      `modules/.vale.ini `

2. If you didn't have a .gitignore file previously in your home dir, you may need to make git aware of this global .gitignore file by running the following:

      `git config --global core.excludesFile '~/.gitignore'`
