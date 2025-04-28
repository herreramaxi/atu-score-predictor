FROM python:3.8

ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8

WORKDIR /opt/flask_insurance
COPY requirements.txt .
RUN pip3 install -r requirements.txt 

RUN mkdir templates
COPY index.html templates
COPY result.html templates
COPY model.py .
COPY flaskapp.py .
COPY insurance.csv .
RUN python3.8 model.py

#ENTRYPOINT FLASK_APP=flaskapp.py flask run --host=0.0.0.0
CMD ["python", "flaskapp.py"]
