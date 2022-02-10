#!/bin/bash

for i in {001..100}; do
    echo test$i >file$i.txt
    az storage blob upload --account-name urielstorage1 --container-name sample-container1 --name file$i.txt --file file$i.txt --auth-mode key --account-key $1

    az storage blob copy start --destination-blob file$i.txt --source-uri https://urielstorage1.blob.core.windows.net/sample-container1/file$i.txt --account-name urielstorage2 --account-key $2 --auth-mode key --destination-container sample-container2

    rm file$i.txt
done