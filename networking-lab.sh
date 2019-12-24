#! /bin/bash

gcloud projects create networking-lab-cert

gcloud config set project networking-lab-cert

gcloud services enable compute.googleapis.com

gcloud compute networks create my-auto-vpc \
    --project networking-lab-cert \
    --subnet-mode=custom

gcloud compute networks subnets create net-lab-cert-subnets \
    --network=my-auto-vpc \
    --range=10.29.0.0/24 \
    --region=northamerica-northeast1 \
    --enable-private-ip-google-access
