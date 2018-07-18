from flask import Blueprint


main = Blueprint('main', __name__)


@main.route("/")
def index():
    with open('version.txt', 'r') as f:
        _hash = f.read()
    return f'Hello {_hash}'
