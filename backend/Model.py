from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    # defines users table structure
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True, unique=True)
    username = db.Column(db.String, unique=True)
    password = db.Column(db.String())
    first_name = db.Column(db.String())
    last_name = db.Column(db.String())
    email = db.Column(db.String())
    api_key = db.Column(db.String())

    def __init__(self, api_key, username, password, first_name, last_name, email):
        self.username = username
        self.password = password
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.api_key = api_key

    def __repr__(self):
        return '<id {}'.formate(self.id)
    
    def serialize(self):
        return {
            'username' : self.username,
            'password' :self.password,
            'firstname' : self.first_name,
            'lastname' : self.last_name,
            'email' : self.email,
            'api_key' : self.api_key
        }


