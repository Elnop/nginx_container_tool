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
make TARGET=simple_site PORTS="2000 3000"
```
To stop and clean containers, run:

```bash
make clean TARGET=simple_site
```

**TARGET** is the name of the configuration and source folder.
**PORTS** is a space-separated list of ports to be exposed.

## Makefile Commands

### Start

Build and run the Docker container for the specified target.

```bash
make TARGET=<target_name> PORTS="<port1> <port2>"
```

### Clean

Stop and remove the Docker container and image for the specified target.

```bash
make clean TARGET=<target_name>
```
### Enter

Enter in the specified target container.

```bash
make enter TARGET=<target_name>
```

### Additional Resources
- [Docker Documentation](https://docs.docker.com/)
- [Nginx Documentation](https://nginx.org/en/docs/)