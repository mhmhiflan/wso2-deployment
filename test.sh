#!/bin/bash

echo 'Image stream creation started ...'
oc create -f image-stream-config.yml
