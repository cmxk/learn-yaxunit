#!/bin/bash
set -e

vrunner test vanessa --db-user Администратор "$@"
vrunner test yaxunit --yaxunit-config tools/yaxunit.json --db-user Администратор "$@"
