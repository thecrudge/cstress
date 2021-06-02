#!/bin/bash

cassandra-stress write -node cassandra &
wait $!

cassandra-stress read -node cassandra &
wait $!

cassandra-stress mixed -node cassandra &
wait

echo "Done"