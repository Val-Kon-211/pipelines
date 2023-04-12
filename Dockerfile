FROM python:3.10.2-buster

# Set the working directory to /app
WORKDIR /app
COPY poetry.lock pyproject.toml /app/

RUN pip install --upgrade pip
RUN pip install --upgrade cython

# Get the 
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

COPY . .
EXPOSE 8000
CMD [ "python", "pipeline.py" ]