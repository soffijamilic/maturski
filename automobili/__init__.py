import os
from flask import Flask,render_template,request
from .db import get_db
from .oglas import search,bp

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

    from . import oglas
    app.register_blueprint(oglas.bp)
    
    app.config['LOGO_FOLDER'] = 'static/slike'
    
    @app.route('/')
    def home():
        #print("Home URL:", request.url)
        marke=get_db().execute('SELECT * FROM marka')
        modeli=get_db().execute('SELECT * FROM model')
        goriva=get_db().execute('SELECT * FROM gorivo')
        menjaci=get_db().execute('SELECT * FROM menjac')
<<<<<<< HEAD
        # oglasi=[
        #     {
        #         'id':1,
        #         'title':'VW Golf',
        #         'body':'VW Golf 1.6 TDI',
        #         'cena': 3000,
        #         'godiste': 2005,
        #         'kilometraza': 150000,
        #     }
        # ]
        oglasi = search()
        print(oglasi)
        return render_template('home.html',marke=marke,goriva=goriva,tipovi_vozila=tipovi_vozila,menjaci=menjaci,oglasi=oglasi)
=======
        ''' godiste_od = request.form.get('godiste_od')
        godiste_do = request.form.get('godiste_do')'''
        godista= get_db().execute('SELECT * FROM godiste')
        selected_marka = request.args.get('marka')

        return render_template('home.html',marke=marke,modeli=modeli,goriva=goriva,menjaci=menjaci,godista=godista,selected_marka=selected_marka)
>>>>>>> main
        
    return app


