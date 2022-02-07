# eksler

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
  - eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=eu-north-1 --cluster=test3
  - cross-zone load balancing
  - https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/v0.4.7/grpc_health_probe-linux-amd64

## notes

ami: ami-0740245292d53bfa2 # amazon-eks-node-1.21-v20220123
ami: ami-00b3d47c1f3493f2d # amazon-eks-node-1.21-v20220112

6.8gb used disk after bot