from flask import make_response, jsonify

def send_response(message: str, status_code: int, data=None):
    """ Creates a formatted response """
    body = { 'message': message, 'status_code': status_code }
    if data is not None:
        body['data'] = data
    response = make_response(jsonify(body))
    response.status_code = status_code
    return response