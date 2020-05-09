from flask import request
from flask_restful import Resource
from Model import User, db

class UserResource(Resource):
    def get(self):
        users = User.query.all()
        user_list = []

        for i in range(0, len(users)):
            user_list.append(users[i].serialize())
        return {"status" : str(user_list)}, 200

    def post(self):
        json_data = request.get_json(force = True)
        # checks if data was passed
        if not json_data:
            return {'message' : 'No input data passed'}, 400
        
        # checks if user already exist in db
        user = User.query.filter_by(username = json_data['username']).first()
        if user:
            return {"message" : 'User already exist'}, 400
        
        user = User (
            username = json_data['username'],
            password = json_data['password'],
            first_name = json_data['firstname'],
            last_name = json_data['lastname'],
            email_address = json_data['email']
        )

        db.session.add(user)
        db.session.commit()

        return {"status" : 'succes', "data" : user}



    