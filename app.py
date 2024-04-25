from flask import Flask,request,render_template

app = Flask(__name__)

@app.route('/')
def root():
    return 'Pocetna.'
@app.route('/home')
def home():
    return render_template("index.html")

@app.route('/honda')
def honda():
    return render_template("honda.html")
app.run()

