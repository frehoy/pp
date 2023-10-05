ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}

ADD lock.txt requirements.txt ./
RUN pip install -r requirements.txt

WORKDIR /pp/
ADD pp ./pp
ADD pyproject.toml README.md ./
RUN pip install .
CMD ["pp"]
