resource "aws_dynamodb_table" "machine_properties" {
  hash_key = "MachineID"
  name = "${local.system_name}-MachineState"
  attribute {
    name = "MachineID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_dynamodb_table_item" "vouch_machine_details" {
  table_name = aws_dynamodb_table.machine_properties.name
  hash_key   = aws_dynamodb_table.machine_properties.hash_key

  item = <<ITEM
{
  "MachineID": {"S": "${aws_instance.machine.id}"},
  "AvailabilityZone": {"S": "${aws_instance.machine.availability_zone}"},
  "Instancetype": {"S": "${aws_instance.machine.instance_type"}"},
}
ITEM
}
