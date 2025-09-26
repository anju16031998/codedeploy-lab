#!/bin/bash
set -xe

# Maven is used to build and create a war file
cd spring-boot-hello-world-example
mvn clean package -Dmaven.test.skip=true
