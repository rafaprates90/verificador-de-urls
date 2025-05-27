FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install fastapi uvicorn playwright && \
    playwright install

EXPOSE 10000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
