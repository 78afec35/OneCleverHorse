import random
import json
from flask import Flask, request, render_template, Responce
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)


@app.route('/comb', methods=['GET', 'POST'])
def comb():
    adj1 = request.args.get('http://localhost:5001/adj')
    adj2 = request.args.get('http://localhost:5001/adj')
    noun1 = request.args.get('http://localhost:5002/noun')
    noun2 = request.args.get('http://localhost:5002/noun')
    rcomb = txt.title(adj1)+txt.title(noun1)+txt.title(adj2)+txt.title(noun2)
    return Responce( str(rcomb), mimetype='text/plain' )


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
