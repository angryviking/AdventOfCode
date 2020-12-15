#!/bin/bash

awk -v RS= '$1=$1' day4.txt | awk '/byr:/ && /iyr:/ && /eyr:/ && /hgt:/ && /hcl:/ && /ecl:/ && /pid:/' | wc -l
