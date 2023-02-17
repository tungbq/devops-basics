


# Running python script without building docker image
docker run --rm -v "$(pwd)/python-sample":/app -w /app python:3.9-slim-buster python basic.py
