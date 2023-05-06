# personal infra project

## Current state

### things that work

* generates two worker nodes, and one primary server working as a bastion / gateway
* private network between said nodes and the bastion
* private nodes has internet access via bastion

### todos / ideas

* should probably set up ansible instead of cloud-init, especially to adhere to
  reboots due to software updates on upgrade, but also to set up services

## prerequisites 

1. terraform
1. hetzner cloud API key
1. gopass (for API secret)

## Infra structure

```
                 +- - - - - - - - - - - - - - - - - - - - - -+
                 '               internal network            '
                 '                                           '
+----------+     ' +---------+                    +--------+ '
| internet | --- ' | primary |   ---------------- | node-1 | '
+----------+     ' +---------+                    +--------+ '
                 '                                           '
                 '              - - - - - - - - - - - - - - -+
                 '   |         '
                 '   |         '
                 '   |         '
                 ' +---------+ '
                 ' | node-2  | '
                 ' +---------+ '
                 '             '
                 +- - - - - - -+
```
