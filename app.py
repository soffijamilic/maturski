import os
from flask import Flask,request,render_template

app = Flask(__name__)
app.config['LOGO_FOLDER'] = 'static/slike'

@app.route('/')
def home():
    return render_template("index.html",logo_path="loggo.png")

if __name__ == '__main__':
    app.run(debug=True)

@app.route('/honda')
def honda():
    return render_template("honda.html")

@app.route('/toyota')
def toyota():
    return render_template("toyota.html")

@app.route('/mazda')
def mazda():
    return render_template("mazda.html")

#@app.route('/login')
def login():
    return render_template("login.html")

#@app.route('/signup')
def signup():
    return render_template("signup.html")

#@app.route('/search',method=['GET'])
#def search():
 #   model=request.args.get("model")
    

app.run()

