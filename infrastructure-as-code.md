# Infrastructure as Code

This is a collection of links and small tutorials to get started with [infrastructure as code][iac].

* [Containers, orchestration, kubernetes, cluster management](#basics)
* [Getting started with Terraform](#terraform)
* [Getting started with Ansible](#ansible)

## Basics

This is a set of pointers to get started with containers, container orchestration, kubernetes (k8), and management of (kubernetes) clusters.

* [Docker][docker]
   * [Docker Desktop][docker-desktop] for Mac and Windows
   * [Docker Play][docker-play]
   * [Docker Swarm][docker-swarm]
* [Kubernetes](https://kubernetes.io/)
   * [Kubernetes basics][k8-basics]
       * [minikube][minikube]
       * [A Kubernetes Basics Tutorial][k8-minikube-lab]
       * [k3s][k3s]: Lightweight Kubernetes for IoT & Edge computing
       * [Helm](https://helm.sh/): Package management for kubernetes
   * [Amazon Elastic Container Service][ecs]
       * [AWS ECS Kubernetes lab][ecs-k8]
       * [MicroK8S][microk8s] (limited free tier k8 cluster)
   * [IBM Cloud Kubernetes Service][iks]
       * [Create a free cluster on IBM Cloud][iks-free]
   * [OpenShift][openshift]
       * [Getting started with OpenShift][openshift-getting-started]
   * Service Meshs
       * [Istio][istio]
           * [Istio on IBM Cloud Learn Hub][ibm-istio]
       * [Consul](https://www.consul.io/)
       * [kuma](https://kuma.io/)
* Cluster Management
   * [Rancher][rancher]
       * [Rancher architecture][rancher-arch]




* Badges:
	 * [Docker Essentials][docker-ess]
	 * [IBM Cloud Kubernetes Service][k8-ibmcloud]
	 * [Containers, K8s and Istio on IBM Cloud][k8-badge]
	 * [Getting started with Microservices with Istio and IBM Cloud Kubernetes Service][istio-badge]


## Terraform

* [Terraform Website](https://www.terraform.io/)
* Tutorial: [Terraform Getting Started](https://learn.hashicorp.com/terraform?track=getting-started)
* Tutorial: [A comprehensive guide to managing secrets in your Terraform code][terraform-secrets]



## Ansible

* [Ansible Website](https://www.ansible.com/)
* Tutorial: [Learn Ansible][udemy]



[iac]: https://en.wikipedia.org/wiki/Infrastructure_as_code
[docker]: https://www.docker.com/
[docker-desktop]: https://www.docker.com/products/docker-desktop
[docker-swarm]: https://docs.docker.com/engine/swarm/
[docker-play]: https://labs.play-with-docker.com/
[k8-basics]: https://kubernetes.io/docs/tutorials/kubernetes-basics/
[minikube]: https://minikube.sigs.k8s.io/docs/start/
[k8-minikube-lab]: https://www.bmc.com/blogs/what-is-kubernetes/
[k3s]: https://k3s.io/
[iks]: https://cloud.ibm.com/docs/containers
[iks-free]: https://cloud.ibm.com/docs/containers?topic=containers-getting-started
[ecs]: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create_cluster.html
[ecs-k8]: http://clusterfrak.com/docker/labs/k8_clustering/
[microk8s]: http://www.thecloudavenue.com/2020/04/microk8s-k8s-setup.html
[openshift]: https://www.openshift.com/learn/what-is-openshift
[openshift-getting-started]: https://www.openshift.com/try
[istio]: https://istio.io/
[ibm-istio]: https://www.ibm.com/cloud/learn/istio
[rancher]: https://rancher.com/
[rancher-arch]: https://rancher.com/docs/rancher/v2.x/en/overview/architecture/
[docker-ess]: https://www.youracclaim.com/badges/a73714e1-9183-4d79-9730-67bf6f397af5/public_url
[k8-ibmcloud]: https://www.youracclaim.com/badges/21f4f726-9215-4a3a-9954-b1b8252f99c6/public_url
[k8-badge]:	https://www.youracclaim.com/badges/bf7712cb-e4e4-41e2-9a39-66f4aaed49e7/public_url
[istio-badge]: https://www.youracclaim.com/badges/d5ae3d10-f0b9-469a-b866-2d06b936e53b/public_url
[terraform-secrets]: https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1?gi=f06dda54003c
[udemy]: https://www.udemy.com/course/learn-ansible/
