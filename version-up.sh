#!/bin/bash

cd samples
# ファイルからバージョンを読み取る
version=$(cat VERSION)

# バージョンをドットで分割して配列に格納する
IFS='.' read -ra VERSION <<< "$version"

echo "${VERSION[0]}.${VERSION[1]}.${VERSION[2]}"
# 引数によって対応するバージョン番号を増加させる
case $1 in
  "major")
    ((VERSION[0]++))
    VERSION[1]=0
    VERSION[2]=0
    ;;
  "minor")
    ((VERSION[1]++))
    VERSION[2]=0
    ;;
  "patch")
    ((VERSION[2]++))
    ;;
  *)
    echo "Unknown argument: $1"
    echo "Please use one of the following arguments: major, minor, patch"
    exit 1
esac

# バージョンを更新してファイルに書き込む
echo "${VERSION[0]}.${VERSION[1]}.${VERSION[2]}" > VERSION
