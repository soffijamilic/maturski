from flask import Flask,request,render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/honda')
def honda():
    return render_template("honda.html")

@app.route('/toyota')
def toyota():
    return render_template("toyota.html")

@app.route('/mazda')
def mazda():
    return render_template("mazda.html")

@app.route('/login')
def login():
    return render_template("login.html")

@app.route('/signup')
def signup():
    return render_template("login.html")

#@app.route('/search',method=['GET'])
#def search():
 #   model=request.args.get("model")
    

app.run()

