FROM python:latest

WORKDIR /app
COPY . .

RUN pip install -r ./requirements.txt

ENV FLASK_APP=app.py

ENTRYPOINT [ "flask", "run", "--host=0.0.0.0" ]
