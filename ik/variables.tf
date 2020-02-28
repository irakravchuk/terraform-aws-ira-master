variable "region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.nano"
}

variable "network" {
  type = string
  default = "vpc-596aa03e"
}

variable "subnet" {
  type = string
  description = "Test input description"
  default = "subnet-3d82d101"
}
#variable "subnet" {
 # type = list(list(string))
  #description = "Test input description"
  #default = [["subnet-3d82d101", "subnet-b347fefb", "subnet-7e3fd71a"]]
#}


variable "associate_public_ip" {
  type    = bool
  default = true
  
}

variable "tags" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}

variable "test_instanceIK_22" {
 type = string
 default = "1"
 }
variable "test_instanceIK" {
 type = string
 description = "Test input description"
 default = "foo"
 }
 #type = string
  #description = "Test input description"
  #default = [["gfggf", "jhvghjg"], ["subnet-3d82d101", "subnet-b347fefb", "subnet-7e3fd71a"]]
 #default =  ["subnet-3d82d101"["subnet-b347fefb"("subnet-7e3fd71a")]]
 #}

variable "ira-tags" {
 type = map(list(string))
 description = "Test input description"
 default = { foo = [ "bar" ] }
} 

variable "text_var" {
 type = string
 default = null
}
#variable "json_var" {
 #type = list(list(string))
#}
#variable "list_var" {
 #type = string 
#}
#variable "HIDE" {
 # type = string
 # }

variable "tags1" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}
variable "tags2" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}
variable "tags3" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}
variable "tags4" {
   type = "map"
   default = {
   us-east-1 = "image-1234"
   us-west-2 = "image-4567"
 }
}



#variable "sg" {
#description = "AWS Secruity Group"
 # type = list
#}


#variable "instance_count" {
  #type = any
  #default = "1"
  #}
