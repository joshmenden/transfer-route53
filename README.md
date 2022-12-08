transfer-route53

Eventually I envision this being a tool to handle the entire transfer process from end to end for users who control both AWS accounts. For now, it's just a little script to handle migrating Hosted Zones since the [AWS docs are absolutely dreadful](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html#hosted-zones-migrating-edit-records).

## How To Use It

You'll need some local ruby and bundler installed, so make sure you have that ready. Then...

```
> git clone https://github.com/joshmenden/transfer-route53 && cd transfer-route53
	# uses positional args
	#   1) old aws profile name
	#   2) old hosted zone ID
	#   3) new aws profile name
	#   4) new hosted zone ID
> ./convert.rb my_old_aws_profile_name ABCD123EFG456 my_new_aws_profile_name XYZ987QRS012
Records are being created in Hosted Zone Z123ABC456DEF9JKDHSL!
```

This uses positional arguments because I was too lazy to setup keyword arguments. The arguments in order are:
1. The name of your AWS profile for the origin Hosted Zone
2. The origin hosted zone ID
3. The name of your AWS profile for the destination Hosted Zone
4. The destination hosted zone ID

It's ok if both profiles are the same, but you'll need to put the argument twice to maintain the positions of the arguments.