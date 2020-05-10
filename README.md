# action-alpine-abuild
A plugin for [Actions CI](https://github.com/features/actions) to build Alpine Linux package

## Configuration

An example configuration of how the plugin should be configured:
```yaml
steps:
  - name: abuild
    uses: triptixx/action-alpine-build@master
    with:
      private_key: var_private_key
      public_key: var_public_key
      packager: 'Triptixx Lab <triptixx@masterlabs.net>'
```

### Available options
- `private_key`          the contents of your RSA private key. _optional_
- `public_key`           the contents of your RSA public key. _optional_
- `packager`             the name of the package used in package metadata. _default: `Glider Labs <team@gliderlabs.com>`_
