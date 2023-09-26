
echo "Running rules check..."
docker exec -it elastalert elastalert-test-rule "/opt/elastalert/rules/metricbeat_cpu_rule.yaml"
