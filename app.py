from flask import Flask


def create_app():
    _app = Flask(__name__)

    from routes import main
    _app.register_blueprint(main)

    return _app

app = create_app()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
