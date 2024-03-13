FROM registry.altlinux.org/alt/alt

RUN apt-get update
RUN apt-get install -y python3 pip

WORKDIR /app

COPY ./requirements.txt /app/

# RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r /app/requirements.txt
RUN python3 -m pip install debugpy -t /tmp

EXPOSE 80

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]