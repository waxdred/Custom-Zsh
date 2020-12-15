#! /bin/bash

main(){
    echo "Enter comment"
    read comment
    git add *
    git commit -m "$comment"
    git push
}

main
