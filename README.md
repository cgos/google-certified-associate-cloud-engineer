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

# Creating Billing Accounts

There are two types of accounts:
* Self-serve: Billed at threshold or monthly
* Invoiced: Billed Monthlyn paid by Check/Wire Transfer

## Billing Roles

* Billing Account Admin: manage payment, configure, exports...
* Billing Account User: link projects to billing accounts
* Billing Account Viewer: access to spending information

## Alerts and Budgets

Budget can be set to a specifieed amount or on the last month spending.

Budget tracks spending on a project or billing account

By default three alerts are created: 50%, 90%, 100% when reached will trigger an email

## Billing exports
Exports come in 2 format: File based or Big Query (Streaming)

File exports are produced daily in a Cloud Storage Bucket

# Cloud SDK

## Installation
Follow the steps here: [cloud sdk] https://cloud.google.com/sdk/docs/quickstarts

instead of installing all of this locally, look to do the installation in a docker image

Once completed run:
* ``` gcloud config list ```
* ``` gcloud info ```

## Using cloud sdk
The [components] https://cloud.google.com/sdk/docs/components installed can be seen by running ``` gcloud components list```

## Courses and labs

https://linuxacademy.com/course/google-cloud-certified-associate-cloud-engineer/

https://acloud.guru/learn/gcp-certified-associate-cloud-engineer

https://www.whizlabs.com/google-cloud-certified-associate-cloud-engineer/practice-tests/

https://www.whizlabs.com/google-cloud-certified-associate-cloud-engineer/free-test/