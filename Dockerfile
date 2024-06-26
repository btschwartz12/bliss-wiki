FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    git

WORKDIR /app

COPY . /app

RUN python -m pip install --upgrade pip
RUN python -m pip install --editable .[dev]