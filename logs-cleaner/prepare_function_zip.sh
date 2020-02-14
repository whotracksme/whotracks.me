#!/usr/bin/env bash
set -e
prepare_function_zip(){
	cd deploy
	echo "Installing required packages"
	pip3 install --target ./package -r ../lambdas/requirements.txt
	cd package
	echo "Adding packages to a zip file"
	zip -r9 ${OLDPWD}/function.zip .
	cd $OLDPWD
	echo "Adding function code to zip file"
	zip -g function.zip ../lambdas/lambda_function.py
	echo "Clean up"
	rm -rf package
	echo "Function zip file is ready !!!"
}
prepare_function_zip 