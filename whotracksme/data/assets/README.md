# WhoTracks.me datasets

WhoTracks.me datasets were migrated from Git LFS to Amazon S3.
You can download the datasets from the publicly available Amazon S3 bucket.

## Requirements

Install AWS Command Line Interface (AWS CLI). AWS provides instruction for the most popular operating systems:

- [Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
- [MacOS](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
- [Windows](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)

## Download the datasets

```shell
aws s3 sync --no-sign-request s3://data.whotracks.me/ .
```
