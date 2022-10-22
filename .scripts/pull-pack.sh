#!/bin/bash

usage() {
  echo "Usage: $0 [-g group] [-d deployname] <https://cribl-api-endpoint/>"
  exit 1
}

groupname=default
deployname=$(basename $PWD)
while getopts ":hg:d:" o ; do
  case ${o} in
    g) groupname=$OPTARG
      ;;
    d) deployname=$OPTARG
      ;;
    *) usage
      ;;
  esac
done
shift $((OPTIND-1))
CRIBL_API=$1
[ -n "${CRIBL_API}" ] || ( echo 'Api Endpoint not specified' ; usage )

[ -x $(which jq) ] || ( echo 'jq is required. See https://stedolan.github.io/jq/' ; exit 1 )
[ -x $(which git) ] || ( echo 'git is required.' ; exit 1)

if [ -z "${CRIBL_TOKEN}" ]
then
  if [ -z "${CRIBL_USERNAME}" -o -z "${CRIBL_PASSWORD}" ]
  then
    echo "CRIBL_USERNAME and CRIBL_PASSWORD required if CRIBL_TOKEN is not given"
    exit 1
  fi

  # Attempt to fetch token
  AJ="application/json"
  CRIBL_TOKEN=$(curl "${CRIBL_API#/}/v1/auth/login" \
                     -fsS -X POST -H "accept: $AJ" -H "Content-Type: $AJ"
                     -d "{\"username\":\"${CRIBL_USERNAME}\", \
                          \"password\":\"${CRIBL_PASSWORD}\"}"  \
                | jq -r .token)
fi

AJ="application/json"
curl -fsS -X POST -H "accept: $AJ" -H "Content-Type: $AJ" \
     -H "Authorization: Bearer $CRIBL_TOKEN" \
     "${CRIBL_API#/}/v1/m/${groupname}/packs/${deployname}/export?mode=merge" \
  | tar xfz - || exit 1

# Reflow package.json because it usually gets mangled
jq . package.json > package.json.new && rm package.json && mv package.json.new package.json

if git diff -w --exit-code
then
        git diff -w --stat
else
        echo "No changes to bring back for ${deployname} from group ${groupname}"
fi
