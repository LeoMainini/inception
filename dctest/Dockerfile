# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY .env .env
# RUmakeN install python-dotenv
EXPOSE 5001
COPY . .
CMD ["flask", "run"]
