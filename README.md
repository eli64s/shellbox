<div align="center">
<h1 align="center">
  <img src="https://img.icons8.com/nolan/128/py.png" alt="py" style="display:inline-block;" height="75" />
  <img src="https://img.icons8.com/nolan/128/1A6DFF/C822FF/multiply.png" alt="multiply" style="display:inline-block;" height="45" />
  <img src="https://img.icons8.com/nolan/128/console.png" alt="console" style="display:inline-block;" height="75" />
  <br>PyAutoBash
</h1>
<h3 align="center">📍 Automate Python using the power of the Shell!</h3>
<h3 align="center">⚙️ Developed with the software and tools below:</h3>
<p align="center">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=for-the-badge&logo=GNU-Bash&logoColor=white" alt="Bash" />
<img src="https://img.shields.io/badge/Anaconda-44A833.svg?style=for-the-badge&logo=Anaconda&logoColor=white" alt="Anaconda" />
<img src="https://img.shields.io/badge/Python-3776AB.svg?style=for-the-badge&logo=Python&logoColor=white" alt="Python" />
<img src="https://img.shields.io/badge/Markdown-000000.svg?style=for-the-badge&logo=Markdown&logoColor=white" alt="Markdown" />
</p>
</div>

---

## 📚 Table of Contents
- [📚 Table of Contents](#-table-of-contents)
- [📍 Overview](#-overview)
- [💫 Features](#-features)
- [📂 Project Structure](#-project-structure)
- [🧩 Modules](#-modules)
- [🚀 Getting Started](#-getting-started)
  - [✅ Prerequisites](#-prerequisites)
  - [🖥 Installation](#-installation)
- [🗺 Roadmap](#-roadmap)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [👏 Acknowledgements](#-acknowledgements)
  - [Icons](#icons)

---


## 📍 Overview

PyAutoBash is a collection of Bash scripts designed to streamline common Python development processes, including creating project templates and cleaning up project directories. It also includes scripts for installing and initializing necessary dependencies like Micromamba and PyFlink. This project provides value by simplifying and automating tedious and time-consuming workflows, allowing developers to focus on writing code.

---

## 💫 Features

Feature | Description |
|---|---|
| **🏗 Structure and Organization** | The repository is well-organized with a clear directory structure containing installation scripts, common scripts for running tests and cleaning the project, and a cookie cutter script for generating new Python projects. |
| **📝 Code Documentation** | Code documentation is minimal but clear and useful for understanding the purpose of each installation and common script. |
| **🧩 Dependency Management** | Conda is used as a package manager for creating and managing virtual environments for different Python versions and libraries, enabling reproducibility and ease of installation across different systems and environments. |
| **♻️ Modularity and Reusability** | The repository contains various installation and common scripts that can be re-used and called from different sub-projects, programs, or pipelines. |
| **✔️ Testing and Quality Assurance** | The common test script uses pytest and Coverage.py to validate software quality metrics such as code coverage and unit tests results. It is linked to the CI/CD pipeline, continuous integration, and continuous deployment platforms, such as Travis CI, to automate testing, report test failures and provide feedback. |
| **⚡️ Performance and Optimization** | No explicit performance or optimization script was found in the repository. |
| **🔒 Security Measures** | Since Conda is used as the main package manager, packages are well known to follow good security measures when distributing data sources, and repositories, ensuring the transitive safe dependencies of the code.|
| **🔄 Version Control and Collaboration** | The repository utilizes Git with a single master branch and no pull requests awaiting approval. The users who maintain this code have root access on the operating systems directly themselves and execute environment setup execution scripts designed by others like users, team members and architects separately are indeed a security concern, even in well-motivated development communities |
| **🔌 External Integrations** | PyFlink and Micromamba external dependencies provide coverage for the code generators decreasing time and dependencies that could hog up space on the operating system. |
| **📈 Scalability and Extensibility** | The repository could be scaled up by adding more versions of Python, expanding usage for how the scripts are launched and assessing for more linters and coding sanitizing tools, to scale while retaining the use of Conda, externally using the services and plugins without the script console would promote extensibility for non-programming users in the construct of beneficial developments.

---

## 📂 Project Structure


```bash
repo
├── README.md
├── common
│   ├── clean.sh
│   ├── run.sh
│   └── test.sh
├── cookie_cutter
│   └── create_py_project.sh
└── installation
    ├── micromamba.sh
    └── pyflink.sh

4 directories, 7 files
```

---

## 🧩 Modules

<details closed><summary>Common</summary>

| File     | Summary                                                                                                                                                                                                                                                                                                                                                                                                       | Module          |
|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------|
| run.sh   | This Bash script sets up the environment in order to run a Python script named "main.py" located in the "src" folder. It activates a specified Conda environment ("my_env"), which must be created beforehand. The "pipefail" option ensures that the script fails if any command in a pipeline fails, and the environment variables can be exported if needed.                                               | common/run.sh   |
| clean.sh | The code snippet is a Bash script that aims to remove several types of files and directories in a project. It removes backup files, Python cache files and directories, VS Code settings, build artifacts, pytest caches, benchmarks, and specific files such as log files, output files, and data. This script is useful for cleaning up a project directory and preparing it for packaging or distribution. | common/clean.sh |
| test.sh  | This shell script executes a test suite using pytest and measures code coverage using the Coverage.py library. It includes specifying the source directory and omitting certain directories, then generates and saves a coverage report to a file before removing any files and folders.                                                                                                                      | common/test.sh  |

</details>

<details closed><summary>Cookie_cutter</summary>

| File                 | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Module                             |
|:---------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------|
| create_py_project.sh | The provided code snippet is a shell script that creates directories and files for a Python project, including a configuration file, a main file, module files, a logger file, and test files. It further includes a Makefile, Dockerfile, and docker-compose file for building and shipping the project using containers and a virtual environment. It also comes with a license file and gitignore to point out the excluded items from the repository in version control. | cookie_cutter/create_py_project.sh |

</details>

<details closed><summary>Installation</summary>

| File          | Summary                                                                                                                                                                                                                                                                                                                                                                             | Module                     |
|:--------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| micromamba.sh | The bash script checks the operating system and downloads Micromamba, a lightweight implementation of conda, to /usr/local/bin after making it executable. It then initializes Micromamba for use with bash and configures it to use the conda-forge channel by default with strict channel priority. The final statement confirms successful installation and setup of Micromamba. | installation/micromamba.sh |
| pyflink.sh    | This code snippet checks if Java 11 and Python 3.7 are installed on the system and installs them if they are not present. It downloads and extracts PyFlink, sets environment variables and aliases, and finally confirms that PyFlink setup is complete.                                                                                                                           | installation/pyflink.sh    |

</details>

---

## 🚀 Getting Started

### ✅ Prerequisites

- [Bash](https://www.gnu.org/software/bash/)
- [Python](https://www.python.org/)

### 🖥 Installation

1. Clone the PyAutoBash repository:
```sh
git clone https://github.com/eli64s/PyAutoBash
```

2. Change to the project directory:
```sh
cd PyAutoBash
```

---

## 🗺 Roadmap

- [ ] Create additional scripts for common Python development tasks.

---

## 🤝 Contributing

Contributions are welcome!  See [Contributor's Guide](./CONTRIBUTING.md) for more details.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

---

## 👏 Acknowledgements

### Icons
- <a  href="https://icons8.com/icon/52515/console">Console</a> icon by <a href="https://icons8.com">Icons8</a>
- <a  href="https://icons8.com/icon/110627/multiply">Multiply</a> icon by <a href="https://icons8.com">Icons8</a>
- <a  href="https://icons8.com/icon/59940/py">Py</a> icon by <a href="https://icons8.com">Icons8</a>

---
