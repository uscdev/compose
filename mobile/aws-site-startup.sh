aws ec2 start-instances --instance-ids i-0ef26d315324ffce2

sleep 5

aws elb register-instances-with-load-balancer --load-balancer-name mobile-usc-edu-load-balancer --instances i-0ef26d315324ffce2

ssh -i /run/secrets/its-bsa-prod-us-west-1-key-pair.pem docker@ec2-54-183-138-242.us-west-1.compute.amazonaws.com "curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/resetanddeploy.sh"

ssh -i /run/secrets/its-bsa-prod-us-west-1-key-pair.pem docker@ec2-54-183-138-242.us-west-1.compute.amazonaws.com "chmod a+x resetanddeploy.sh"

ssh -i /run/secrets/its-bsa-prod-us-west-1-key-pair.pem docker@ec2-54-183-138-242.us-west-1.compute.amazonaws.com "./resetanddeploy.sh --stdin uscits"


if [ "$UPDATE_ROUTE_53" = true ]; then
    echo '***UPDATING ROUTE53***'
    curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/updateRouter53-test.json
    aws route53 change-resource-record-sets --hosted-zone-id ZALS2H7MCWQXI --change-batch file://updateRouter53-test.json
fi
