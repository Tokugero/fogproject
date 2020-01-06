# Fog Project containerization

### Mission Statement
I have an occassional need to deploy a VM or manage kubernetes images on my bare-metal environment. The goal of this project is to make a locally managed node provisioner, as well as the common toolbelt of troubleshooting ISOs and Windows Boot CDs. 

To this end I needed a ready-to-go Docker container, a testable & repeatable docker-compose, and a deployable Kubernetes Spec with segmented services for this great-looking single-host defined application.

### Quickstart
This is still a work in progress, but to get it working in it's current state:
```
docker build -t fog .
docker run -it -d -p 80:80 -p 69:69 fog
```

### Feature To-Dos
* Make docker-compose
* Seperate mysql server from same node
* Identify any/all ports
* Identify any/all externally store-able volumes
* Implement more sane .fogsettings
* Implement more appropriate certs
* Verify upgrade workflow
