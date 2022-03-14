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


## envs

bin/test-main         eu-north-1  test-1          ipv6  1 1.21
bin/eksler delete     eu-north-1  test-1

bin/bot-main          us-east-1   putte-bot-1     ipv6  1 1.21
bin/eksler delete     us-east-1   putte-bot-1

bin/bot-main          eu-north-1  com-bot-1       ipv6  1 1.21
bin/eksler delete     eu-north-1  com-bot-1



## logs:

template-node-for-eks-g-1-browsers-1-pre-2022-02-28-19-05-30-d8bfa0a6-5e5f-c2d0-d58b-c3032fcc8a82-1578394472169816748-upcoming-11. Ignoring in scale up.
I0228 19:58:27.789987       1 filter_out_schedulable.go:157] Pod default.truevisitor-68d84f96b8-62c54 marked as unschedulable can be scheduled on node

I0228 19:58:28.734151       1 scale_up.go:300] Pod truevisitor-68d84f96b8-9rnt2 can't be scheduled on eks-g-1-redis-1-reg-2022-02-28-19-36-03-c0bfa0b4-5506-6b49-69fb-76c31b3a6aee, predicate checking error: node(s) didn't match Pod's node affinity/selector; predicateName=NodeAffinity; reasons: node(s) didn't match Pod's node affinity/selector; debugInfo=


I0228 19:58:38.995669       1 static_autoscaler.go:228] Starting main loop
I0228 19:58:39.000593       1 static_autoscaler.go:319] 152 unregistered nodes present
I0228 19:58:39.000616       1 static_autoscaler.go:592] Removing unregistered node aws:///eu-north-1b/i-placeholder-eks-g-1-browsers-2-pre-2022-02-28-19-05-30-4abfa0a6-52fa-e575-6f73-ec225a684fc8-26
I0228 19:58:39.000684       1 auto_scaling_groups.go:265] instance i-placeholder-eks-g-1-browsers-2-pre-2022-02-28-19-05-30-4abfa0a6-52fa-e575-6f73-ec225a684fc8-26 is detected as a placeholder, decreasing ASG requested size instead of deleting instance
I0228 19:58:39.000695       1 auto_scaling_groups.go:219] Setting asg eks-g-1-browsers-2-pre-2022-02-28-19-05-30-4abfa0a6-52fa-e575-6f73-ec225a684fc8 size to 91
I0228 19:58:39.161948       1 request.go:600] Waited for 185.261453ms due to client-side throttling, not priority and fairness, request: POST:https://[fd79:be1e:8d79::1]:443/api/v1/namespaces/default/events
I0228 19:58:39.172605       1 event_sink_logging_wrapper.go:48] Event(v1.ObjectReference{Kind:"Pod", Namespace:"default", Name:"truevisitor-68d84f96b8-c5f8r", UID:"84183352-dc62-41c5-a0f8-ca09301a35a1", APIVersion:"v1", ResourceVersion:"81970", FieldPath:""}): type: 'Normal' reason: 'TriggeredScaleUp' pod triggered scale-up: [{eks-g-1-browsers-2-pre-2022-02-28-19-05-30-4abfa0a6-52fa-e575-6f73-ec225a684fc8 77->82 (max: 450)}]
I0228 19:58:39.173029       1 aws_manager.go:297] Some ASG instances might have been deleted, forcing ASG list refresh
I0228 19:58:39.247491       1 auto_scaling_groups.go:351] Regenerating instance to ASG map for ASGs: [eks-g-1-browsers-0-pre-2022-02-28-19-05-30-babfa0a6-3bbc-8cc8-d32a-60d6e19b2511 eks-g-1-browsers-1-pre-2022-02-28-19-05-30-d8bfa0a6-5e5f-c2d0-d58b-c3032fcc8a82 eks-g-1-browsers-2-pre-2022-02-28-19-05-30-4abfa0a6-52fa-e575-6f73-ec225a684fc8 eks-g-1-browsers-3-pre-2022-02-28-19-05-30-06bfa0a6-21dd-fdda-72d0-1912158c995d eks-g-1-redis-1-reg-2022-02-28-19-36-03-c0bfa0b4-5506-6b49-69fb-76c31b3a6aee eks-g-1-x-1-pre-2022-02-28-21-18-26-48bfa0e3-1813-5a5e-d18e-4906018fae74]
I0228 19:58:39.344775       1 auto_scaling.go:199] 6 launch configurations already in cache
I0228 19:58:39.344800       1 auto_scaling_groups.go:407] Instance group eks-g-1-browsers-1-pre-2022-02-28-19-05-30-d8bfa0a6-5e5f-c2d0-d58b-c3032fcc8a82 has only 17 instances created while requested count is 101. Creating placeholder instances.
I0228 19:58:39.344870       1 auto_scaling_groups.go:407] Instance group eks-g-1-browsers-2-pre-2022-02-28-19-05-30-4abfa0a6-52fa-e575-6f73-ec225a684fc8 has only 23 instances created while requested count is 91. Creating placeholder instances.
I0228 19:58:39.344919       1 auto_scaling_groups.go:407] Instance group eks-g-1-browsers-3-pre-2022-02-28-19-05-30-06bfa0a6-21dd-fdda-72d0-1912158c995d has only 6 instances created while requested count is 42. Creating placeholder instances.



kubectl logs -f -n cluster-autoscaler-1 cluster-autoscaler-1-aws-cluster-autoscaler-65d579b8c8-2r68n | grep -v -e "is not suitable for removal" -e "Calculating unneeded nodes" -e ": Watch close -"  -e "No candidates for scale down" -e "Starting scale down" -e "Scale down status:" -e "Starting main loop" -e "Filtering out schedulables" -e "node group min size reached" -e "No schedulable pods" -e "No unschedulable pods" -e "- cpu utilization" -e "Filtered out " -e "0 pods were kept as unschedulable based on caching" -e "0 pods marked as unschedulable can be scheduled." -e "Start refreshing cloud provider node instances cache" -e "0 launch configurations to query" -e "0 launch templates to query" -e "Successfully queried 0 launch configurations" -e "Successfully queried 0 launch templates" -e "Refreshed ASG list" -e "Refresh cloud provider node instances cache finished" -e "due to client-side throttling" -e "marked as unschedulable can be scheduled on node template" -e "is unneeded since" -e "Schedulable pods present" -e "Regenerating instance to ASG map for ASGs" -e "forcing resync"