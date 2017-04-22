export INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=mobile.usc.edu" --query Reservations[0].Instances[0].InstanceId --output text)

if [ "$INSTANCE_ID" = "None" ]; then
	export IMAGE_ID=ami-a1bae1c1
	aws ec2 run-instances --image-id $IMAGE_ID --count 1 --instance-type m4.large --key-name its-bsa-prod-us-west-1-key-pair --security-group-ids sg-733f4b14 --subnet-id subnet-5207a536 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=mobile.usc.edu}]' 
	export INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=mobile.usc.edu" --query Reservations[0].Instances[0].InstanceId --output text)
fi

aws ec2 start-instances --instance-ids $INSTANCE_ID

sleep 5

aws elb register-instances-with-load-balancer --load-balancer-name mobile-usc-edu-load-balancer --instances $INSTANCE_ID

export PublicDns=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query Reservations[0].Instances[0].PublicDnsName --output text)

ssh -i /run/secrets/its-bsa-prod-us-west-1-key-pair.pem docker@$PublicDns "curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/resetanddeploy.sh"

ssh -i /run/secrets/its-bsa-prod-us-west-1-key-pair.pem docker@$PublicDns "chmod a+x resetanddeploy.sh"

ssh -i /run/secrets/its-bsa-prod-us-west-1-key-pair.pem docker@$PublicDns "./resetanddeploy.sh --stdin uscits"


if [ "$UPDATE_ROUTE_53" = true ]; then
    echo '***UPDATING ROUTE53***'
    curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/updateRouter53-test.json
    aws route53 change-resource-record-sets --hosted-zone-id ZALS2H7MCWQXI --change-batch file://updateRouter53-test.json
fi