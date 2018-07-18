from flask import Blueprint


main = Blueprint('main', __name__)


@main.route("/")
def index():
    try:
        with open('version.txt', 'r') as f:
            _hash = f.read()
    except FileNotFoundError:
        _hash = 'version.txt not found'
    return f'Hello {_hash}'
