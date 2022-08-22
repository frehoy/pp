FROM python:3.10

ADD lock.txt requirements.txt ./
RUN pip install -r requirements.txt

WORKDIR /pp/
ADD pp ./pp
ADD setup.py README.md ./
RUN pip install .
CMD ["pp"]