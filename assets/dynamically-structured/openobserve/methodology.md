# Tool name methodology

## Basics

> Note: running queries immediately after a reset causes errors since reset returns when deleting
the stream but the stream still shows up undeleted for an amount of time

Version 0.15.0-rc1
https://gallery.ecr.aws/zinclabs/openobserve

## Setup

* Setting the openobserve data location
* Starting the openobserve daemon

## Specifics

Ingestion is done in 50000 line batches through an HTTP API: the software is designed for streams
of data, not compressing large amounts

Searching is done in a way where openobserve knows the only desired value is the number of logs
satisfying the constraint.
