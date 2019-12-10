# Concepts and notes from Google certified associate cloud engineer

# Setting up Cloud Projects and Accounts

## Users and Roles
Primitive Roles at project levle:
* Owner
* Editor
* Viewer

Predefined Roles at resource level, for example given a resource X (e.g. BigQuery):
* X Admin
* X Data Owner
* X Data Editor
* X Data Viewer

Custom Roles at resource level

## Creating Billing Accounts

There are two types of accounts:
* Self-serve: Billed at threshold or monthly
* Invoiced: Billed Monthlyn paid by Check/Wire Transfer

### Billing Roles

* Billing Account Admin: manage payment, configure, exports...
* Billing Account User: link projects to billing accounts
* Billing Account Viewer: access to spending information

### Alerts and Budgets

Budget can be set to a specifieed amount or on the last month spending.

Budget tracks spending on a project or billing account

By default three alerts are created: 50%, 90%, 100% when reached will trigger an email

### Billing exports
Exports come in 2 format: File based or Big Query (Streaming)

File exports are produced daily in a Cloud Storage Bucket

## Cloud SDK

Create a new gcloud configuration
```
gcloud config configurations create (CONFIG_NAME)
```

List all of your gcloud configurations
```
gcloud config configurations list
```

Activate another existing gcloud configuration
```
gcloud config configurations activate (CONFIG_NAME)
```

List the settings for your active configuration
```
gcloud config list
```

Assign a project to a configuration
```
gcloud config set project (PROJECT_ID)
```

Set account for your configuration
```
gcloud config set account (ACCOUNT_ID)
```
### Installation
Follow the steps here: [cloud sdk](https://cloud.google.com/sdk/docs/quickstarts)

The ``` gcloud init ``` command is a shortcut for login and config

instead of installing all of this locally, look to do the installation in a docker image

Once completed run:
* ``` gcloud config list ``` allows to view the default project
* ``` gcloud info ```

### Using cloud sdk
The [components](https://cloud.google.com/sdk/docs/components) installed can be seen by running ``` gcloud components list```

The core component is a shared library between the different components

## Planning and Configuring a Cloud Solution
### Commparing Compute Options
* Compute Engine
* Kubernetes Engine
* App Engine
* Cloud Functions

### Reviewing Compute Engine
Full Ops with great workloads (most ops effort)

it's all about VM

Use CE when:
* need control over OS
* need control over CPU, GPU, SSD, RAM...
* need a lift and shift an existing app
* workload is not containerized
* performing bulk processing

### Reviewing Compute Engine - Managed Instance Groups

Managed instance groups support:
* autohealing
* autoscaling
* instance are created from a template
* additional instances are removed 10 minutes after they are no longer needed
* automatic updates

### Reviewing Kubernetes Engine
Full Ops with great workloads

Use K8s when:
* running containers
* care about the OS
* care about portability
* focus on containers as the unit of deployment

### Reviewing App Engine
No ops and Limited workloads

Use App Engine when:
* value dev over ops
* want high availability 
* app portability isn't a primary concern
* app speaks http
* don't care about underlying OS

Managed app engine advantages are: runtimes are managed, inexpensive, fast startup

### Reviewing Cloud Functions
Event triggered
No ops and greater workloads

Use Functions when:
* code to execute on cloud events
* dev is in javascripts
* code executes within limits (540 sec)
* don't care about underlying OS

## Planning and Configuring Data Storage Options

Cloud Datastore: fully managed, NoSQL database built on Cloud Bigtable

Cloud Spanner:  SQL database with horizontal scaling. You don't require analytics.

## Planning and Configuring Network Resources

Types of load balancing:
* tcp proxy
* https
* ssl proxy
* network tcp/udp: supports regional load balancing

## Exploring the Application

## Planning and Estimating Using the Pricing Calculator

Allow to:
* determine areas to cut back
* dertine areas to rework codebase
* ensure services are affordable at scale

# Deploying and Implementing a Cloud Solution
## Deploying the Applications

## Ensuring Successful Operation of a Cloud Solution

### Managing Resources
 

Create a new gcloud configuration

```
gcloud config configurations create (CONFIG_NAME)
```

List all of your gcloud configurations
```
gcloud config configurations list
```
Activate another existing gcloud configuration
```
gcloud config configurations activate (CONFIG_NAME)
```
List the settings for your active configuration
```
gcloud config list
```
Assign a project to a configuration
```
gcloud config set project (PROJECT_ID)
```
Set account for your configuration
```
gcloud config set account (ACCOUNT_ID)
```

List the gke clusters
```
gcloud container clusters list
```

Resize the gke cluster
```
gcloud container clusters resize --num-nodes=1 --zone=us-central1-b fs-dev-app-clusters
```

### Configuring Access and Security


# Exam notes
* IAM roles and scope
* iam gcloud cli
    * https://cloud.google.com/sdk/gcloud/reference/organizations/add-iam-policy-binding
* vm, compute gcloud cli
    * https://cloud.google.com/compute/docs/storing-retrieving-metadata
* gke, container gcloud cli
* Subnet: https://www.computernetworkingnotes.com/ccna-study-guide/subnetting-tutorial-subnetting-explained-with-examples.html
* firewall rules and priority
    * https://cloud.google.com/vpc/docs/using-firewalls
* https://cloud.google.com/sdk/gcloud/reference/compute/networks/subnets/expand-ip-range
* Storage: https://cloud.google.com/storage/docs/gsutil/commands/acl




# Courses and labs

https://linuxacademy.com/course/google-cloud-certified-associate-cloud-engineer/

https://acloud.guru/learn/gcp-certified-associate-cloud-engineer

https://www.whizlabs.com/google-cloud-certified-associate-cloud-engineer/practice-tests/

https://www.whizlabs.com/google-cloud-certified-associate-cloud-engineer/free-test/