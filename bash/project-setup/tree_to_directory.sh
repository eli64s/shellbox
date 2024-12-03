#!/bin/bash

# Create base directory
mkdir -p vector-svg-generator
cd vector-svg-generator

# Create src directory and its contents
mkdir -p src/core
mkdir -p src/templates/{banners,icons,elements}
mkdir -p src/api
mkdir -p src/cli
mkdir -p src/utils
mkdir -p src/tests

# Create core files
touch src/__init__.py
touch src/core/{__init__.py,template_engine.py,ai_generator.py,svg_renderer.py,color_palette.py,shape_library.py,metadata_manager.py}

# Create template files
touch src/templates/banners/{tech_banner.xml,minimalist_banner.xml}
touch src/templates/icons/{gear_icon.xml,cloud_icon.xml}
touch src/templates/elements/{button_frame.xml,arrow_element.xml}
touch src/templates/shared_components.xml

# Create API files
touch src/api/{__init__.py,endpoints.py,request_models.py}

# Create CLI files
touch src/cli/{__init__.py,cli_runner.py}

# Create utils files
touch src/utils/{__init__.py,file_manager.py,svg_optimizer.py,math_utils.py}

# Create test files
touch src/tests/{__init__.py,test_templates.py,test_svg_renderer.py,test_api_endpoints.py,test_cli_runner.py}
touch src/main.py

# Create asset structure
mkdir -p assets/{generated,examples,styles}

# Create docs
mkdir -p docs
touch docs/{README.md,API.md,CONTRIBUTING.md}

# Create configs
mkdir -p configs
touch configs/{app_config.yaml,ai_model_config.yaml,svg_templates_config.yaml,styles_config.yaml}

# Create examples
mkdir -p examples
touch examples/{example_banner.py,example_icon.py}

# Create root files
touch {requirements.txt,pyproject.toml,Dockerfile,Makefile}

# Create test structure
mkdir -p tests/{unit,integration}
touch tests/unit/{test_template_engine.py,test_ai_generator.py,test_svg_renderer.py}
touch tests/integration/{test_endpoints.py,test_cli.py,test_metadata_manager.py}