export AMI_ID=ami-a1bae1c1
export INSTANCE_ID=i-0ef26d315324ffce2

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