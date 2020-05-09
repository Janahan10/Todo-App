from flask import request
from flask_restful import Resource
from Model import User, db

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
        
        user = User (
            username = json_data['username'],
            password = json_data['password'],
            first_name = json_data['firstname'],
            last_name = json_data['lastname'],
        )

        db.session.add(user)
        db.session.commit()

        return {'status' : "succes", 'data' : user}, 201

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

        

    



    