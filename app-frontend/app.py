import random
import json
from flask import Flask, request, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)


@app.route('/', method=['GET', 'POST'])
def home():
    rcomb = request.get('http://localhost:5003/rcomb')
    return render_template('index.html', rcomb=rcomb)


if __name__=='__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
