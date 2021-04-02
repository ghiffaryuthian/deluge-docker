#!/bin/bash

deluged -d &

deluge-web -d

fg %1