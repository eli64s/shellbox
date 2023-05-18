
<div align="center">
<h1 align="center">
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" width="100" />
<br>
PyBash
</h1>
<h3 align="center">📍 Make your Python programming more powerful with Bash scripting.</h3>
<h3 align="center">🚀 Developed with the software and tools below.</h3>
<p align="center">

<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=for-the-badge&logo=GNU-Bash&logoColor=white" alt="" />
<img src="https://img.shields.io/badge/Markdown-000000.svg?style=for-the-badge&logo=Markdown&logoColor=white" alt="pack" />
</p>

</div>

---
## 📚 Table of Contents
- [📚 Table of Contents](#-table-of-contents)
- [📍Overview](#overview)
- [🔮 Feautres](#-feautres)
- [⚙️ Project Structure](#️-project-structure)
- [💻 Modules](#-modules)
- [🚀 Getting Started](#-getting-started)
  - [✅ Prerequisites](#-prerequisites)
  - [💻 Installation](#-installation)
  - [🤖 Using PyBash](#-using-pybash)
  - [🧪 Running Tests](#-running-tests)
- [🛠 Future Development](#-future-development)
- [🤝 Contributing](#-contributing)
- [🪪 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)

---

## 📍Overview

PyBash is a set of command shell scripts to help automate common tasks.

## 🔮 Feautres

> `[📌  INSERT-PROJECT-FEATURES]`

---

<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-github-open.svg" width="80" />

## ⚙️ Project Structure

```bash
repo
├── README.md
├── common
│   ├── clean.sh
│   ├── run.sh
│   └── test.sh
├── install
│   ├── micromamba.sh
│   └── pyflink.sh
└── misc
    └── create_project_template.sh

4 directories, 7 files
```
---

<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-src-open.svg" width="80" />

## 💻 Modules
<details closed><summary>Common</summary>

| File     | Summary                                                                                                                                                                                                                  | Module          |
|:---------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------|
| run.sh   | This code is a Bash script that activates a Conda environment and runs a Python script . It also sets environment variables if needed .                                                                                  | common/run.sh   |
| clean.sh | This code is a Bash script that cleans up files and directories related to Python , Jupyter notebooks , and pytest . It deletes Python cache files , build artifacts , Jupyter notebook checkpoints , and pytest cache . | common/clean.sh |
| test.sh  | This code is a Bash script that activates a conda environment , runs a coverage report , and then removes files and folders .                                                                                            | common/test.sh  |

</details>

<details closed><summary>Install</summary>

| File          | Summary                                                                                                                                                                                                                                      | Module                |
|:--------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------|
| micromamba.sh | This code is a Bash script that downloads and installs the latest version of Micromamba , a Python package manager , for the current operating system ( Linux or macOS ) . It also configures Micromamba to use the conda - forge channel by | install/micromamba.sh |
| pyflink.sh    | This code checks for Java 11 and Python 3. 7 installations , downloads and extracts PyFlink , sets environment variables , and sets aliases for zsh . It then prints a message indicating that the PyFlink setup is complete .               | install/pyflink.sh    |

</details>

<details closed><summary>Misc</summary>

| File                       | Summary                                                                                                                                                                           | Module                          |
|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------|
| create_project_template.sh | This code creates a project directory structure , creates files for configuration , logging , and main script , and adds code for the main script , configuration , and logging . | misc/create_project_template.sh |

</details>
<hr />

## 🚀 Getting Started

### ✅ Prerequisites

Before you begin, ensure that you have the following prerequisites installed:
> `[📌  INSERT-PROJECT-PREREQUISITES]`

### 💻 Installation

1. Clone the PyBash repository:
```sh
git clone https://github.com/eli64s/PyBash
```

2. Change to the project directory:
```sh
cd PyBash
```

3. Install the dependencies:
```sh
chmod +x main.sh
```

### 🤖 Using PyBash

```sh
./main.sh
```

### 🧪 Running Tests
```sh
#run tests
```

<hr />

## 🛠 Future Development
- [ ] Add more helper utility scripts.


---

## 🤝 Contributing
Contributions are always welcome! Please follow these steps:
1. Fork the project repository. This creates a copy of the project on your account that you can modify without affecting the original project.
2. Clone the forked repository to your local machine using a Git client like Git or GitHub Desktop.
3. Create a new branch with a descriptive name (e.g., `new-feature-branch` or `bugfix-issue-123`).
```sh
git checkout -b new-feature-branch
```
4. Make changes to the project's codebase.
5. Commit your changes to your local branch with a clear commit message that explains the changes you've made.
```sh
git commit -m 'Implemented new feature.'
```
6. Push your changes to your forked repository on GitHub using the following command
```sh
git push origin new-feature-branch
```
7. Create a pull request to the original repository.
Open a new pull request to the original project repository. In the pull request, describe the changes you've made and why they're necessary.
The project maintainers will review your changes and provide feedback or merge them into the main branch.

---

## 🪪 License

This project is licensed under the `[📌  INSERT-LICENSE-TYPE]` License. See the [LICENSE](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository) file for additional info.

---

## 🙏 Acknowledgments

[📌  INSERT-DESCRIPTION]


---

