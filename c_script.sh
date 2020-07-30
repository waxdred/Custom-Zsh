#!/bin/bash

gcc $1 
./a.out > $2/result_c
rm a.out
