FROM python:3

WORKDIR /usr/src/app

COPY ./requirements.txt ./requirements.txt
RUN pip install -U --no-cache-dir -r requirements.txt
COPY ./app .

EXPOSE 5000
CMD uwsgi --socket 0.0.0.0:5000 --protocol=uwsgi -w wsgi:app
