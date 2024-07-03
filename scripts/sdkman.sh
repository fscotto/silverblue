#!/usr/bin/env bash

echo -e "\n\nInstall SDKMan\n"
curl -s "https://get.sdkman.io" | bash
source "$HOME"/.sdkman/bin/sdkman-init.sh

sdk install java 17.0.10-tem
sdk install maven
sdk install quarkus
sdk install springboot