# Rouge
*Deinonychus antirrhopus*

[![Stable Images](https://github.com/baqhub/rouge/actions/workflows/build-image-stable.yml/badge.svg)](https://github.com/baqhub/rouge/actions/workflows/build-image-stable.yml)[![Latest Images](https://github.com/baqhub/rouge/actions/workflows/build-image-latest-main.yml/badge.svg)](https://github.com/baqhub/rouge/actions/workflows/build-image-latest-main.yml)

**Rouge** is a cloud-native desktop operating system derived from [Bluefin](https://projectbluefin.io/), reimagined with its own visual identity and opinionated defaults.

For end users, it provides a system as reliable as a Chromebook with near-zero maintenance. For developers, it offers a cloud-native developer workflow with integrated container tools, declarative system management, and seamless CI/CD integration.

## Mission

Rouge's mission is to provide a robust, cloud-native desktop operating system that bridges the gap between consumer usability and enterprise-grade infrastructure practices. We aim to deliver:

- **Reliability**: Atomic updates ensuring system stability
- **Developer Experience**: Integrated cloud-native tooling and workflows, including Kubernetes and container support
- **Sustainability**: Reduced maintenance overhead by building on upstream cloud-native infrastructure

## Getting Started

Visit [rougeos.com](https://rougeos.com/) to explore installation options and get started with Rouge.

### Secure Boot

Secure Boot is supported by default. After the first installation, you will be prompted to enroll the secure boot key in the BIOS.

Enter the password `universalblue` when prompted to enroll the key.

If this step is not completed during the initial setup, you can manually enroll the key by running the following command in the terminal:

```
ujust enroll-secure-boot-key
```

Secure boot is supported with a custom key. The pub key can be found in the root of the akmods repository [here](https://github.com/ublue-os/akmods/raw/main/certs/public_key.der). If you'd like to enroll this key prior to installation or rebase, download the key and run the following:

```bash
sudo mokutil --timeout -1
sudo mokutil --import public_key.der
```

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

### Third-Party Components

Rouge incorporates and builds upon several open source projects:
- **Fedora Linux** - Base operating system foundation
- **GNOME Desktop Environment** - Desktop interface
- **Universal Blue** - Cloud-native desktop infrastructure
- **Bluefin** - Upstream image and shared tooling from [projectbluefin/common](https://github.com/projectbluefin/common)
- **Various CNCF Projects** - Cloud-native tooling and containers

All incorporated components maintain their respective licenses and attributions.
