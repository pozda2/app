FROM python:3-alpine
RUN python -m pip install --upgrade pip
COPY requirements.txt /usr/src/app/

RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

COPY app.py /usr/src/app/
COPY wsgi.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
COPY gunicorn.sh /usr/src/app
RUN chmod a+x gunicorn.sh
EXPOSE 5000

ENTRYPOINT ["/usr/src/app/gunicorn.sh"]