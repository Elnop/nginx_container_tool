# Nginx Container Tool

This project is a tool designed to quickly set up a Dockerized Nginx environment. It allows you to easily deploy and manage multiple websites using Docker and Nginx.

## Table of Contents

- [Introduction](#Introduction)
- [Installation](#Installation)
- [Project Structure](#project-structure)
- [Usage Example](#usage-example)
- [Makefile Commands](#makefile-commands)
    - [Start](#Start)
    - [Clean](#Clean)
    - [Enter](#Enter)
    - [Re](#Re)
- [Additional Resources](#additional-resources)

## Introduction

Nginx Container Tool is designed to simplify the deployment of websites in a Dockerized Nginx environment. It is particularly useful for developers who need to quickly set up and tear down web environments for testing and development.

## Installation

To get started, clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/nginx-container-tool.git
cd nginx-container-tool
```

Ensure you have Docker and Make installed on your machine.

## Project Structure
The project directory should be organized as follows:

```markdown
nginx_container_tool/
    configs/
        simple_site.conf
    www/
        simple_site/
            index.html
    Makefile
    Dockerfile
    README.md
```

- **configs/**: Contains Nginx configuration files for each site.
- **www/**: Contains the website source files.
- **Makefile**: Contains commands for building, deploying, and cleaning Docker containers.
- **Dockerfile**: Defines the Docker image used for the Nginx server.
- **README.md**: Project documentation.

## Usage Example

Assume you have a config file in configs and website source folder in www with the same name "simple_site".

To deploy the website, run:

```bash
make NAME=simple_site PORT=2000 CONFIG=configs/simple_site.conf WWW=www/simple_site
```
**NAME** is the name of the configuration and source folder.
**PORTS** is a space-separated list of ports to be exposed.
**CONFIG** is a nginx server config file
**WWW** is a folder containing website/application sources

To stop and clean containers, run:

```bash
make clean NAME=simple_site
```

## Makefile Commands

### Start

Build and run the Docker container for the specified target.

```bash
make start NAME=<image/container name> PORT=<ports forwarded> CONFIG=<config file path> WWW=<config folder path>
```

### Clean

Stop and remove the Docker container and image for the specified target.

```bash
make clean NAME=<image/container name>
```
### Enter

Enter in the specified target container.

```bash
make enter NAME=<container name>
```

### Re

Clean, build and start target container.

```bash
make re NAME=<image/container name> PORT=<ports forwarded> CONFIG=<config file path> WWW=<config folder path>
```

### Additional Resources
- [Docker Documentation](https://docs.docker.com/)
- [Nginx Documentation](https://nginx.org/en/docs/)