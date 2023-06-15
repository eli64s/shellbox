#!/bin/bash

# Check for Java 11 installation
if [[ -z $(java -version 2>&1 | grep "version \"11") ]]; then
    echo "Java 11 not found. Installing..."
    sudo apt-get update
    sudo apt-get install openjdk-11-jdk -y
fi

# Check for Python 3.7 installation
if [[ -z $(python3.7 -V 2>&1 | grep "Python 3.7") ]]; then
    echo "Python 3.7 not found. Installing..."
    sudo apt-get update
    sudo apt-get install python3.7 -y
fi

# Download and extract PyFlink
echo "Downloading PyFlink..."
wget https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=flink/flink-1.16.1/flink-1.16.1-bin-scala_2.12.tgz -O flink.tgz
echo "Extracting PyFlink..."
tar -xzf flink.tgz
rm flink.tgz
mv flink-* pyflink

# Set environment variables
echo "Setting environment variables..."
export FLINK_HOME=$(pwd)/pyflink
export PATH=$FLINK_HOME/bin:$PATH
export PYTHONPATH=$FLINK_HOME/python:$PYTHONPATH

# Set aliases for zsh
echo "Setting aliases for zsh..."
echo 'alias flink="flink run -p 1 -c"' >> ~/.zshrc
echo 'alias flink-submit="flink run -p 1 -m yarn-cluster -ynm PyFlink"' >> ~/.zshrc
echo 'alias flink-stop="flink cancel PyFlink"' >> ~/.zshrc

# Done!
echo "PyFlink setup complete."
