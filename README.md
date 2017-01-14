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
