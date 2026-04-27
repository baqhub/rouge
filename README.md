# Rouge
*Deinonychus antirrhopus*

[![Stable Images](https://github.com/rougeos/rouge/actions/workflows/build-image-stable.yml/badge.svg)](https://github.com/rougeos/rouge/actions/workflows/build-image-stable.yml)[![Latest Images](https://github.com/rougeos/rouge/actions/workflows/build-image-latest-main.yml/badge.svg)](https://github.com/rougeos/rouge/actions/workflows/build-image-latest-main.yml)

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

Secure Boot is supported by default. Kernel modules are dual-signed with two Rouge-owned keys, both of which are enrolled at first boot when installing from the Rouge ISO.

Enter the password `rouge` when prompted by the MokManager UI to enroll the keys.

If you installed via the ISO and missed the enrollment, or if you rebased to Rouge from another image, you can enroll the keys manually:

```
ujust enroll-secure-boot-key
```

The public keys are published at:

- https://downloads.rougeos.com/keys/rouge_2026-04-25-1.der
- https://downloads.rougeos.com/keys/rouge_2026-04-25-2.der

To enroll them ahead of time without `ujust`:

```bash
curl -LO https://downloads.rougeos.com/keys/rouge_2026-04-25-1.der
curl -LO https://downloads.rougeos.com/keys/rouge_2026-04-25-2.der
sudo mokutil --timeout -1
sudo mokutil --import rouge_2026-04-25-1.der
sudo mokutil --import rouge_2026-04-25-2.der
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
