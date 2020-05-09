#!flask/bin/python
from flask import Flask, jsonify
import lh3.api as lh3
from datetime import datetime

app = Flask(__name__)


@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify({'tasks': tasks})

@app.route('/lh3/api/v1.0/monthly', methods=['GET'])
def get_chats_monthly():
    client = lh3.Client()
    chats = client.chats()
    
    this_day = datetime.today()
    day = this_day.day
    year = this_day.year
    month = this_day.month

    all_chats = chats.list_month(year,month)
    return jsonify({'result': str(len(all_chats))})

@app.route('/lh3/api/v1.0/daily', methods=['GET'])
def get_chats_daily():
    client = lh3.Client()
    chats = client.chats()
    
    this_day = datetime.today()
    day = this_day.day
    year = this_day.year
    month = this_day.month

    all_chats = chats.list_day(year,month,day)
    
    return jsonify({'result': str(len(all_chats))})

@app.route('/lh3/api/v1.0/online_operators', methods=['GET'])
def get_chats_online_operators():
    client = lh3.Client()
    client.set_options(version = 'v1')
    users = client.all('users')
    num_users = 0
    for user in users.get_list():
        if user['show'] != u'chat' and user['show'] != u'available':
            continue

        # Is that user staffing any queue?
        staffing = False
        assignments = users.one(user['id']).all('assignments').get_list()
        for assignment in assignments:
            if assignment['enabled']:
                staffing = True

        # If so, then great!
        if staffing:
            num_users += 1


    return jsonify({'result': str(num_users)})

if __name__ == '__main__':
    app.run(debug=True)
