<div align="center">

<img src="assets/logo-rainbow.svg" alt="dots">

<p align="center">

#### ◎ Configurations files and utility scripts

</p>

<img src="https://img.shields.io/badge/Visual%20Studio%20Code-007ACC.svg?style=%7B0%7D&logo=Visual-Studio-Code&logoColor=white" alt="Visual%20Studio%20Code">

<img src="https://img.shields.io/badge/Python-3776AB.svg?style=flat-square&logo=Python&logoColor=white" alt="Python">

<img src="https://img.shields.io/badge/Pytest-0A9EDC.svg?style=flat-square&logo=Pytest&logoColor=white" alt="Pytest">

<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=flat-square&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash">

<img src="https://img.shields.io/badge/Ruff-D7FF64.svg?style=flat-square&logo=Ruff&logoColor=black" alt="Ruff">

<img src="https://img.shields.io/badge/Git-F05032.svg?style=flat-square&logo=Git&logoColor=white" alt="Git">

<img src="https://img.shields.io/badge/Zsh-F15A24.svg?style=flat-square&logo=Zsh&logoColor=white" alt="Zsh">

</div>

<img width="100%" height="4px" src="assets/line.svg" alt="line">

## Overview

All configurations files and utility scripts are organized into subdirectories based on their respective tools and purposes.

```sh
.
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE
├── Makefile
├── README.md
├── assets
│   ├── line.svg
│   └── logo.svg
├── bash
│   ├── builds
│   │   ├── docker.sh
│   │   └── pypi.sh
│   ├── common
│   │   ├── clean.sh
│   │   ├── run.sh
│   │   └── test.sh
│   ├── file-ops
│   │   ├── aggregate_docs.sh
│   │   ├── chunk_docs.sh
│   │   ├── modify_filenames.sh
│   │   └── move_directory.sh
│   ├── install
│   │   ├── local_dependencies.sh
│   │   ├── local_dependencies_uninstall.sh
│   │   ├── micromamba.sh
│   │   └── pyflink.sh
│   └── project-setup
│       ├── create_directory_structure.sh
│       └── create_python_project.sh
├── git
├── make
│   ├── poetry
│   │   └── Makefile
│   └── uv
│       └── Makefile
├── python
│   ├── pyproject.toml
│   └── pytest.ini
├── vscode
│   └── settings.json
└── zsh

15 directories, 27 files

```

For more details about the available configurations and utility scripts, please refer to the table below:

