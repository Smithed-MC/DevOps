FROM ubuntu:latest

# RUN apt-get update
# RUN apt-get add git nodejs gcc
# # RUN apk add python3
# # RUN apk --update add gcc libc-dev libffi-dev build-base freetype-dev libpng-dev openblas-dev
# # RUN apk add gfortran
# # RUN apk add py3-pip
# # RUN apk add py3-numpy

# RUN apt-get install python
RUN apt update
RUN apt -y upgrade

RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.10 curl git


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py

RUN pip install poetry streamlit

RUN git clone https://github.com/Smithed-MC/smithed-python code
WORKDIR /code

RUN poetry install


EXPOSE ${PORT}

CMD ["poetry", "run", "streamlit", "run", "app/main.py", "--browser.serverAddress", "0.0.0.0"]