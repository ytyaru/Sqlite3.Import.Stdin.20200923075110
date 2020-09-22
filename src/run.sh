#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# SQLite3のテーブル＆レコード作成を.importで行う（TSVをstdinで受け取る）。
# CreatedAt: 2020-09-23
#---------------------------------------------------------------------------
Run() {
	TABLE_NAME=Names
	paste <(cat <(echo 'Id') <(echo {1..26} | tr ' ' '\n')) <(cat <(echo 'Name') <(echo {A..Z} | tr ' ' '\n')) | 
	sqlite3 :memory: -batch -interactive '.mode tabs' '.headers on' \
	'.import /dev/stdin '"$TABLE_NAME" \
	'select * from sqlite_master' \
	'select * from '"$TABLE_NAME"
}
Run "$@"
