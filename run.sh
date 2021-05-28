#!/bin/sh
export $(cat .env | sed 's/#.*//g' | xargs) && terraform apply