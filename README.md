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

**Required** Version to publish the Composer package as.

## `package-path`

Path to package to upload, relative to repository root.

## Outputs

None.

## Example usage

```markdown
uses: TUDOCK/action-composer-nexus-upload@v1
with:
  repository: 'https://...'
  username: 'me'
  password: ${{ secrets.password }}
  version: '1.0.0'
```

## Files exclusion

To exclude files from the uploaded zip, add this to the `composer.json`
of the package:

```json
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
```