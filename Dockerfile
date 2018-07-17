FROM python:3.6

RUN pip install \
    flask==1.0.2

EXPOSE 5000

RUN mkdir /code
WORKDIR /code
ADD app.py .

CMD ["python", "app.py"]
