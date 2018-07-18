FROM python:3.6

RUN pip install \
    Flask==1.0.2 \
    Flask-Testing==0.7.1

EXPOSE 5000

RUN mkdir /code
WORKDIR /code
ADD app.py .
ADD routes.py .
ADD test_endpoints.py .
ADD version.txt .

CMD ["python", "app.py"]
