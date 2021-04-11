import random, json
from flask import Flask, request, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)


@app.route('/')
def home():
	rcomb = request.get(localhost:5003/rcomb)
    return '<h1>{{rcomb}}</h1>'

if __name__=='__main__':
  app.run(host='0.0.0.0', port=5000, debug=True)