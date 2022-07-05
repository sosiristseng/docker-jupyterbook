FROM python:3.10-slim

WORKDIR /usr/src/app

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Python
RUN apt-get update && apt-get install -y git gzip brotli parallel --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -U pip wheel setuptools \
    && pip install --no-cache-dir -r requirements.txt

CMD ["jupyter-book"]
