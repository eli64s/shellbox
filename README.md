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


##  Project Structure

```sh
└── dots/
    ├── README.md
    ├── bash
    │   ├── builds
    │   ├── common
    │   ├── file-ops
    │   ├── install
    │   └── project-setup
    ├── git
    │   ├── .gitcommit_template
    │   ├── .gitconfig
    │   ├── .gitignore
    │   └── .gitignore_global
    ├── make
    │   ├── poetry
    │   └── uv
    ├── python
    │   ├── .ruff.toml
    │   ├── pyproject.toml
    │   └── pytest.ini
    ├── vscode
    │   └── settings.json
    └── zsh
        ├── .zshenv
        └── .zshrc
```

###  Project Index

<details open>
	<summary><b><code>DOTS/</code></b></summary>
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
				<td><b><a href='https://github.com/eli64s/dots/blob/master/python/pytest.ini'>pytest.ini</a></b></td>
				<td>- Configures pytest settings for test execution, coverage reporting, and asyncio behavior<br>- Sets test verbosity, duration, coverage thresholds, and paths<br>- Excludes specific lines from coverage, enforces coverage thresholds, and formats coverage reports<br>- Manages asyncio fixture scope and mode, and sets Python path for test discovery.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/python/pyproject.toml'>pyproject.toml</a></b></td>
				<td>- Generates README files using large language model APIs, enhancing developer productivity and documentation quality<br>- Integrates with various tools to streamline the process, ensuring consistency and efficiency in creating project documentation.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/python/.ruff.toml'>.ruff.toml</a></b></td>
				<td>Define codebase linting and formatting rules for Python project using .ruff.toml file, ensuring consistent code style and quality.</td>
			</tr>
			</table>
		</blockquote>
	</details>
	<details> <!-- zsh Submodule -->
		<summary><b>zsh</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/zsh/.zshrc'>.zshrc</a></b></td>
				<td>- The code file configures the Zsh shell environment by setting up aliases, functions, path modifications, completion settings, and keybindings<br>- It also handles directory navigation, history settings, and integrates tools like Poetry, Docker, and VS Code<br>- Additionally, it enables FZF settings and keybindings, and provides autocomplete functionality for the 'uv' command.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/zsh/.zshenv'>.zshenv</a></b></td>
				<td>Define environment variables for project paths in the zsh configuration file to ensure proper setup and execution.</td>
			</tr>
			</table>
		</blockquote>
	</details>
	<details> <!-- vscode Submodule -->
		<summary><b>vscode</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/vscode/settings.json'>settings.json</a></b></td>
				<td>- Configures various settings for the Visual Studio Code editor, including themes, font sizes, file associations, and language-specific formatting preferences<br>- Manages settings for Git integration, terminal behavior, and test frameworks<br>- Enhances the editor with plugins for Python, Docker, and more<br>- Optimizes the development environment for efficient coding and collaboration.</td>
			</tr>
			</table>
		</blockquote>
	</details>
	<details> <!-- git Submodule -->
		<summary><b>git</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/git/.gitcommit_template'>.gitcommit_template</a></b></td>
				<td>- Defines commit message template for clear and concise communication of changes made in the project<br>- Encourages detailed descriptions of "what" and "why" behind each commit, referencing related issues for better tracking<br>- Facilitates effective collaboration and understanding among team members.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/git/.gitignore_global'>.gitignore_global</a></b></td>
				<td>Exclude unnecessary files and directories from version control using the global .gitignore file to maintain a clean repository structure.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/eli64s/dots/blob/master/git/.gitconfig'>.gitconfig</a></b></td>
				<td>Configure Git settings for a streamlined workflow, including user info, editor preferences, commit templates, aliases for common commands, and visual enhancements like syntax highlighting.</td>
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
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/install/micromamba.sh'>micromamba.sh</a></b></td>
						<td>- Facilitates seamless installation and setup of Micromamba on Linux and macOS systems<br>- Automatically determines the OS type, downloads the latest Micromamba version, sets up executable permissions, moves it to a global path, initializes Micromamba, and configures it to use the conda-forge channel by default.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/install/local_dependencies_uninstall.sh'>local_dependencies_uninstall.sh</a></b></td>
						<td>- Perform local environment cleanup by uninstalling various dependencies like pyenv, goenv, Node.js, Poetry, Git, Git LFS, kubectl, kubectx, and Helm<br>- Additionally, clean up configuration files to ensure a fresh start<br>- The script logs each step and the total cleanup time, providing a streamlined process for resetting the local development environment.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/install/pyflink.sh'>pyflink.sh</a></b></td>
						<td>- Automates PyFlink setup by checking and installing Java 11, Python 3.7, and downloading PyFlink<br>- Sets environment variables and aliases for zsh, enabling seamless PyFlink usage.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/install/local_dependencies.sh'>local_dependencies.sh</a></b></td>
						<td>- Automates local environment setup by installing essential tools like Oh My Zsh, Homebrew, pyenv, Go, kubectl, Helm, Node.js, Poetry, Git, and Git LFS<br>- Updates shell configurations for seamless tool integration<br>- Verifies installations and provides a summary of the total installation time<br>- Ensures a smooth developer experience for building projects.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>file-ops</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/file-ops/chunk_docs.sh'>chunk_docs.sh</a></b></td>
						<td>Automates chunking and renaming of a Markdown document into 10 parts for improved readability and navigation in the project's documentation section.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/file-ops/aggregate_docs.sh'>aggregate_docs.sh</a></b></td>
						<td>- Automates concatenation of GitHub project documentation markdown files into a single file<br>- Clones the repository, searches for markdown files in predefined paths, and merges them<br>- Useful for enhancing context in learning more about a project's technical implementation.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/file-ops/modify_filenames.sh'>modify_filenames.sh</a></b></td>
						<td>Automates renaming files to lowercase with hyphens in a specified directory.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/file-ops/move_directory.sh'>move_directory.sh</a></b></td>
						<td>Moves a specified folder to a destination directory if both exist; otherwise, displays appropriate error messages.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>builds</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/builds/pypi.sh'>pypi.sh</a></b></td>
						<td>- Automates the deployment of a Python package to PyPI by cleaning, building, and uploading distribution files<br>- The script sets up necessary configurations and executes the deployment process seamlessly.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/builds/docker.sh'>docker.sh</a></b></td>
						<td>- Automates Docker image building, pushing, and multi-platform support<br>- Sets up Docker Buildx, builds and publishes the image, and completes the process.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>project-setup</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/project-setup/create_python_project.sh'>create_python_project.sh</a></b></td>
						<td>- Creates essential project directories, files, and configuration settings for a Python project setup<br>- Establishes a structured foundation for code organization, including key components like main script, configuration constants, and logger module<br>- Sets up necessary project dependencies, formatting tools, and environment setup scripts for streamlined development and deployment processes.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/project-setup/create_directory_structure.sh'>create_directory_structure.sh</a></b></td>
						<td>- Generates directory structure with files for a Markdown guide based on user input<br>- The script prompts for a base directory and creates a structured hierarchy with various Markdown files and directories<br>- This functionality aids in organizing and setting up a comprehensive Markdown guide within the project architecture.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>common</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/common/run.sh'>run.sh</a></b></td>
						<td>- Automate environment setup and package upgrades for the project using a bash script<br>- The script activates the conda environment, upgrades pip, and logs the execution start and end times.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/common/clean.sh'>clean.sh</a></b></td>
						<td>- The clean.sh script provides functions to remove various artifacts like build files, Python file artifacts, test and coverage artifacts, backup files, and cache files<br>- It offers commands to clean different types of artifacts within the project structure, ensuring a clean and organized codebase.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/bash/common/test.sh'>test.sh</a></b></td>
						<td>- Executes test coverage analysis for the 'readmeai' project, ensuring a minimum coverage threshold of 90%<br>- The script activates the 'readmeai' conda environment, runs pytest with coverage, and generates a report highlighting missing coverage.</td>
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
						<td><b><a href='https://github.com/eli64s/dots/blob/master/make/uv/Makefile'>Makefile</a></b></td>
						<td>- Facilitates managing project dependencies and virtual environments using Makefile commands<br>- Commands include installing dependencies, locking dependencies, syncing environments, and creating virtual environments<br>- The Makefile provides a structured approach to streamline development setup and maintenance tasks.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>poetry</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/eli64s/dots/blob/master/make/poetry/Makefile'>Makefile</a></b></td>
						<td>- Facilitates managing dependencies and environment for Poetry projects<br>- Includes commands to install dependencies, clean environment, remove environment, and generate requirements files<br>- Key for maintaining project dependencies and environment setup.</td>
					</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
</details>

---

##  Getting Started

The majority of files in this repository are configuration related. If you're looking for utility scripts to automate tasks, you can find them in the `bash` directory.

### Installation

To get started with the utility scripts, build the project from source:

1. Clone the dots repository:
```sh
❯ git clone https://github.com/eli64s/dots
```

2. Navigate to the project directory:
```sh
❯ cd dots
```

### Running Scripts

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

<div align="left">
    <a href="#-configurations-files-and-utility-scripts">
        <img src="assets/button.svg" width="100px" height="100px" alt="return-button">
    </a>
</div>

<img width="100%" height="4px" src="assets/line.svg" alt="line">

<!-- REFERENCE LINKS -->

[return-button]: assets/button.svg
