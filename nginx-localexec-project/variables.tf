variable "filenames" {
  type = list(string)
  default = [
    "/home/walid/terraform-files/file1.txt",
    "/home/walid/terraform-files/file2.txt",
    "/home/walid/terraform-files/file3.txt"
  ]
  description = "Lijst met pad + bestandsnamen om lokaal aan te maken"
}

variable "content" {
  type        = string
  default     = "Dit is een testbestand aangemaakt met Terraform"
  description = "Inhoud van de bestanden"
}
