#!/bin/bash
mkdir src/package
pip install --target ./src/package -r src/requirements.txt
cd ./src/package
zip -r ../deployment-package.zip .
cd ..
zip deployment-package.zip lambda.py
