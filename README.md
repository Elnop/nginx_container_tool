# Nginx Container Tool

This project is a tool designed to quickly set up a Dockerized Nginx environment.

## Usage exemple

I have a config file in configs and website sources folder in www with same name "simple_site"

nginx_container_tool/
    configs/
        **simple_site.conf**
    www/
        **simple_site/**
            index.html
    Makefile
    Dockerfile
    README.md

Deploy website:

```bash
make TARGET=simple_site
```

TARGET are the name of config and sources folder