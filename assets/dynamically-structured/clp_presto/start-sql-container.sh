docker run \
    --name clp-presto-mysql-clp-bench \
    -e MYSQL_ROOT_PASSWORD=rootpw \
    -e MYSQL_DATABASE=clp_db \
    -e MYSQL_USER=clp_user \
    -e MYSQL_PASSWORD=clp_password \
    --network clp-presto-clp-bench-net sqlserver \
    -d mysql
