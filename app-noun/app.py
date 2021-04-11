import random, json
from flask import Flask, request, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

nounlist=[]
with open('nouns.json') as f:
	data = json.load(f)

for noun in data['nouns']:
	nounlist.append(noun)
randomnoun = random.choice(nounlist)

@app.route('/noun', methods=["GET"])
def noun():
	rnoun = randomnoun
  return rnoun

if __name__=='__main__':
  app.run(host='0.0.0.0', port=5002, debug=True)