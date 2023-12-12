<div align="center">
<h1 align="center">SHELLBOX</h1>
<h3>◦ ShellBox: Unboxing Your Code's Potential!</h3>
<h3>◦ Developed with the software and tools below.</h3>

<img src="https://img.shields.io/github/license/eli64s/shellbox?style=flat&color=blueviolet" alt="GitHub license" />
<img src="https://img.shields.io/github/last-commit/eli64s/shellbox?style=flat&color=blueviolet" alt="git-last-commit" />
<img src="https://img.shields.io/github/commit-activity/m/eli64s/shellbox?style=flat&color=blueviolet" alt="GitHub commit activity" />
<img src="https://img.shields.io/github/languages/top/eli64s/shellbox?style=flat&color=blueviolet" alt="GitHub top language" />
</div>

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

Shellbox is an orchestrated repository leveraging shell scripts to automate common tasks in a project's lifecycle. It accelerates the setup of Python and PyFlink environments, cleanses project directories, tests Python project's code coverage, and manages file and directory operations. Additionally, it aids in creating a scaffold for Python projects, inclusive of essential configuration files with docker setup. Collectively, Shellbox drives efficiency, traceability, and error management in project operations thereby streamlining development workflows.

---

##  Features

|   | Feature           | Description                                                                                                                                                                         |
|---|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ⚙️| **Architecture** | The codebase is organized around shell scripts for performing various common tasks, arranged in directories based on their role (e.g., "common", "files", "install", "templates").    |
| 📄| **Documentation** | Lack of comprehensive documentation within the codebase. Better inline commenting, README or Wiki would improve clarity for other developers using this repository.                     |
| 🔗| **Dependencies** | Scripts are mostly self-contained. There are some dependencies or assumptions for available tools like `conda`, `pytest`, `coverage.py`, `Java 11`, `Python 3.7`.                           |
| 🧩| **Modularity** | The code is modular, each script performs a distinct operation which allows for easy updates and interchanging when necessary.                                                           |
| 🧪| **Testing** | A testing strategy using `pytest` and the `coverage.py` library is implemented in the `test.sh` script. However, the repository doesn't have dedicated tests.                               |
| ⚡️| **Performance** | The repository is composed of helper scripts that perform specific tasks. The performance of each script depends on the task it performs and can vary.                                         |
| 🔐| **Security** | Security practices aren't explicitly addressed. Shell scripts could be dangerous if not handled carefully. However, no immediate security flaws are apparent.                              |
| 🔀| **Version Control** | Utilizes Git for version control. Preparation for pre-commit configuration indicates a strategy for clean commits.                                                           |
| 🔌| **Integrations** | The codebase includes scripts for integrating with docker and virtual environments like `conda`. It also includes `JUnit` installation for PyFlink testing.                           |
| 📶| **Scalability** | Scripts are individually scalable. However, due to lack of integration tests or high-level orchestration, determined scalability of the entire system is a challenge.                  |

---


##  Repository Structure

