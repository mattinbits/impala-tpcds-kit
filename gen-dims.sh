#!/bin/bash
source tpcds-env.sh
for t in date_dim time_dim customer customer_address customer_demographics household_demographics item promotion store
do
  mkdir -p data/$t
  echo "Generating table $t"
  ${TPCDS_ROOT}/tools/dsdgen \
    -TABLE $t \
    -SCALE ${TPCDS_SCALE_FACTOR} \
    -DISTRIBUTIONS ${TPCDS_ROOT}/tools/tpcds.idx \
    -TERMINATE N \
    -FILTER Y \
    -QUIET Y > data/$t/data.dat
done
wait

