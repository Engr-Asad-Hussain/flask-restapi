from datetime import date
from os import stat
from flask import Flask
from importlib import import_module

def register_bp(app):
    for moduel_name in ['user_auth']:#, 'user_profile', 'user_roles']:
        module = import_module(f'app.{moduel_name}.views')
        app.register_blueprint(module.bp)

def create_app():
    app = Flask(__name__)

    with app.app_context():
        register_bp(app)

        @app.route('health_check', methods=['GET'])
        def health_check():
            from datetime import datetime
            from app.utils import send_response
            data = { 'datetime': datetime.now() }
            return send_response('User Service is Up!', status_code=200, data=data)
        return app
