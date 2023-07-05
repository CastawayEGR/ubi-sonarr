ubi-sonarr
=========
[![Sonarr CI/CD](https://github.com/CastawayEGR/ubi-sonarr/actions/workflows/build.yml/badge.svg)](https://github.com/CastawayEGR/ubi-sonarr/actions/workflows/build.yml)
[![Docker Repository on Quay](https://quay.io/repository/castawayegr/sonarr/status "Docker Repository on Quay")](https://quay.io/repository/castawayegr/sonarr)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/CastawayEGR/ubi-sonarr.svg?logoColor=brightgreen)](https://github.com/CastawayEGR/ubi-sonarr)
[![GitHub last commit](https://img.shields.io/github/last-commit/CastawayEGR/ubi-sonarr.svg?logoColor=brightgreen)](https://github.com/CastawayEGR/ubi-sonarr)

A RHEL UBI based image for Sonarr built to run rootless on OpenShift.

## Usage

```bash
podman run -d --name sonarr \
    -e TZ=America/New_York \
    -p 8989:8989 \
    -v $(pwd)/config:/config:Z \
    quay.io/castawayegr/sonarr:latest 
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
