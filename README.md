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

### Reviewing Compute Engine

### Reviewing Compute Engine - Managed Instance Groups

### Reviewing Kubernetes Engine

### Reviewing App Engine

## Planning and Configuring Data Storage Options

## Planning and Configuring Network Resources

## Exploring the Application

## Planning and Estimating Using the Pricing Calculator

# Deploying and Implementing a Cloud Solution
## Deploying the Applications

## Ensuring Successful Operation of a Cloud Solution

### Managing Resources

### Configuring Access and Security



# Courses and labs

https://linuxacademy.com/course/google-cloud-certified-associate-cloud-engineer/

https://acloud.guru/learn/gcp-certified-associate-cloud-engineer

https://www.whizlabs.com/google-cloud-certified-associate-cloud-engineer/practice-tests/

https://www.whizlabs.com/google-cloud-certified-associate-cloud-engineer/free-test/