from flask import Flask, jsonify, request
from prometheus_flask_exporter import PrometheusMetrics
from prometheus_client import Counter, generate_latest

app = Flask(__name__)

GET_REQUEST_COUNTER = Counter('http_get_requests_total', 'Total count of GET requests:')

metrics = PrometheusMetrics(app)

metrics.info('app_info', 'Application info', version='1.0.3')

@app.route('/', methods=['GET'])

def hello():
  return 'Прывiтанне, гэта тэст!' 

@app.route('/metrics')
def metrics():
    return generate_latest(), 200

if __name__== '_main_':
   app.run(host='0.0.0.0', debug=True)
   