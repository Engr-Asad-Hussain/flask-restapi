""" This is the application factory structure of Python-flask """
""" Entry point of this application. This file will start the dev/prod server """

from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run()