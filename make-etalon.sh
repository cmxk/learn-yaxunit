#!/bin/bash
set -e

vrunner infobase init --src src/cf "$@"
vrunner cfe load --extension-name yaxunit src/cfe/yaxunit "$@"
vrunner run enterprise --command "ЗапуститьОбновлениеИнформационнойБазы;ЗавершитьРаботуСистемы;" \
  --execute '$runnerRoot/epf/ЗакрытьПредприятие.epf' "$@"

vrunner infobase dump-dt --ibconnection "/F./build/ib" build/эталон.dt "$@"

echo "Эталон сохранён: build/эталон.dt"
