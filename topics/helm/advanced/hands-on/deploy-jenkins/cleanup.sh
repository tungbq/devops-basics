#!/bin/bash

# Delete
helm delete jenkins -n jenkins

# Consider always deleting this part or not?
kubectl delete -f jenkins-volume.yaml
kubectl delete -f jenkins-sa.yaml
