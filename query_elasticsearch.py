#!/usr/bin/python
import sys
import json
import requests
import argparse

parser = argparse.ArgumentParser(description='Query Elasticsearch.')
parser.add_argument('--server', dest='server', default='localhost', required=False,
                    help='IP or hostname of the Elasticsearch server, defaults to localhost')
parser.add_argument('--index', dest='index', default='_all', required=False,
                    help='index to query the data from, defaults to all')
parser.add_argument('--sourcetype', dest='stype', default='', required=False,
                    help='sourcetype to query the data from, defaults to all')
parser.add_argument('query', nargs=1, default='',
                    help='search terms (must be enclosed in quotation marks)')
args = parser.parse_args()

url = 'http://{}:9200/{}/{}/_search?q={}'.format(args.server, args.index, args.stype, args.query[0])
response = requests.get(url)
r = json.loads(response.text)

if response.status_code == 200:
    results = r['hits']['hits']
    for row in results:
        print json.dumps(row['_source'])
