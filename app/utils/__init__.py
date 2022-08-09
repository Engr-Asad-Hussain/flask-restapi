from flask import make_response, jsonify

def send_response(message: str, status_code: int, data: dict = None):
    """ Creates a formatted response """
    body = { 'message': message, 'status_code': status_code }
    if data is not None:
        body['data'] = data
    response = make_response(jsonify(body))
    response.status_code = status_code
    return response

class Response:
    _errors = {
        'Exception': (send_response, 500)
    }

    def send(self, error):
        error_type = type(error).__name__
        error_details = str(error)
        resp, error_code = self._errors.get(error_type, 'Exception')
        return resp(error_details, error_code)