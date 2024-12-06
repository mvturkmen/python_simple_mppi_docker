FROM ubuntu:22.04

COPY . /app/


WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    ffmpeg \
    curl \
    && apt-get clean

RUN ln -sf /usr/bin/python3.10 /usr/bin/python \
    && ln -sf /usr/bin/pip3 /usr/bin/pip

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="${PATH}:/root/.local/bin"


RUN poetry add numpy matplotlib notebook jupyter

RUN poetry install

