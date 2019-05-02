FROM python:3

ENV PYTHONUNBUFFERED 1
RUN mkdir /code/
WORKDIR /code/
COPY requirements.txt /code/
RUN pip install -r requirements.txt

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /
RUN chmod a+x /*.sh