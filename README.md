# Composer Nexus Upload/Push

Simple PHP Script and Docker Image for uploading composer packages to a Nexus Respository.

## Inputs

## `repository`

**Required** URL of the Nexus repository.

## `username`

**Required** Username for authentification.

## `password`

**Required** Password for authentification.

## `version`

Version to publish the Composer package as.

If not specified, will autodectect:
- If the push is for a pull request, will fail.
- If the push is for a branch, will publish as "dev-branchname".
- If the push is for a tag, will publish as the tag.

## `package-path`

Path to package to upload, relative to repository root.

## Outputs

None.

## Example usage

### 1. Create secrets and variable

To use this Github action, you must first set a variable and 2 secrets in your settings. To do this, open the settings and select ‘secrets and variables’ and then Actions. There you create the secrets:
1. NEXUSUSER = user name in Nexus
2. NEXUSPWD = Password of the user in Nexus
   Then create the variable:
1. NEXUSURL = the address of the repository (e.g. [nexusurl]/repository/[repository])

### 2. Extend GitHub Action

Now add the step to your GitHub action:
(The condition (if: ) is optional)

```markdown
jobs:
  ...
  steps:
    ...
    - name: Upload package to nexus repository
      uses: HOPPLIN-GmbH/action-composer-nexus-upload@v1
      if: ${{ github.event_name == 'push' }}
      with:
        repository: ${{ vars.NEXUSURL }} 
        username: ${{ secrets.NEXUSUSER }}
        password: ${{ secrets.NEXUSPWD }}
```

## Files exclusion

To exclude files from the uploaded zip, add this to the `composer.json`
of the package:

```json
{
  ...

  "extra": {
    "nexus-upload": {
      "ignore": [
        "node_modules/",
        "*.css.map",
        "*.ts",
        "*.zip",
        "webpack.config.js",
        "*.json",
        "*.less"
      ]
    }
  }
  ...
}
```