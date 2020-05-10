# action-alpine-abuild
A plugin for [Actions CI](https://github.com/features/actions) to build Alpine Linux package

## Configuration

An example configuration of how the plugin should be configured:
```yaml
steps:
  - name: abuild
    uses: triptixx/action-alpine-build@master
    with:

```

### Available options
- `rsa_private_key`          This is the contents of your RSA private key. _required_
- `rsa_public_key`           This is the contents of your RSA public key. _required_
