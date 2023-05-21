terraform {
  backend "s3" {
    bucket = "mydev-tf-state-bucket-60"
    key = "main"
    region = "ap-northeast-1"
    dynamodb_table = "my-dynamodb-table"
  }
}
