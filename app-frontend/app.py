import random
import json
import requests
from flask import Flask, request, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def home():
    rcomb = request.args.get('rcomb','http://appnoun:5003/rcomb')
    return render_template('index.html', rcomb=str(rcomb))


if __name__=='__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
