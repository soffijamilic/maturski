import os
from flask import Flask


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'maturski.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    from . import db
    db.init_app(app)
    return app

"""from flask import Flask, render_template
import os

from oglasi.db import get_db


def create_app():
    app = Flask(__name__, instance_relative_config=True)
    
    app.config.from_mapping(
        SECRET_KEY='0140d7e9-6189-4d9b-8d20-7d7e067bf11e',
        DATABASE=os.path.join(app.instance_path, 'oglasi.sqlite'),
    )

    
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    from . import db
    db.init_app(app)
    
    from . import auth, oglas
    app.register_blueprint(auth.bp)
    app.register_blueprint(oglas.bp)
    app.add_url_rule('/', endpoint='index')
    @app.route("/heartbeat", methods=["GET"])
    def heartbeat():
        return "OK", 200

    @app.route("/", methods=["GET"])
    def index():
        db = get_db()
        oglasi = db.execute("SELECT * FROM oglas JOIN kategorija ON oglas.kategorija_id = kategorija.id").fetchall()
        print(oglasi[0]['naziv'])
        return render_template("oglas/index.html", oglasi=oglasi)
    return app

"""