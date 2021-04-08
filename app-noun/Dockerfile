FROM python:latest
RUN apt-get update && apt-get install -y python3-pip
COPY . .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["/usr/local/bin/python3", "app.py"]

