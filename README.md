# eksler

stuff with eksctl, helm etc.

spot instance request might take time --> 5min or so too fast?
in EC2 > Auto Scaling groups > eks-g-1-test-1-pre-2022-03-14-16-42-27-32bfc471-64f4-d7d5-fba3-6f171c45136d

## issues

https://github.com/kubernetes/autoscaler/issues/4052
https://github.com/kubernetes/autoscaler/issues/3802


kubectl delete pod -n prometheus-1 -l app=prometheus,component=server
## features
  - `eksler create eu-north-1 ipv6|ipv4` - create ipv6 or ipv4 clusters without yaml
  - `eksler list`- lists all clusters in all regions
  - `eksler delete` - ensures cluster deletion even when cloudformation fails
  - `eksler with eu-north-1 mycluster list` - lists all nodegroups
  - `eksler with eu-north-1 mycluster create`
    - `--ami` pin down AMI version without yaml
    - `--volumeIOPS` and `--volumeThroughput` without yaml
  - `eksler with eu-north-1 mycluster kubectl get pod`
  - `export KUBECONFIG=$(eksler with eu-north-1 mycluster kubeconfig)`
  - https://github.com/aws/amazon-ec2-instance-selector without yaml
  - sets root password to `badpassword` for ec2 serial console access when SSM or SSH etc is not accessible
  - installs `htop iotop nano screen bind-utils` to the host for faster debugging
  - great & tested configs for cluster-autoscaler, ingress-nginx, aws-load-balancer-controller and prometheus
  - output shows elapsed seconds
  - runs commands until they succeed
  - parallel creation / deletion of nodegroups

## upcoming featurs
 - pin down vpc-cni, coredns and kube-proxy versions instead of latest

bin/eksler delete $REGION $CLUSTER
bin/eksler with $REGION $CLUSTER pool 1 all-1-pre create

POOLS="bot-1-pre bot-2-pre bot-3-pre" POOL_REFRESH=no bin/main eu-north-1 eka-1 ipv6 1

## TODO
  - does topologySpreadConstraints work with skew 1
  - cross-zone load balancing
  - https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/v0.4.7/grpc_health_probe-linux-amd64

## notes

6.8gb used disk after bot

## envs

bin/test-main         eu-west-1  west-0          ipv6  1 1.21
bin/eksler delete     eu-west-1  west-0

bin/test-main         eu-north-1  test-0          ipv6  1 1.21
bin/eksler delete     eu-north-1  test-0

bin/test-main         eu-north-1  test-1          ipv6  1 1.21
bin/eksler delete     eu-north-1  test-1

bin/test-main         eu-north-1  test-2          ipv6  1 1.21
bin/eksler delete     eu-north-1  test-2

bin/test-main         eu-north-1  test-3          ipv6  1 1.21
bin/eksler delete     eu-north-1  test-3

bin/bot-main          us-east-1   putte-bot-1     ipv6  1 1.21
bin/eksler delete     us-east-1   putte-bot-1

bin/bot-main          eu-north-1  com-bot-1       ipv6  1 1.21
bin/eksler delete     eu-north-1  com-bot-1

