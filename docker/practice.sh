# Running python script without building docker image
echo "Running python script without building docker image"
docker run --rm -v "$(pwd)/python-sample":/app -w /app python:3.9-slim-buster python basic.py
echo $?

# Build and run docker container
echo "Build and run docker container"
IMAGE_NAME="draw-cat-image"
cd python-sample
docker build -t $IMAGE_NAME .
docker run --rm $IMAGE_NAME
