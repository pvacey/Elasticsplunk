#!/usr/bin/python
import sys
import json
import requests
import argparse

parser = argparse.ArgumentParser(description='Add Data to Elasticsearch.')
parser.add_argument('--server', dest='server', default='localhost', required=False,
                    help='IP or hostname of the Elasticsearch server, defaults to localhost')
parser.add_argument('--index', dest='index', required=True,
                    help='index to post the data to')
parser.add_argument('--sourcetype', dest='stype', required=True,
                    help='sourcetype to post the data to')
parser.add_argument('data', nargs=1, default='',
                    help='data to be entered into Elasticsearch (must be enclosed in quotation marks)')
args = parser.parse_args()

url = 'http://{}:9200/{}/{}/'.format(args.server, args.index, args.stype,args.data[0])
response = requests.post(url, data=args.data[0])
r = json.loads(response.text)
print url
print r
