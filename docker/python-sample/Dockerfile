FROM python:3.9
WORKDIR /
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
COPY . .
CMD [ "python", "draw-cat.py" ]
