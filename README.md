# Docker GDrive

[![build_status](https://github.com/governance-foundation/docker-gdrive/workflows/ci/badge.svg?branch=master)](https://github.com/governance-foundation/docker-gdrive/actions?query=workflow%3Aci)
[![github license](https://img.shields.io/github/license/governance-foundation/docker-gdrive)](https://github.com/governance-foundation/docker-gdrive)
[![github issues](https://img.shields.io/github/issues/governance-foundation/docker-gdrive)](https://github.com/governance-foundation/docker-gdrive)
[![github last commit](https://img.shields.io/github/last-commit/governance-foundation/docker-gdrive)](https://github.com/governance-foundation/docker-gdrive)
[![github repo size](https://img.shields.io/github/repo-size/governance-foundation/docker-gdrive)](https://github.com/governance-foundation/docker-gdrive)
[![docker stars](https://img.shields.io/docker/stars/gvfn/gdrive)](https://hub.docker.com/r/gvfn/gdrive)
[![docker pulls](https://img.shields.io/docker/pulls/gvfn/gdrive)](https://hub.docker.com/r/gvfn/gdrive)

This is docker image [Gdrive](https://github.com/governance-foundation/gdrive) that allows you to interact with google drive api v3.

## Before you use

Create are service account for your self to allow you uploading files without prompts.

* `Google Dashboard -> Library` - Add this [Google Drive API](https://console.cloud.google.com/apis/library?q=google%20drive%20api) to your Google Dashboard.
* `Google Dashboard -> Credentials` - Then create a new Service Account in the [IAM & Admin](https://console.cloud.google.com/iam-admin/serviceaccounts), before you leave click `Create Key` on account actions and download the file which you will use to access your google drive files.
* Share your google drive files with your new service account. It's id should be `<YOU SPECIFIED>@governance-foundation.iam.gserviceaccount.com`.

## Running

To test container run following command:

In Powershell:

```powershell
Set-Variable -Name "SERVICE_ACCOUNT_JSON" -Value (Get-Content test.json -Raw)
docker run --rm -v ${pwd}:/gdrive -e SERVICE_ACCOUNT_JSON=$SERVICE_ACCOUNT_JSON gvfn/gdrive --config /gdrive --service-account-evar SERVICE_ACCOUNT_JSON list
```

In Bash

```bash
export SERVICE_ACCOUNT_JSON=`cat test.json`
docker run --rm -v `pwd`:/gdrive -e SERVICE_ACCOUNT_JSON gvfn/gdrive --config /gdrive --service-account-evar SERVICE_ACCOUNT_JSON list
```

Your current folder will be mapped into `/gdrive` folder and `SERVICE_ACCOUNT_JSON` will be mapped directly into container for your google drive activities.
