import os
import sys
import threading
import time

def doit(index):
    os.system("docker exec db"+str(index)+ " ./run_queries.sh " + str(index+1))

start = time.time()
t1 = threading.Thread(target=doit, args=(0,))
t1.start()

time.sleep(100)

t2 = threading.Thread(target=doit, args=(1,) )
t2.start()

time.sleep(100)
t3 = threading.Thread(target=doit, args=(2,))
t3.start()

time.sleep(100)
t4 = threading.Thread(target=doit, args=(3,))
t4.start()

time.sleep(100)
t5 = threading.Thread(target=doit, args=(4,))
t5.start()
end = time.time()
cost = end - start

f=open("/users/SuwenTC/concost/mysql/100sgap_cost.txt", "w")
f.write(str(cost))
f.close()
