#!/bin/bash
set -e

vrunner infobase init --src build/эталон.dt "$@"
vrunner cfe load --extension-name yaxunit --db-user Администратор src/cfe/yaxunit "$@"
vrunner run enterprise --command "ЗапуститьОбновлениеИнформационнойБазы;ЗавершитьРаботуСистемы;" \
  --execute '$runnerRoot/epf/ЗакрытьПредприятие.epf' --db-user Администратор "$@"
