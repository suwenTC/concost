import os
import sys
import threading

def doit(index):
    os.system("docker run --name vae" +str(index)+' fuyuqi1995/june-vae "10 /root/torch/vae.logs vae-test-epoch"')
    
cc = int(sys.argv[1])

for i in range(0, cc):
    t = threading.Thread(target=doit, args=(i,))
    t.start()
