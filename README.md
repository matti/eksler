# eksler

bin/eksler delete $REGION $CLUSTER
bin/eksler with $REGION $CLUSTER pool 1 all-1-pre create


## TODO
  - fix addon versions
  - eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=eu-north-1 --cluster=test3
  - cross-zone load balancing

## notes

ami: ami-0740245292d53bfa2 # amazon-eks-node-1.21-v20220123
ami: ami-00b3d47c1f3493f2d # amazon-eks-node-1.21-v20220112