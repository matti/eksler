# eksler

bin/eksler delete $REGION $CLUSTER
bin/eksler with $REGION $CLUSTER pool 1 all-1-pre create

POOLS="bot-1-pre bot-2-pre bot-3-pre" POOL_REFRESH=no bin/main eu-north-1 eka-1 ipv6 1

## TODO
  - fix addon versions
  - eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=eu-north-1 --cluster=test3
  - cross-zone load balancing
  - https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/v0.4.7/grpc_health_probe-linux-amd64

## notes

ami: ami-0740245292d53bfa2 # amazon-eks-node-1.21-v20220123
ami: ami-00b3d47c1f3493f2d # amazon-eks-node-1.21-v20220112

6.8gb used disk after bot