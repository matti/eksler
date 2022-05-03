# eksler

stuff with eksctl, helm etc.


bin/eksler create eu-west-1 test-1 ipv6 1.22 1


## issues

- [EKS] [request]: Managed Nodes scale to 0 - https://github.com/aws/containers-roadmap/issues/724
- [EKS] [request]: create managed nodegroups without scaling one instance when minimum is 0 - https://github.com/aws/containers-roadmap/issues/1684
- autoscaler uses nodegroups which are not healthy - https://github.com/kubernetes/autoscaler/issues/4751
- memory usage increases heavily with pods - https://github.com/kubernetes/autoscaler/issues/4746

scale-down-delay-after-add: 5m  # helmer: NOTE: nodegroup is being created it is being registered etc in nodegroup, so do not scaledown immediately

## related issues
predicate checking error: node(s) didn't match Pod's node affinity; predicateName=NodeAffinity; reasons: node(s) didn't match Pod's node affinity; debugInfo= -  https://github.com/kubernetes/autoscaler/issues/4052
https://github.com/kubernetes/autoscaler/issues/3802
Cluster Autoscaler does not start new nodes when Taints and NodeSelector are used in EKS -
## other issues
[EKS/Fargate] Support for Wildcard * Namespaces  https://github.com/aws/containers-roadmap/issues/621

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
  - `export KUBECONFIG=$(eksler with eu-north-1 mycluster kubeconfig:path)`
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
  - call ec2-instance-selector to fetch a list and use it --> deprecate eksctl instance selector
  - if only 2 zones are available during cluster creation time, those will be the zones (?)
## notes

6.8gb used disk after bot


## aws issue envs

POOLS_REFRESH=yes POOLS="x-1-pre t-64-128-pre-p4-1" bin/test-main         eu-north-1  sixtyfour       ipv6  1 1.21
POOLS_REFRESH=yes POOLS="x-1-pre t-96-192-pre-p3-1" bin/test-main         eu-north-1  ninetysix       ipv6  1 1.21
POOLS_REFRESH=yes bin/test-main         eu-north-1  sixtyfour-ninetysix       ipv6  1 1.21


## envs

POOLS="x-1-pre" bin/test-main         eu-north-1  north-1       ipv6  1 1.21


POOLS="x-1-pre t-2-4-pre-p9-1 t-8-16-pre-p8-1 t-16-32-pre-p7-1" bin/test-main         eu-north-1  north-1       ipv6  1 1.21
POOLS="x-1-pre t-2-4-pre-p9-1 t-8-16-pre-p8-1 t-16-32-pre-p7-1 t-48-96-pre-p5-1" bin/test-main         eu-north-1  north-2       ipv6  1 1.21

bin/test-main         eu-west-1   west-2        ipv6  1 1.21

bin/bot-main          us-east-1   putte-bot-1   ipv6  1 1.21
bin/bot-main          eu-north-1  com-bot-1     ipv6  1 1.21

bin/app-main          eu-west-1  vodka-app-1     ipv6  1 1.21
bin/bot-main          eu-west-1  vodka-bot-1     ipv6  1 1.21