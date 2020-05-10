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
- `private_key`          this is the contents of your RSA private key. _required_
- `public_key`           this is the contents of your RSA public key. _required_
