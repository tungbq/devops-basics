# --- database/outputs.tf ---

output "db_endpoint" {
  value = aws_db_instance.three_tier_db.endpoint
}
