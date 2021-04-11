import random
import json
from flask import Flask, request, render_template, Response
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

adjlist = []
with open('adjs.json') as f:
    data = json.load(f)

for adj in data['adjs']:
    adjlist.append(adj)
randomadj = random.choice(adjlist)


@app.route('/adj', methods=['GET', 'POST'])
def adj():
    radj = randomadj
    return Responce( str(radj), mimetype='text/plain' )


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
