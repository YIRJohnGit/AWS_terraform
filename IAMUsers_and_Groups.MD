# Creating IAM User and Group

_Create a Terraform File 'iam.tf'_
```
###Createing User Groups###
resource "aws_iam_group" "IAMGroup" {
    name = "Developers"
}
```
### Attaching Policy to the Group ###
```
resource "aws_iam_policy_attachment" "IAMPolicyAttach" {
    name = "my_developer_policy"
    group = ["${aws_iam_group.IAMGroup.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
```
### Creating Developers / Users ###
```
resource "aws_iam_user" "IAMUser1" {
    name = "dev1"
}

resource "aws_iam_user" "IAMUser2" {
    name = "dev1"
}
```
### Connecting the Group and Users ###
```
resource "aws_iam_group_membership" "administrators-users" {
    name = "administrators-users"
    users = [
    	"${aws_iam_user.IAMUser1.name}",
    	"${aws_iam_user.IAMUser2.name}"
    ]
    group = "${aws_iam_group.IAMGroup.name}"
}
```
