#!/bin/bash
python ./write_elasticsearch.py --index test --sourcetype messages '{"message":"hello world"}'
python ./write_elasticsearch.py --index test --sourcetype messages '{"message":"data is a thing"}'
python ./write_elasticsearch.py --index test --sourcetype messages '{"message":"I need to get automatic json parsing to work properly for these input method", "author":"paulvacey"}'
python ./write_elasticsearch.py --index test --sourcetype messages '{"message":"This does not need to be so difficult", "author":"paulvacey", "comment": "wtf"}'
python ./write_elasticsearch.py --index test --sourcetype messages '{"message":"This is frustrating", "author": "paulvacey", "comment" : "wtf"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"message":"This is a message in the other index", "author": "paulvacey"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"message":"such indexing", "comment": "wow"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"message":"such indexing", "comment": "wow"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"datetime":"2017-01-01 00:00:00","message":"much indexing", "comment": "holy cow"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"_time":"2017-01-02 00:00:00","message":"more indexing", "comment": "holy moly"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"_time":"1483423200","message":"much more indexing", "comment": "holy moly rolly"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"_time":"1483426200","message":"much much more indexing", "comment": "holy rolly"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"_time":"1483429200","message":"less more indexing", "comment": "moly rolly"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"_time":"1483429200","message":"less more indexing", "comment": "holy rolly"}'
python ./write_elasticsearch.py --index other --sourcetype messages '{"_time":"1483430900","message":"much less indexing", "comment": "rolly moly"}'
