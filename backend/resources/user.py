from flask import request
from flask_restful import Resource
from Model import User, db
import random
import string

class UserResource(Resource):

    def post(self):
        json_data = request.get_json(force = True)
        # checks if data was passed
        if not json_data:
            return {'message' : "No input data passed"}, 400
        
        # checks if user already exist in db
        user = User.query.filter_by(username = json_data['username']).first()
        if user:
            return {'message' : "User already exist"}, 400
        user = User.query.filter_by(email = json_data['email']).first()
        if user:
            return {'message' : "Email already used by another user"}, 400
        
        key = self.generate_key()
        user = User.query.filter_by(api_key = key).first()
        if user: 
            return {'message' : "API key already exist"}

        # create new user object
        user = User (
            api_key = key,
            username = json_data['username'],
            password = json_data['password'],
            first_name = json_data['firstname'],
            last_name = json_data['lastname'],
            email = json_data['email']
        )

        # add user to database
        db.session.add(user)
        db.session.commit()

        # convert User object to string before return data
        result = User.serialize(user)

        return {'status' : "success", 'data' : result}, 201

    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(21))


    def get(self):
        users = User.query.all()
        user_list = []

        for i in range(0, len(users)):
            user_list.append(users[i].serialize())
        return {"status" : str(user_list)}, 200
    
    def put(self):
        json_data = request.get_json(force = True)

        # checks if data was passed with request
        if not json_data:
            return {'message' : "No input data passed"}, 400
        
        user = User.query.filter_by(id = json_data['id']).first()
        
        # check if user exist
        if not user:
            return {'message' : "User does not exist"}, 400
        
        user.username = json_data['username']
        db.session.commit()

        return { 'status': "success", 'newUsername': user.username }, 200
    
    def delete(self):
        json_data = request.get_json(force = True)
        if not json_data:
            return {'message' : "No input data passed"}, 400
        
        user = User.query.filter_by(id = json_data['id']).delete()

        if not user:
            return {'message' : "invalid user"}, 400
        db.session.commit()

        return {'status' : "success"}

        

    



    