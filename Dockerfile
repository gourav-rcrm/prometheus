FROM --platform=linux/amd64 python:3.10.5-alpine3.16 as prod

RUN mkdir /app/
WORKDIR /app/

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY ./ /app/

ENV FLASK_APP=prometheus.py
CMD flask run -h 0.0.0 -p 5000