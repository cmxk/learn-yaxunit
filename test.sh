#!/bin/bash
set -e

OSCRIPT_BIN="$HOME/.local/share/ovm/current/bin"
VA_EPF="$OSCRIPT_BIN/../lib/vanessa-automation/vanessa-automation.epf"
VA_PARAMS="$(pwd)/tools/VAParams.json"
WORKSPACE="$(pwd)"

export PATH="$OSCRIPT_BIN:$PATH"

# Очистка зависших процессов 1С
pkill -f 1cv8c

vrunner run enterprise \
    --ibconnection "/F./build/ib" \
    --v8version "8.3.27.1786" \
    --db-user "Администратор" \
    --execute "$VA_EPF" \
    --command "StartFeaturePlayer;QuietInstallVanessaExt;VAParams=$VA_PARAMS;WorkspaceRoot=$WORKSPACE" \
    --exitCodePath "./build/out/BuildStatus.log"

vrunner test yaxunit \
    --ibconnection "/F./build/ib" \
    --yaxunit-config "tools/yaxunit.json" \
    --db-user "Администратор" "$@"
