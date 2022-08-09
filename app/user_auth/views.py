from flask import request
from app.utils import Response, send_response
from app.user_auth import models, bp

@bp.route('/user/signup', methods=['POST'])
def registration():
    payload = request.json
    if not ('name' in payload and 'username' in payload and 'password' in payload):
        return send_response(message='Invalid body parameters', status_code=406)
    try:
        models.registration(payload)
    except Exception as err:
        return Response.send(err)
    return send_response(message='User successfully registered', status_code=201)