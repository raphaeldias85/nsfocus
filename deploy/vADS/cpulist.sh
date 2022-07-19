#!/bin/bash
PROCESSOR_ID_FILE="processor_id"
CORE_ID_FILE="core_id"
PHYSICAL_ID_FILE="physical_id"
CPU_INFO_FILE="cpu_info.csv"
cpu_data=`cat /proc/cpuinfo`
echo -n "$cpu_data" | grep "processor" | awk 'BEGIN{FS=":"}{print $2}' > $PROCESSOR_ID_FILE
echo -n "$cpu_data" | grep "core id" | awk 'BEGIN{FS=":"}{print $2}' > $CORE_ID_FILE
echo -n "$cpu_data" | grep "physical id" | awk 'BEGIN{FS=":"}{print $2}' > $PHYSICAL_ID_FILE
echo "processor_id;physical_id;core_id" > $CPU_INFO_FILE
paste -d ';' processor_id physical_id core_id >> $CPU_INFO_FILE
rm -f $PROCESSOR_ID_FILE $CORE_ID_FILE $PHYSICAL_ID_FILE
