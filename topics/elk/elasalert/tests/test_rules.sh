# document: https://elastalert2.readthedocs.io/en/latest/ruletypes.html#testing-your-rule
echo "Running rules check..."
docker exec -it elastalert elastalert-test-rule "/opt/elastalert/rules/metricbeat_cpu_rule.yaml"

echo "Running rules check with local data..."
echo "--Copy test data file"
docker cp data/json_debug.json elastalert:/tmp/json_debug.json
echo "--Execute test"
docker exec -it elastalert elastalert-test-rule --data /tmp/json_debug.json "/opt/elastalert/rules/metricbeat_cpu_rule.yaml"

echo "--Execute test with time range"
docker exec -it elastalert elastalert-test-rule --data /tmp/json_debug.json "/opt/elastalert/rules/metricbeat_cpu_rule.yaml" --start 2023-09-25T14:49:08.682Z --end 2023-09-26T00:59:10.759Z
