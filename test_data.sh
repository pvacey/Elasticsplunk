#!/bin/bash
./write_elasticsearch.py --index test --sourcetype messages '{"message":"hello world"}'
./write_elasticsearch.py --index test --sourcetype messages '{"message":"data is a thing"}'
./write_elasticsearch.py --index test --sourcetype messages '{"message":"I need to get automatic json parsing to work properly for these input method", "author":"paulvacey"}'
./write_elasticsearch.py --index test --sourcetype messages '{"message":"This does not need to be so difficult", "author":"paulvacey", "comment": "wtf"}'
./write_elasticsearch.py --index test --sourcetype messages '{"message":"This is frustrating", "author": "paulvacey", "comment" : "wtf"}'
./write_elasticsearch.py --index other --sourcetype messages '{"message":"This is a message in the other index", "author": "paulvacey"}'
./write_elasticsearch.py --index other --sourcetype messages '{"message":"such indexing", "comment": "wow"}'
