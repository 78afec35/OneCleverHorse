from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from os import getenv

app = Flask(__name__)
db = SQLAlchemy(app)

# Replace [PASSWORD] with the root password for your mysql container
app.config['SQLALCHEMY_DATABASE_URI'] = getenv("DATABASE_URI")

class Users(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(30), nullable=False)
	password = db.Column(db.String(30), nullable=False)

@app.route('/')
def hello():
  data1 = Users.query.all()
  return render_template('home.html', data1=data1)

if __name__=='__main__':
  app.run(host='0.0.0.0', port=5000, debug=True)