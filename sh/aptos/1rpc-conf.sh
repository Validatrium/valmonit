#!/bin/bash

export METRICS=localhost:9101/metrics

/bin/bash -c "./$1 $2"
