## Python Flask RestAPIs
A Python Flask Blueprint Factory Application for RestAPIs


`run.py`
- It is the entry point of the application. 
- Your entire application will start from `run.py`.
- This file will start the dev/prod server 

`config.py`
- This file contains the configuration of the application.
- All the secrets/tokens will be injected in config.py via environmental variables.

`requirements.txt`
- This file contains all the extensions/packages that are required for your application.

`Virtual Environment`
- It is recommended approach to create a virtual environment for your application
- `python -m virtualenv venv` will create a virtual environment for your application with a name as `venv`
- Activate the `venv` using `. venv/Scripts/activate` if you are using Powershell.

`flask`
- `pip install flask` to install flask
- `pip freeze > requirements.txt` command to enter your all the packages in `requirements.txt` file.