<details open>
    <summary><b><code>SHELLBOX/</code></b></summary>
    <details> <!-- __root__ Submodule -->
        <summary><b>__root__</b></summary>
        <blockquote>
            <table>
            </table>
        </blockquote>
    </details>
    <details> <!-- python Submodule -->
        <summary><b>python</b></summary>
        <blockquote>
            <table>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/python/pyproject.toml'>pyproject.toml</a></b></td>
                    <td>- Generates README files using large language model APIs, enhancing developer productivity and documentation quality<br>- Integrates with various tools and libraries to streamline the process<br>- Supports Python 3.9 and above, emphasizing simplicity and efficiency in creating informative READMEs<br>- Visit the project homepage for more details and documentation.</td>
                </tr>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/python/.ruff.toml'>.ruff.toml</a></b></td>
                    <td>- Define codebase linting and formatting rules using .ruff.toml configuration file to maintain code quality and consistency across the project<br>- The file specifies excluded directories, target Python version, linting rules, fixable issues, and code formatting settings.</td>
                </tr>
            </table>
        </blockquote>
    </details>
    <details> <!-- zsh Submodule -->
        <summary><b>zsh</b></summary>
        <blockquote>
            <table>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/zsh/.zshrc'>.zshrc</a></b></td>
                    <td>- Manages ZSH configuration, sets aliases, functions, and path modifications<br>- Sources Oh My ZSH, sets completion settings, and configures history<br>- Enables FZF settings and keybindings<br>- Handles 'uv' autocomplete<br>- Integrates Rust/Cargo and Google Cloud SDK paths<br>- Executes custom functions and autoloads<br>- Enhances shell navigation and history management.</td>
                </tr>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/zsh/.zshenv'>.zshenv</a></b></td>
                    <td>Define environment variables for project paths in the zsh configuration file to ensure proper setup and execution of the codebase.</td>
                </tr>
            </table>
        </blockquote>
    </details>
    <details> <!-- vscode Submodule -->
        <summary><b>vscode</b></summary>
        <blockquote>
            <table>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/vscode/settings.json'>settings.json</a></b></td>
                    <td>- Configures various settings for the Visual Studio Code editor, including themes, font sizes, language-specific formatters, and extensions<br>- Manages preferences for workbench, editor, terminal, Git, file associations, language-specific settings, Python analysis, Ruff, AutoDocstring, Test Explorer UI, Jupyter, Notebook, Markdown, GitHub Copilot, and miscellaneous options.</td>
                </tr>
            </table>
        </blockquote>
    </details>
    <details> <!-- git Submodule -->
        <summary><b>git</b></summary>
        <blockquote>
            <table>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/git/.gitcommit_template'>.gitcommit_template</a></b></td>
                    <td>- Defines a standardized commit message template for the project, ensuring concise and informative commit messages<br>- Encourages clear communication of changes made, their purpose, and any related issues<br>- Facilitates better tracking, understanding, and collaboration within the codebase.</td>
                </tr>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/git/.gitignore_global'>.gitignore_global</a></b></td>
                    <td>- Prevent unnecessary files from being tracked in the project repository by specifying global ignore patterns in the `.gitignore_global` file<br>- This ensures that common editor and system files are excluded, maintaining a clean and efficient version control system.</td>
                </tr>
                <tr>
                    <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/git/.gitconfig'>.gitconfig</a></b></td>
                    <td>- Configure Git settings for a streamlined workflow, including user info, editor preferences, commit templates, aliases, and visual enhancements<br>- Improve productivity with features like auto-rebasing, conflict resolution styles, and custom delta syntax highlighting.</td>
                </tr>
            </table>
        </blockquote>
    </details>
    <details> <!-- bash Submodule -->
        <summary><b>bash</b></summary>
        <blockquote>
            <details>
                <summary><b>install</b></summary>
                <blockquote>
                    <table>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/install/micromamba.sh'>micromamba.sh</a></b></td>
                            <td>- Facilitates seamless installation and setup of Micromamba, a lightweight package manager, across Linux and macOS systems<br>- Automatically determines the OS type, downloads the latest Micromamba version, configures it to use the conda-forge channel, and ensures it's executable from any location<br>- Simplifies the process for users to quickly leverage Micromamba for package management.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/install/local_dependencies_uninstall.sh'>local_dependencies_uninstall.sh</a></b></td>
                            <td>- Perform local environment cleanup by uninstalling various development tools and dependencies like pyenv, goenv, Node.js, Poetry, Git, Git LFS, kubectl, kubectx, and Helm<br>- Additionally, clean up any remaining configuration files to ensure a fresh start for the local environment<br>- The script logs each step and provides a summary of the cleanup time upon completion.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/install/pyflink.sh'>pyflink.sh</a></b></td>
                            <td>- Automates PyFlink setup by checking and installing Java 11, Python 3.7, and downloading PyFlink<br>- Sets environment variables and aliases for zsh, enabling easy PyFlink usage<br>- Streamlines the initial setup process for PyFlink development and execution within the project architecture.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/install/local_dependencies.sh'>local_dependencies.sh</a></b></td>
                            <td>- Automates local environment setup by installing essential tools like Oh My Zsh, Homebrew, Python, Go, kubectl, Helm, Node.js, Poetry, Git, and Git LFS<br>- Updates shell configurations for seamless tool integration<br>- Verifies successful installations and provides a summary of the total installation time<br>- Ideal for initializing a development environment quickly and efficiently.</td>
                        </tr>
                    </table>
                </blockquote>
            </details>
            <details>
                <summary><b>file-ops</b></summary>
                <blockquote>
                    <table>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/file-ops/chunk_docs.sh'>chunk_docs.sh</a></b></td>
                            <td>- Automates chunking and organizing documentation files into smaller, manageable parts<br>- This script splits a document into 10 sections based on line count, improving readability and navigation within the project's documentation structure.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/file-ops/aggregate_docs.sh'>aggregate_docs.sh</a></b></td>
                            <td>- Automates concatenation of GitHub project documentation markdown files into a single file<br>- Clones the repository, searches for markdown files in predefined paths, and merges them<br>- Useful for enhancing context in learning more about a project's technical implementation.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/file-ops/modify_filenames.sh'>modify_filenames.sh</a></b></td>
                            <td>- Automates renaming files in a specified folder to lowercase and replacing underscores with hyphens<br>- This script enhances file naming consistency within the project structure.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/file-ops/move_directory.sh'>move_directory.sh</a></b></td>
                            <td>- Moves a specified folder to a destination directory, checking for existence of both<br>- Displays success or failure messages accordingly.</td>
                        </tr>
                    </table>
                </blockquote>
            </details>
            <details>
                <summary><b>builds</b></summary>
                <blockquote>
                    <table>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/builds/pypi.sh'>pypi.sh</a></b></td>
                            <td>- Automates PyPI package deployment by cleaning, building, and uploading distribution files<br>- Integrates with PyPI API for seamless deployment of 'my-package'.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/builds/docker.sh'>docker.sh</a></b></td>
                            <td>- Automates Docker image building, pushing, and multi-platform support<br>- Sets up Docker Buildx, builds and publishes the image, and creates a multi-platform image<br>- The process is completed with the published image ready for use.</td>
                        </tr>
                    </table>
                </blockquote>
            </details>
            <details>
                <summary><b>project-setup</b></summary>
                <blockquote>
                    <table>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/project-setup/create_python_project.sh'>create_python_project.sh</a></b></td>
                            <td>- Creates essential project directories, files, and configuration settings for a Python project, including API and database configurations, logging setup, and project structure<br>- The script automates the initial project setup, ensuring a standardized layout and necessary components for seamless development and execution.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/project-setup/create_directory_structure.sh'>create_directory_structure.sh</a></b></td>
                            <td>- Generates directory structure for a Markdown guide with various subdirectories and files<br>- Prompts user for base directory and creates the specified structure accordingly<br>- The script ensures proper organization of Markdown content for easy reference and navigation.</td>
                        </tr>
                    </table>
                </blockquote>
            </details>
            <details>
                <summary><b>common</b></summary>
                <blockquote>
                    <table>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/common/run.sh'>run.sh</a></b></td>
                            <td>- Automate environment setup and package upgrades in the project by running the provided bash script<br>- The script activates the specified conda environment, upgrades pip, and logs the execution start and completion timestamps.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/common/clean.sh'>clean.sh</a></b></td>
                            <td>- Implement a script to clean various artifacts in the project, such as build, test, coverage, and Python file artifacts<br>- The script provides commands to remove specific types of artifacts, enhancing project maintenance and cleanliness.</td>
                        </tr>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/bash/common/test.sh'>test.sh</a></b></td>
                            <td>- Executes test coverage analysis for the project by running pytest with coverage reporting<br>- The script activates the 'readmeai' conda environment, sets source and omit directories, and generates a coverage report to ensure code quality.</td>
                        </tr>
                    </table>
                </blockquote>
            </details>
        </blockquote>
    </details>
    <details> <!-- make Submodule -->
        <summary><b>make</b></summary>
        <blockquote>
            <details>
                <summary><b>uv</b></summary>
                <blockquote>
                    <table>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/make/uv/Makefile'>Makefile</a></b></td>
                            <td>- Facilitates managing project dependencies and virtual environments using uv tool<br>- Includes commands for installing dependencies, locking versions, syncing environments, and creating virtual environments<br>- Enhances project maintainability and reproducibility.</td>
                        </tr>
                    </table>
                </blockquote>
            </details>
            <details>
                <summary><b>poetry</b></summary>
                <blockquote>
                    <table>
                        <tr>
                            <td><b><a href='/Users/k01101011/Documents/GitHub/shellbox/blob/master/make/poetry/Makefile'>Makefile</a></b></td>
                            <td>- Facilitates managing dependencies and environment for Poetry projects<br>- Includes commands to install dependencies, clean environment, remove environment, and generate requirements files<br>- Key for maintaining project dependencies and environment setup.</td>
                        </tr>
                    </table>
                </blockquote>
            </details>
        </blockquote>
    </details>
