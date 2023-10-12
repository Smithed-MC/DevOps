FROM python:3.11-bookworm

RUN git clone https://github.com/Smithed-MC/smithed-python code
WORKDIR code

RUN pip install --no-cache-dir -r requirements-dev.lock

EXPOSE ${PORT}

CMD ["streamlit", "run", "app/main.py", "--browser.serverAddress", "0.0.0.0"]
