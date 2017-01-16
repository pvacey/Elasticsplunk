#Elasticsplunk

Elasticsplunk is a splunk custom command for querying elasticsearch.

![preview of elasticsearch command in splunk](/preview.png)

## What do I do with these files?
- clone this repo into `$SPLUNK_HOME/etc/apps/`

### Testing Tools
- `write_elasticsearch.py`- cli tool for writing data to elasticsearch
- `query_elasticsearch.py` - cli tool for reading/querying data from elasticsearch
- `test_data.py` - a quick script to populate some *fairly useless* test data into elasticsearch

## Usage
### Reading from Elasticsearch

####search by keyword
via splunk command
```
| elasticsearch --index=test --sourcetype=mydata "hello"
```
via CLI tool
```
~$./query_elasticsearch.py --index=test --sourcetype=mydata "hello"
```
results
```
{"message": "hello world"}
```
####search by keyword in a particular field
via splunk command
```
| elasticsearch --index=test --sourcetype=mydata "message:hello"
```
via CLI tool
```
~$./query_elasticsearch.py --index=test --sourcetype=mydata "message:hello"
```
results
```
{"message": "hello world"}
```
####wildcards in search
via splunk command
```
| elasticsearch --index=test --sourcetype=mydata "hel*"
```
via CLI tool
```
~$./query_elasticsearch.py --index=test --sourcetype=mydata "hel*"
```
results
```
{"message": "hello world"}
```
#### both the index and sourcetype parameters are optional
via splunk command
```
| elasticsearch "hello"
```
via CLI tool
```
~$ ./query_elasticsearch.py "hello"
```
results
```
{"message": "hello world"}
```
do `--help` or `-h` for more usage information
```#
~$ query_elasticsearch.py --help
usage: query_elasticsearch.py [-h] [--server SERVER] [--index INDEX]
                              [--sourcetype STYPE]
                              query

Query Elasticsearch.

positional arguments:
  query               search terms (must be enclosed in quotation marks)

optional arguments:
  -h, --help          show this help message and exit
  --server SERVER     IP or hostname of the Elasticsearch server, defaults to
                      localhost
  --index INDEX       index to query the data from, defaults to all
  --sourcetype STYPE  sourcetype to query the data from, defaults to all
```

### Writing to Elasticsearch
example of writing a field named `message` with the value `hello world` to the elasticsearch running on localhost
```
$ ./write_elasticsearch.py --index=test --sourcetype=mydata '{"message":"hello world"}'
http://localhost:9200/test/mydata/
{u'_type': u'mydata', u'created': True, u'_shards': {u'successful': 1, u'failed': 0, u'total': 2}, u'_version': 1, u'_index': u'test', u'_id': u'AVmeReH0dL8qVvomvAuM'}
```

do `--help` or `-h` for more usage information
```
~$ write_elasticsearch.py --help
usage: write_elasticsearch.py [-h] [--server SERVER] --index INDEX
                              --sourcetype STYPE
                              data

Add Data to Elasticsearch.

positional arguments:
  data                data to be entered into Elasticsearch (must be enclosed
                      in quotation marks)

optional arguments:
  -h, --help          show this help message and exit
  --server SERVER     IP or hostname of the Elasticsearch server, defaults to
                      localhost
  --index INDEX       index to post the data to
  --sourcetype STYPE  sourcetype to post the data to
```

## Notes
I run elasticsearch in docker to make my life easier.  When I get junk data in there I just kill the container, start a new one and run `test_data.py`

```
~$ docker run -p 9200:9200 elasticsearch
```

## References
https://www.elastic.co/guide/en/elasticsearch/reference/current/search-uri-request.html

https://hub.docker.com/_/elasticsearch/
