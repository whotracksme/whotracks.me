## Deploying the lambda or changes to the lambda

Modify script as desired

Prepare function zip by running
`./prepare_function_zip.sh`
- Output
```
Installing required packages
Collecting ua_parser (from -r ../lambdas/requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/10/24/b13d43fbdc69b324be35058ee67e7c570ca728737bc37eadf92fa4668812/ua_parser-0.8.0-py2.py3-none-any.whl
Installing collected packages: ua-parser
Successfully installed ua-parser-0.8.0
Adding packages to a zip file
updating: ua_parser-0.8.0.dist-info/ (stored 0%)
updating: ua_parser-0.8.0.dist-info/METADATA (deflated 66%)
updating: ua_parser-0.8.0.dist-info/INSTALLER (stored 0%)
updating: ua_parser-0.8.0.dist-info/metadata.json (deflated 59%)
updating: ua_parser-0.8.0.dist-info/DESCRIPTION.rst (stored 0%)
updating: ua_parser-0.8.0.dist-info/WHEEL (deflated 14%)
updating: ua_parser-0.8.0.dist-info/top_level.txt (stored 0%)
updating: ua_parser-0.8.0.dist-info/RECORD (deflated 49%)
updating: ua_parser/ (stored 0%)
updating: ua_parser/user_agent_parser_test.py (deflated 75%)
updating: ua_parser/__init__.py (stored 0%)
updating: ua_parser/__pycache__/ (stored 0%)
updating: ua_parser/__pycache__/user_agent_parser_test.cpython-37.pyc (deflated 58%)
updating: ua_parser/__pycache__/__init__.cpython-37.pyc (deflated 20%)
updating: ua_parser/__pycache__/user_agent_parser.cpython-37.pyc (deflated 60%)
updating: ua_parser/__pycache__/_regexes.cpython-37.pyc (deflated 66%)
updating: ua_parser/user_agent_parser.py (deflated 80%)
updating: ua_parser/_regexes.py (deflated 83%)
Adding function code to zip file
updating: ../lambdas/lambda_function.py (deflated 58%)
Clean up
Function zip file is ready !!!
```

Using Terraform you can add the changes to the lambda by running 
`terraform apply`