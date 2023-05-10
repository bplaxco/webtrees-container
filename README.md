# webtrees-container

Build webtrees on top of a RHEL PHP image

## Signed Images

URL for the [image sigstore](https://developers.redhat.com/blog/2019/10/29/verifying-signatures-of-red-hat-container-images#mirroring_red_hat_container_images_to_a_private_registry):

```
https://repo.lupnix.org/containers/sigstore
```

These images have been signed with [this GPG key](https://repo.lupnix.org/pks/bplaxco.gpg).


## Published Image

I have a version published at `quay.io/lupnix/webtrees` but I recommend you
build your own image. My image is for personal use and could be removed
at any point.

## Make Targets

### `clean`

Clean out generated files from the repo.

### `build`

Build the image.

### `run`

Run the image locally.

### `test`

Run and test the image locally.

### `sign`

Sign the latest published image and store the signature in `./sigstore`.
The `GPG_EMAIL` env variable needs to be set to the key used to sign the image.

### `debug`

Run the image locally, using bash as the entrypoint.

### `publish`

Publish the image to `quay.io/lupnix/webtrees`
