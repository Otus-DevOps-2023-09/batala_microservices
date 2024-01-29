variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key {
  description = "key.json"
}
variable "private_key" {
  description = "Path to the private key used for ssh access"
}

variable "image_id" {
  description = "Base image ID"
  default = "fd87tirk5i8vitv9uuo1"
}
