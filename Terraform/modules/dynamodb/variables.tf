variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "Primary key (hash key) for the table"
  type        = string
}

variable "hash_key_type" {
  description = "Type of the hash key (S=String, N=Number, B=Binary)"
  type        = string
}

variable "range_key" {
  description = "Sort key (optional)"
  type        = string
}

variable "range_key_type" {
  description = "Type of the sort key (S=String, N=Number, B=Binary)"
  type        = string
}
