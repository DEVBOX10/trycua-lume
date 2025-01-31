<div align="center">
<h1>
  <div class="image-wrapper" style="display: inline-block;">
    <picture>
      <source media="(prefers-color-scheme: dark)" alt="logo" height="150" srcset="img/logo_white.png" style="display: block; margin: auto;">
      <source media="(prefers-color-scheme: light)" alt="logo" height="150" srcset="img/logo_black.png" style="display: block; margin: auto;">
      <img alt="Shows my svg">
    </picture>
  </div>

  [![Swift 6](https://img.shields.io/badge/Swift_6-F54A2A?logo=swift&logoColor=white&labelColor=F54A2A)](#)
  [![macOS](https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=F0F0F0)](#)
  [![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?&logo=discord&logoColor=white)](https://discord.com/channels/1328377437301641247)
</h1>
</div>

<!-- [![Homebrew](https://img.shields.io/badge/Homebrew-FBB040?logo=homebrew&logoColor=fff)](#) -->

**lume** is a lightweight Command Line Interface and local API server to create, run and manage macOS and Linux virtual machines (VMs) with near-native performance on Apple Silicon, using Apple's `Virtualization.Framework`.

### Run a prebuilt macOS image in just 1 step

<div align="center">
<img src="img/cli.png" alt="lume cli">
</div>


```bash
lume run macos-sequoia-vanilla:latest
```

## Usage

```bash
lume <command>

Commands:
  lume create <name>            Create a new macOS or Linux VM
  lume run <name>               Run a VM
  lume ls                       List all VMs
  lume get <name>               Get detailed information about a VM
  lume set <name>               Modify VM configuration
  lume stop <name>              Stop a running VM
  lume delete <name>            Delete a VM
  lume pull <image>             Pull a macOS image from container registry
  lume clone <name> <new-name>  Clone an existing VM
  lume images                   List available macOS images in local cache
  lume ipsw                     Get the latest macOS restore image URL
  lume prune                    Remove cached images
  lume serve                    Start the API server

Options:
  --help     Show help [boolean]
  --version  Show version number [boolean]

Command Options:
  create:
    --os <os>            Operating system to install (macOS or linux, default: macOS)
    --cpu <cores>        Number of CPU cores (default: 4)
    --memory <size>      Memory size, e.g., 8GB (default: 4GB)
    --disk-size <size>   Disk size, e.g., 50GB (default: 40GB)
    --display <res>      Display resolution (default: 1024x768)
    --ipsw <path>        Path to IPSW file or 'latest' for macOS VMs

  run:
    --no-display         Do not start the VNC client app
    --shared-dir <dir>   Share directory with VM (format: path[:ro|rw])
    --mount <path>       For Linux VMs only, attach a read-only disk image

  set:
    --cpu <cores>        New number of CPU cores
    --memory <size>      New memory size
    --disk-size <size>   New disk size

  delete:
    --force              Force deletion without confirmation

  pull:
    --registry <url>     Container registry URL (default: ghcr.io)
    --organization <org> Organization to pull from (default: trycua)

  serve:
    --port <port>        Port to listen on (default: 3000)
```

## Install

**Brew package coming soon!**

<!-- ```bash
brew install lume
``` -->

Meanwhile, you can always build and install from source. Check out the [Development](docs/Development.md) guide.

## Prebuilt Images

Pre-built images are available on [ghcr.io/trycua](https://github.com/orgs/trycua/packages). 
These images come with an SSH server pre-configured and auto-login enabled.

| Image | Tag | Description | Size |
|-------|------------|-------------|------|
| `macos-sequoia-vanilla` | `latest`, `15.2` | macOS Sonoma 15.2 | 40GB |
| `macos-sequoia-xcode` | `latest`, `15.2` | macOS Sonoma 15.2 with Xcode command line tools | 50GB |
| `ubuntu-vanilla` | `latest`, `24.04.1` | [Ubuntu Server for ARM 24.04.1 LTS](https://ubuntu.com/download/server/arm) with Ubuntu Desktop | 20GB |

For additional disk space, resize the VM disk after pulling the image using the `lume set <name> --disk-size <size>` command.

## Local API Server
  
`lume` exposes a local HTTP API server that listens on `http://localhost:3000/lume`, enabling automated management of VMs.

```bash
lume serve
```

For detailed API documentation, please refer to [API Reference](docs/API-Reference.md).

## Docs

- [API Reference](docs/API-Reference.md)
- [Development](docs/Development.md)
- [FAQ](docs/FAQ.md)

## Contributing

We welcome and greatly appreciate contributions to lume! Whether you're improving documentation, adding new features, fixing bugs, or adding new VM images, your efforts help make lume better for everyone. For detailed instructions on how to contribute, please refer to our [Contributing Guidelines](CONTRIBUTING.md).

Join our [Discord community](https://discord.com/channels/1328377437301641247) to discuss ideas or get assistance.

## License

lume is open-sourced under the MIT License - see the [LICENSE](LICENSE) file for details.

## Trademarks

Apple, macOS, and Apple Silicon are trademarks of Apple Inc. Ubuntu and Canonical are registered trademarks of Canonical Ltd. This project is not affiliated with, endorsed by, or sponsored by Apple Inc. or Canonical Ltd.