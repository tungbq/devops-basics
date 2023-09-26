
# document: https://elastalert2.readthedocs.io/en/latest/ruletypes.html#testing-your-rule
echo "Running rules check..."
docker exec -it elastalert elastalert-test-rule "/opt/elastalert/rules/metricbeat_cpu_rule.yaml"

echo "Running rules check with local data..."
docker cp data/json_debug.json elastalert:/tmp/json_debug.json
docker exec -it elastalert elastalert-test-rule --data /tmp/json_debug.json "/opt/elastalert/rules/metricbeat_cpu_rule.yaml"
