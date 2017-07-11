# Cloudlab groupadd script

This creates the docker and libvirtd groups on a system, then adds all the
CloudLab users to them.

GeniLib example:

```
# Install and execute scripts on the node
node.addService(pg.Install(url="https://github.com/zdw/geni-groupadd/archive/master.tar.gz", path="/local"))
node.addService(pg.Execute(shell="bash", command="/local/geni-groupadd-master/add_docker_libvirtd_groups.sh"))
```
