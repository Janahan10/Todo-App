from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key = True, unique = True)
    username = db.Column(db.String, unique = True)
    password = db.Column(db.String())
    first_name = db.Column(db.String())
    last_name = db.Column(db.String())
    email_address = db.Column(db.String())
    api_key = db.Column(db.String())    

    def __init__(self, username, password, first_name, last_name, email_address, api_key):
        self.username = username
        self.password = password
        self.first_name = first_name
        self.last_name = last_name
        self.email_addres = email_address
        self.api_key = api_key

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True, unique=True)
    name = db.Column(db.String(150), unique=True, nullable=False)

    def __init__(self, name):
        self.name = name


class CategorySchema(ma.Schema):
    id = fields.Integer()
    name = fields.String(required=True)


class CommentSchema(ma.Schema):
    id = fields.Integer(dump_only=True)
    category_id = fields.Integer(required=True)
    comment = fields.String(required=True, validate=validate.Length(1))
    creation_date = fields.DateTime()