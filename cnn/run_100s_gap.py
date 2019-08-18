import os
import sys
import threading
import time

def doit(index):
    os.system("docker run --name vae" +str(index)+' vae ./run.sh')
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
