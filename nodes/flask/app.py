from flask import Flask, request, Response

app = Flask(__name__)

@app.route("/")
def hello():
    return "<a href= '/goo?url=https://www.yahoo.com'>YAHOO!</a>"

@app.route("/goo")
def go():
    import urllib
    import requests
    from urlparse import urlparse
    url = request.args.get('url')
    host = urlparse(url).hostname
    if host == 'flask_secret':
        return 'Danger ZONE!'
    else:
        print url
        return urllib.urlopen(url).read()


if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0', port=3000)
