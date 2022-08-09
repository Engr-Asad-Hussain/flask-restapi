from flask import current_app as app
import mariadb

class Database:
    _database = app.config['DATABASE']
    _username = app.config['DB_USERNAME']
    _password = app.config['DB_PASSWORD']
    _host     = app.config['DB_HOST']
    _port     = app.config['DB_PORT']
    _conn      = None
    
    def get_conn(cls):
        try:
            conn = mariadb.connect(
                
            )
            cls._conn = conn
        except mariadb.Error as e:
            raise ConnectionError(f'Unable to connect database. {e}')