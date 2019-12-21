# Concepts and notes from Google certified associate cloud engineer

# Setting up Cloud Projects and Accounts
https://cloud.google.com/sdk/docs/initializing
After installing the Cloud sdk, you need to run ```gcloud init``` and follow the steps. This also installs bq and gsutil


When setting up a new project the following APIs are enabled by default:
* BQ
* Google Cloud APIs
* Datastore API
* Cloud SQL
* Cloud Storage
* Service Management
* Service Usage
* Stackdriver Debugger, Logging, Monitoring, Trace

You can create as many projects as allowed by your quota.

It's a good idea to use projects to separate different systems and environments from each other, partly for organization and partly to prevent them from interacting badly with each other.

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
Q1: You need to store trillions of 2KB objects for one month and it you will need to run analytical processing against all of them from hundreds of nodes. Which of the following options would be the most cost-effective?

A1: Bigtable is made for large analytical workloads. With Cloud Storage, you pay for read operations, so that can get quite expensive when it's not the right fit for the data and access patterns.

Q2: You currently have 850TB of Closed-Circuit Television (CCTV) capture data and are adding new data at a rate of 80TB/month. The rate of data captured and needing to be stored is expected to grow to 200TB/month within one year because new locations are being added, each with 4-10 cameras. Archival data must be stored indefinitely, and as inexpensively as possible. The users of your system currently need to access 250TB of current-month footage and 100GB of archival footage, and access rates are expected to grow linearly with data volume. Which of the following storage options best suits this purpose?

A2: Data cannot be transitioned from Multi-Regional to Regional through Lifecycle Management; that would change the location. The access rate for new data is 250/80--so quite high--but archival data access is very low (100/850000). Because of this, we need to start with Regional or Multi-Regional and should transition to Coldline to meet the “as inexpensively as possible” requirement.



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

If you don't do (or specify) anything, the default service account will be attached by default to each new GCE instance. However, you can stop that from happening by either deleting the default service account or opting out of attaching it when you are creating a new GCE instance.


An instance can have the following states:
* PROVISIONING - Resources are being allocated for the instance. The instance is not running yet.
* STAGING - Resources have been acquired and the instance is being prepared for first boot.
* RUNNING - The instance is booting up or running. You can connect to the instance shortly after it enters this state.
* STOPPING - The instance is being stopped. This can be because a user has made a request to stop the instance or there was a failure. This is a temporary status and the instance will move to TERMINATED once the instance has stopped.
* REPAIRING - The instance is being repaired. This can happen because the instance encountered an internal error. During this time, the instance is unusable. If repair is successful, the instance returns to one of the above states.
* TERMINATED - A user stopped the instance, or the instance encountered a failure. Start the instance again or delete it.



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

Nodes are GCE instances managed by the GKE system. If one of the nodes dies, GKE will bring another node up to replace it and will ensure that any affected pods are restarted.

You cannot enable cluster autoscaling with the `resize` command, but you can turn that option on in the console or using the command `gcloud container clusters update CLUSTER_NAME --enable-autoscaling`.

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
Google App Engine natively connects to Stackdriver and sends both request logs and any application logs you give it (via the GAE SDK).

In App Engine Flex the connection to Stackdriver (i.e. agent installation and configuration) is handled automatically for you. In GAE Flex, you _could_ write logs using the App Engine SDK--and that would work--but it’s best practice for containers to log to stdout and stderr, instead: “Containers offer an easy and standardized way to handle logs because you can write them to stdout and stderr. Docker captures these log lines and allows you to access them by using the docker logs command. As an application developer, you don't need to implement advanced logging mechanisms. Use the native logging mechanisms instead.”

Stackdriver is not installed by default on GCE. Logging to stdout and stderr on GCE is not the recommended way to get logs to Stackdriver; configuring a custom log file location is.



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

The scopes that restrict what can be done through a service account are somewhat limited, by default.

There are no such roles as Organization Superuser, Organization Auditor, nor Controller. The Project Owner has all of the capabilities of the other two (Project Editor and Compute Administrator), and more. (There is, however, a “Super Admin” role for an organization that can control everything.)

MFA stands for Multi-Factor Authentication, and it is a best practice to use this to secure accounts. Cloud Identity and GSuite are the two ways to centrally manage Google accounts. Google Cloud Directory Sync (GCDS) does use LDAP to connect to your organization’s directory server, but it only pulls data to synchronize and never pushes changes.


# Exam notes
* IAM roles and scope
    * https://cloud.google.com/iam/docs/overview
    * https://cloud.google.com/iam/docs/understanding-roles
    * https://cloud.google.com/docs/enterprise/best-practices-for-enterprise-organizations#define_domain_administration_roles
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