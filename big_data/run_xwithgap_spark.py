import os
import sys
import threading
import time

def doit(index):
    os.system("sudo docker run --name 5in5_spark_"+str(index) +" -v /home/sgu21/concost/big_data/time_cost:/root/time_cost hibench-docker-opensource /bin/bash -c '/root/runexample_spark.sh 5in5_spark_" + str(index) + "'" + " > /dev/null 2>&1")

cc = int(sys.argv[1])
start = time.time()
for i in range(cc-1):
    t = threading.Thread(target=doit, args=(i, ))
    t.start()
    time.sleep(100)

doit(cc-1)

end = time.time()
cost = end - start
start = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(start))
end = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(end))
time_info = str(start) + ", " + str(cost) + ", " + str(end)

f=open("/home/sgu21/concost/big_data/time_cost/5in5_100/100sgap_cost.txt", "w")
f.write(time_info)
f.close()
