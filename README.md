[<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" height="120" align="left">](https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg)
# SHELLBOX
### *Automate & chill*

![top-language](https://img.shields.io/github/languages/top/eli64s/shellbox?style=flat&color=blueviolet&logo=GNU%20Bash)
![license](https://img.shields.io/github/license/eli64s/shellbox?style=flat&color=blueviolet)
![last-commit](https://img.shields.io/github/last-commit/eli64s/shellbox?style=flat&color=blueviolet)
![github-activity](https://img.shields.io/github/commit-activity/m/eli64s/shellbox?style=flat&color=blueviolet)

---

##  Table of Contents
- [ Table of Contents](#-table-of-contents)
- [ Overview](#-overview)
- [ Features](#-features)
- [ repository Structure](#-repository-structure)
- [ Modules](#modules)
- [ Getting Started](#-getting-started)
    - [ Installation](#-installation)
    - [ Running shellbox](#-running-shellbox)
    - [ Tests](#-tests)
- [ Roadmap](#-roadmap)
- [ Contributing](#-contributing)
- [ License](#-license)
- [ Acknowledgments](#-acknowledgments)

---


##  Overview

Shellbox is a versatile software development utility equipped with robust script orchestration features for increased efficiency and standardization across projects. It offers facilities for Dockerized application builds, PyPi uploading, and environment setup with Micromamba and PyFlink to ensure seamless development. Shellbox goes further in offering easy project maintenance solutions for cleaning, testing, and running scripts. It streamlines filesystem operations involving file name modifications and directory transfers. Additionally, Shellbox provides an intuitive template for Python project collaborations. Thus, it encapsulates essential development operations in value-added scripts.

---

##  Features

|    | Feature                    | Description                 |
|----|----------------------------|-----------------------------|
| ⚙️  | **Architecture**           | The system structures comprehensive automation and management script strategies suiting Linux bash environment. It provides advanced solutions to script packaging and software installations along with maintenance, testing tooling and file manipulations. |
| 📄  | **Documentation**          | The codebase lacks comments and README for explaining the purpose and workflow of scripts. It does not adhere to the standard best practices of maintaining rich in-code documentation. |
| 🔗  | **Dependencies**           | Most scripts are standalone and require standard bash/shell tools. Specific scripts ferry dependencies on Docker, Deepsource and Python-related (pip, PyFlink) functions. |
| 🧩  | **Modularity**             | The codebase is organized into distinct directories: builds, common, files, install and templates. Scripts are disjoint, catering to perform an individual dedicated task strongly advocating the modularity principle. |
| 🧪  | **Testing**                | Test management for a Python project is encapsulated in the `test.sh` script leveraging pytest and coverage tooling in certain environments. No specific tests for these shell scripts. |
| ⚡️  | **Performance**            | Performance validates effectively on the Linux Bash environment. Specifically, micromamba.sh and pyflink.sh feature performance-based code rendering faster installations. |
| 🔐  | **Security**               | No explicit security measures are in place. Relies heavily on the user's awareness or setting correct permissions to ensure the security of shell scripts execution. |
| 🔀  | **Version Control**        | Not applicable directly to each script. However, in the broader sense, it's feasible that version control is handled by Git as is standard for most GitHub repositories. |
| 🔌  | **Integrations**           | A strong connection with Python tooling (pip, PyFlink), packaging (Docker), and static code review platform (Deepsource). |
| 📶  | **Scalability**            | It's scale friendly as each script independently caters single dedicated use-case, proficient scalability-excel features—be seen while hosting python project structure, ensuring Docker deployments. |


---


##  Repository Structure

```sh
└── shellbox/
    ├── .deepsource.toml
    ├── builds/
    │   ├── docker.sh
    │   └── pypi.sh
    ├── common/
    │   ├── clean.sh
    │   ├── run.sh
    │   └── test.sh
    ├── files/
    │   ├── modify_filenames.sh
    │   └── move_directory.sh
    ├── install/
    │   ├── micromamba.sh
    │   └── pyflink.sh
    └── templates/
        └── create_py_project.sh

```

---


##  Modules

<details closed><summary>Root</summary>

| File                                                                              | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---                                                                               | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [.deepsource.toml](https://github.com/eli64s/shellbox/blob/main/.deepsource.toml) | The code represents a project root directory structure for a script-based application written in shell. Main functionalities include: building the system using Docker and PyPi, ensuring standard program maintenance by providing clean, run, and test features, allowing filesystem management operations, handling software installs via Micromamba and PyFlink, and offering template for creating Python projects. It utilizes DeepSource for static code analysis on Shell scripts. |

</details>

<details closed><summary>Install</summary>

| File                                                                                | Summary                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ---                                                                                 | ---                                                                                                                                                                                                                                                                                                                                                                                                                      |
| [micromamba.sh](https://github.com/eli64s/shellbox/blob/main/install/micromamba.sh) | The script installs the latest version of Micromamba for Linux or MacOS. It identifies the OS, downloads Micromamba, assigns execution permissions, and relocates the file for global access. It initializes Micromamba, configures the default usage of conda-forge channel, and sets the channel priority to strict. The process terminates with a completion message.                                                 |
| [pyflink.sh](https://github.com/eli64s/shellbox/blob/main/install/pyflink.sh)       | This script automates the environment setup for working with PyFlink. It checks and installs Java 11 and Python 3.7 if they're not present. It downloads and extracts PyFlink from its official source, moves it to the pyflink directory and sets the necessary environment variables. The script also sets related aliases for zsh. Once these steps are done, the shell environment is ready for PyFlink development. |

</details>

<details closed><summary>Builds</summary>

| File                                                                       | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ---                                                                        | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| [pypi.sh](https://github.com/eli64s/shellbox/blob/main/builds/pypi.sh)     | The pypi.sh script defines several operations to clean the previous Python package data, build a new package, and deploy it to PyPI (Python Package Index). The deployment details include the package name, repository URL, username, and API key for package upload. Post successful package upload, a success message shows up in the console.                                                                                                                                                                                       |
| [docker.sh](https://github.com/eli64s/shellbox/blob/main/builds/docker.sh) | The builds/docker.sh script simplifies the process of managing a Docker image. Firstly, it constructs a FULL_IMAGE_NAME variable from user-defined components. After creating Docker Buildx, three primary functions are called: `build_image` builds a Docker image using local context, `publish_image` publishes the newly created image to a Docker registry, and `buildx_image` efficiently constructs multi-platform images. The process culminates with echoing a completion statement along with the full image's name created. |

</details>

<details closed><summary>Common</summary>

| File                                                                     | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---                                                                      | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [run.sh](https://github.com/eli64s/shellbox/blob/main/common/run.sh)     | The `common/run.sh` script initiates a series of operations starting with the activation of the Conda environment my_env, followed by the upgrade of Python package installer, pip, in this environment. It sets bash-specific options to handle errors and enables pipelining. The start and completion times of these operations are displayed. The surrounding directory tree contains additional scripts for building, testing, cleaning, file modifications, moving directories, installations, and project creation. |
| [clean.sh](https://github.com/eli64s/shellbox/blob/main/common/clean.sh) | The clean.sh script, best understood as a maintenance script, eliminates build, test, and temporary files from a Python project environment. The removal process has specialized functions catering to distinct targets-build artifacts, Python file artifacts, test and coverage artifacts, backup and Python cache files. This script, depending on the argument passed, invokes the respective function to remove the associated files and directories, enhancing hygiene and order in the working environment.         |
| [test.sh](https://github.com/eli64s/shellbox/blob/main/common/test.sh)   | The `test.sh` script in the `common` directory activates the readmeai Conda environment and employs the `coverage` utility to execute pytest tests on the readmeai project's source code, ignoring files and folders patterned as __init__.py and tests. The coverage report displays missed details and execution stops if coverage dips below 90%. The directory tree presents a project structure supporting Docker and PyPI builds, installation scripts, efficient file management, and Python project templates.     |

</details>

<details closed><summary>Files</summary>

| File                                                                                          | Summary                                                                                                                                                                                                                                                                                                                                                         |
| ---                                                                                           | ---                                                                                                                                                                                                                                                                                                                                                             |
| [modify_filenames.sh](https://github.com/eli64s/shellbox/blob/main/files/modify_filenames.sh) | The bash script primarily functions to identify files within the specified directory (/GitHub/readme-ai/docs) and alter their filenames. It performs two alterations: converting the characters to lowercase and replacing underscores with hyphens. Changes to filenames are printed for user confimation. If the folder isn't found, the script simply exits. |
| [move_directory.sh](https://github.com/eli64s/shellbox/blob/main/files/move_directory.sh)     | The move_directory.sh script, residing in the files directory, is designed to move a certain directory from a specified current location to a destination on the system. The script first checks existence of both source and destination directories. If both exist, it executes the move, otherwise, it logs relevant warning messages.                       |

</details>

<details closed><summary>Templates</summary>

| File                                                                                                | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ---                                                                                                 | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| [create_py_project.sh](https://github.com/eli64s/shellbox/blob/main/templates/create_py_project.sh) | The given script automates the process of setting up a new Python project. It creates the required directory structure (such as conf, scripts, setup etc.), initial files with their necessary code (like logger.py, conf.py, etc.), configures logger, command line argument parser, configurations, testing setup, and scripting boilerplates. It also prepares the project for Docker deployment and integration, generates necessary configuration files and adds an MIT license file, a configurable.gitignore and a Makefile with commonly used routines. |

</details>

---

##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Submit Pull Requests](https://github.com/eli64s/shellbox/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/eli64s/shellbox/discussions)**: Share your insights, provide feedback, or ask questions.
- **[Report Issues](https://github.com/eli64s/shellbox/issues)**: Submit bugs found or log feature requests for ELI64S.

#### *Contributing Guidelines*

<details closed>
<summary>Click to expand</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a Git client.
   ```sh
   git clone <your-forked-repo-url>
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear and concise message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---

##  License


This project is protected under the [Apache-2.0 license](LICENSE) License. For more details, refer to the [Apache License](http://www.apache.org/licenses/LICENSE-2.0) file.

[**Return**](#Top)

---
