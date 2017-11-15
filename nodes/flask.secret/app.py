from flask import Flask
from urlparse import urlparse
import requests
import os


app = Flask(__name__)

@app.route("/flag")
def hello():
    return "GOOD JOB!!!: " + os.environ['FLAG']

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0', port=35349)
