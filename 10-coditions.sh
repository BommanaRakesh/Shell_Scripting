#!/bin/bash

Number = $1


if [ $Number -lt 10 ] 
then
  echo "Number is less than 10"
  else 
  echo "Number is greater than or equal to 10"
fi

# -gt greater than
# -lt less than
# -eq equal to
# -ne not equal to
# -ge greater than or equal to
# -le less than or equal to 