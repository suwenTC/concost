import os
import sys
import threading
import time

def doit(index):
    os.system("docker exec db"+str(index)+ " ./run_queries.sh " + str(index+1) + " > /dev/null 2>&1")

cc = int(sys.argv[1])
start = time.time()
for i in range(cc-1):
    t = threading.Thread(target=doit, args=(i, ))
    t.start()
    time.sleep(20)

t = threading.Thread(target=doit, args=(cc-1, ))
t.start()

end = time.time()
cost = end - start
start = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(start))
end = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(end))
time_info = str(start) + ", " + str(cost) + ", " + str(end)

f=open("/users/SuwenTC/concost/mysql/time_cost/5in5_100/100sgap_cost.txt", "w")
f.write(time_info)
f.close()
