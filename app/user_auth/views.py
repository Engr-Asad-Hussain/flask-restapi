from flask import request
from app.utils import send_response
from app.user_auth import bp

@bp.route('/user/signup', methods=['POST'])
def registration():
    payload = request.json
    if not ('name' in payload and 'username' in payload and 'password' in payload):
        return send_response(message='Invalid body parameters', status_code=406)