</details>

---

## Getting Started

The majority of files in this repository are configuration related. If you're looking for utility scripts to automate tasks, you can find them in the `bash` directory.

### Running Utility Scripts

My favorite script is [aggregate_docs.sh](bash/file-ops/aggregate_docs.sh), which concatenates all files from a GitHub repository into a single file. Define the repository URL, paths, and file formats to aggregate the files.

I've found this script useful for when working with large language model APIs, providing the model with robust context and latest updates on a given topic I'm researching.

You can run the script directly from the command line:

```sh
bash bash/file-ops/aggregate_docs.sh \
    -r https://github.com/pydantic/pydantic \
    -p docs \
    -o pydantic-docs.md \
    -n pydantic \
    -s "*.md"
```

You can also give the script executable permissions and run it directly:

```sh
chmod +x bash/file-ops/aggregate_docs.sh
```

And then run the script:

```sh
./aggregate_docs.sh \
    -r https://github.com/pydantic/pydantic \
    -p docs \
    -o pydantic-docs.md \
    -n pydantic \
    -s "*.md"
```

> [!TIP]
> The shell scripts in this repository are designed to automate repetitive tasks and enhance productivity. Feel free to explore and adapt them to your workflow.

---

<div align="right">
    <a href="#-configurations-files-and-utility-scripts">
        <img src="assets/button.svg" width="100px" height="100px" alt="return-button">
    </a>
</div>

<!-- REFERENCE LINKS -->

[return-button]: assets/button.svg
