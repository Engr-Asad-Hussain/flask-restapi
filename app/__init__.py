from flask import Flask
from importlib import import_module

def register_blueprints(app):
    for moduel_name in ['user_auth']:#, 'user_profile', 'user_roles']:
        module = import_module(f'app.{moduel_name}.views')
        app.register_blueprint(module.bp)

def create_app():
    app = Flask()
    register_blueprints(app)

    return app