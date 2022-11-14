resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "unix_time_stamp"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"
  range_key      = "Epoch"

# TODO: Lambda should write the user ip address from the event event['requestContext']['http']['sourceIp']
# TODO: epochs_to_time should be a value that can be easily "ranged" by day time hour etc.
  attribute {
    name = "id"
    type = "S"
  }

  # attribute {
    # name = "UserIP"
    # type = "S"
  # }

  attribute {
    name = "Epoch"
    type = "N"
  }


  #ttl {
  #  attribute_name = "TimeToExist"
  #  enabled        = false
  #}

  global_secondary_index {
    name               = "ClientEpochs"
    hash_key           = "id"
    range_key          = "Epoch"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserIP"]
  }

  tags = {
    Name        = "dada"
    Environment = "dada"
  }
}
