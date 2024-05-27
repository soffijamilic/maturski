import os
from flask import Flask,render_template,request
from .db import get_db


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

    from . import db
    db.init_app(app)

    from . import auth
    app.register_blueprint(auth.bp)
    app.config['LOGO_FOLDER'] = 'static/slike'
    
    @app.route('/')
    def home():
        #print("Home URL:", request.url)
        marke=get_db().execute('SELECT * FROM marka')
        return render_template('home.html',marke=marke)



    return app




"""@app.route('/honda')
def honda():
    #print("Honda URL:", request.url)
    return render_template('honda.html')

@app.route('/toyota')
def toyota():
    #print("Toyota URL:", request.url)
    return render_template('toyota.html')

@app.route('/mazda')
def mazda():
    #print("Mazda URL:", request.url)
    return render_template('mazda.html')"""



if __name__ == '__main__':
    app.run(debug=True)

