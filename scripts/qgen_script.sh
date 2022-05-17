#!/bin/bash

for i in {1..22}
do
    qgen -n amgen_dbsql_tpch -v $i > /mnt/databricks/tpch-dbgen/test/$i.sql
done