```sh
└── shellbox/
    ├── .deepsource.toml
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

| File                                                                              | Summary                                                                                                                                                                                                                                                                                                                                                                      |
| ---                                                                               | ---                                                                                                                                                                                                                                                                                                                                                                          |
| [.deepsource.toml](https://github.com/eli64s/shellbox/blob/main/.deepsource.toml) | This code sctructure contains various shell scripts used to perform tasks like cleaning, testing, running, modifying filenames, moving directories, installing Micromamba & PyFlink, and creating new Python projects. It also includes a `.deepsource.toml` configuration file setting the version and specifying the analyzer to be used, in this case, for shell scripts. |

</details>

<details closed><summary>Install</summary>

| File                                                                                | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---                                                                                 | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| [micromamba.sh](https://github.com/eli64s/shellbox/blob/main/install/micromamba.sh) | The install/micromamba.sh bash script identifies the host operating system, downloads the latest Micromamba version matching that OS, and sets it as executable. The script then moves it to a directory within the system path for ease of access, initializes Micromamba for a bash shell, and configures it to use the conda-forge channel by default. It's part of a broader codebase managing shell scripts for tasks like cleaning, testing, and modifying filenames. |
| [pyflink.sh](https://github.com/eli64s/shellbox/blob/main/install/pyflink.sh)       | The pyflink.sh script checks for Java 11 and Python 3.7 installations and installs them if missing. It then downloads, extracts, and renames the PyFlink package. It sets environment variables for FLINK_HOME, PATH, and PYTHONPATH. Finally, the script creates zsh aliases for running, submitting, and stopping PyFlink jobs. This facilitates the setup process for PyFlink development environment.                                                                   |

</details>

<details closed><summary>Common</summary>

| File                                                                     | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ---                                                                      | ---                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| [run.sh](https://github.com/eli64s/shellbox/blob/main/common/run.sh)     | The provided `run.sh` shell script operates as a straightforward execution manager. It initiates execution logging with timestamps, eloquently handles errors, and activates a pre-specified Conda environment named my_env. Then, it updates pip, Python's package installer, to its latest version. The completion of the execution process is also logged with a timestamp for clarity and traceability.                                   |
| [clean.sh](https://github.com/eli64s/shellbox/blob/main/common/clean.sh) | The bash script clean.sh provides utilities to cleanse a project directory. It removes build artifacts, Python file artifacts, test and coverage artifacts, and backup and Python cache files. It allows selective cleaning via specific commands or a comprehensive cleanup through the clean command. It supports error handling by checking command line arguments and gives assistance for usage.                                         |
| [test.sh](https://github.com/eli64s/shellbox/blob/main/common/test.sh)   | This shell script tests a Python project's code coverage using pytest and the coverage.py library. It activates a virtual environment, sets up source directories to cover, specifies file/directory omissions, then runs and reports test coverage. Results are failed if coverage falls under 90%. The code resides as part of a larger structure, providing test functionality within Shellbox, a collection of scripts for project tasks. |

</details>

<details closed><summary>Files</summary>

| File                                                                                          | Summary                                                                                                                                                                                                                                                                                                                                                        |
| ---                                                                                           | ---                                                                                                                                                                                                                                                                                                                                                            |
| [modify_filenames.sh](https://github.com/eli64s/shellbox/blob/main/files/modify_filenames.sh) | The script in files/modify_filenames.sh navigates to a specified directory /GitHub/readme-ai/docs, checks for files, and if found, converts the filename to lowercase and replaces underscores with hyphens. If the converted filename differs from the original, it renames the file and outputs the change. It will exit if the directory path is incorrect. |
| [move_directory.sh](https://github.com/eli64s/shellbox/blob/main/files/move_directory.sh)     | The provided Bash script, located in the `files` directory, moves a specified folder-GitHub/readme-ai/docs/archive-into another directory named Documents/folder, if both exist. If either directory doesn't exist, it prints an error message indicating which one is missing.                                                                                |

</details>

<details closed><summary>Templates</summary>

| File                                                                                                | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ---                                                                                                 | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| [create_py_project.sh](https://github.com/eli64s/shellbox/blob/main/templates/create_py_project.sh) | The code consists of a bash script that automates the creation of a Python project. Specifically, it creates essential directories, Python scripts, configuration files, and setup files required for a Python package. It also generates a Dockerfile and a docker-compose file for containerization purposes. Additional files like a pre-commit config and a.gitignore file are created to interact with git. Specific automated configuration includes setting up a logger, data classes, main script, and a basic configuration script. |

</details>

---

##  Getting Started

***Dependencies***

Please ensure you have the following dependencies installed on your system:

`- ℹ️ Dependency 1`

`- ℹ️ Dependency 2`

`- ℹ️ ...`

###  Installation

1. Clone the shellbox repository:
```sh
git clone https://github.com/eli64s/shellbox
```

2. Change to the project directory:
```sh
cd shellbox
```

3. Install the dependencies:
```sh
chmod +x main.sh
```

###  Running shellbox

```sh
./main.sh
```

###  Tests
```sh
bats *.bats
```

---


##  Project Roadmap

> - [X] `ℹ️  Task 1: Implement X`
> - [ ] `ℹ️  Task 2: Implement Y`
> - [ ] `ℹ️ ...`


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


This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

##  Acknowledgments

- List any resources, contributors, inspiration, etc. here.

[**Return**](#Top)

---
