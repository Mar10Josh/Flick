from flask import Flask, render_template


app = Flask("Name Here")
@app.route('/')
def index():
    return render_template("about.html")
app.run(host='0.0.0.0', port=8080)