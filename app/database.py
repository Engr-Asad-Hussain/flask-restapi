from flask import current_app as app
import mariadb

class Database:
    _database = app.config['DATABASE']
    _username = app.config['DB_USERNAME']
    _password = app.config['DB_PASSWORD']
    _host     = app.config['DB_HOST']
    _port     = app.config['DB_PORT']
    _conn      = None
    
    @classmethod
    def get_conn(cls):
        print('Database get_conn')
        try:
            conn = mariadb.connect(
                database = cls._database,
                username = cls._username,
                password = cls._password,
                host = cls._host,
                port = cls._port
            )
            cls._conn = conn
        except mariadb.Error as e:
            raise ConnectionError(f'Unable to connect database. {e}')
    
    @classmethod
    def close(cls):
        print('Database close')
        cls._conn.close()
        cls._conn = None

    @classmethod
    def commit(cls):
        cls._conn.commit()

    def cursor(function):
        def wrapper(*args, **kwargs):
            results = function(*args, **kwargs)
        return wrapper

    @cursor
    def get():
        pass

    @cursor
    def post():
        pass

    @cursor
    def put():
        pass

    @cursor
    def delete():
        pass


@app.before_request
def database_conn():
    try:
        Database.get_conn()
    except Exception as e:
        from app.utils import Response
        return Response.send(e)

@app.after_request
def database_close():
    Database.close()
