#!/bin/bash
if ! type git > /dev/null; then
	apt install -y git
fi
if ! type curl > /dev/null; then
	apt install -y curl
fi
if ! type berks > /dev/null; then
    curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk
fi
if [ ! -f chef.json ]; then
    cp chef.example.json chef.json
fi
berks vendor ./cookbooks
chef-client -z -j $(pwd)/chef.json
