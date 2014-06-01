#!/bin/bash

SCRIPTDIR=`dirname $0`

# Migration shell script
sequel -m $SCRIPTDIR/migrations sqlite://$SCRIPTDIR/wiretap.db
