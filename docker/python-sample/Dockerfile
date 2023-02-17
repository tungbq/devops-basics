FROM python:3.9
WORKDIR /
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD [ "python", "plot-graph.py" ]
