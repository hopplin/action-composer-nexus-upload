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

```markdown
uses: TUDOCK/action-composer-nexus-upload@v1
if: ${{ github.event_name == 'push' }}
with:
  repository: 'https://...'
  username: 'me'
  password: ${{ secrets.password }}
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