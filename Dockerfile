FROM ubuntu:18.04

COPY . /app

RUN apt update &&\
    apt install -y python3 &&\
    apt install -y python3-venv &&\
    apt install -y python3-pip &&\
    apt install -y python3-flask

EXPOSE 5000

CMD cd /app &&\
    python3 -m venv venv &&\
    . venv/bin/activate &&\
    pip3 install -e . &&\
    export LC_ALL=C.UTF-8 &&\
    export LANG=C.UTF-8 &&\
    export FLASK_APP=js_example &&\
    flask run --host=0.0.0.0
