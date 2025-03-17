#!/bin/bash
NUMBER=$1
if [$NUMBER -ge 10]
then
  echo "given no $NUMBER is greather than 10"
else
  echo "given no $NUMBER is lesser than 10"
fi