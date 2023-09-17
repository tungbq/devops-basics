# Deploy via docker
- Doc: https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-docker.html
- Run
```
docker compose up -d
```

# Deploy via k8s
- Refer: https://raw.githubusercontent.com/elastic/beats/8.9/deploy/kubernetes/metricbeat-kubernetes.yaml
- Doc: https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-kubernetes.html
- Run
```
kubectl apply -f metricbeat-kubernetes-8.9.yaml
```
