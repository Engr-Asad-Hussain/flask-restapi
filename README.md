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

`app.run(host='0.0.0.0')`
- When you do not specify SERVER_NAME, it takes default None value. 
- It means that you specify `app.run(host=None)` command.
- Now, what happens when you do like this? The answer is, when you create a container 
from Dockerfile, and do a quick Postman hit at health_check, you will observed that 
the hits are not getting into your flask application even specifying the `-p` flag in 
the `docker run` command.
- On the other hand, if you specify `SERVER_NAME='0.0.0.0'` you will observed that your 
docker container will now receiving hits from the outside.