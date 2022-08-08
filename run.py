""" This is the application factory structure of Python-flask """
""" Entry point of this application. This file will start the dev/prod server """

from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(host='0.0.0.0')

# 0.0.0.0
# When you do not specify SERVER_NAME, it takes default None value. 
# It means that you specify app.run(host=None) command. 
# Now, what happens when you do like this? The answer is, when you create a container 
# from Dockerfile, and do a quick Postman hit at health_check, you will observed that 
# the hits are not getting into your flask application even specifying the -p flag in 
# the docker run command.
# On the other hand, if you specify SERVER_NAME='0.0.0.0' you will observed that your 
# docker container will now receiving hits from the outside.