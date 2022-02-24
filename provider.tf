terraform {
  backend "s3"{
    bucket = "aw-sd-gh"
    key    = "terraform/.tfstate"
    region = "ap-south-1"
  }
}

provider "aws"{
    region = "ap-south-1"
}