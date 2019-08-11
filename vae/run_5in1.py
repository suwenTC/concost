import os
import sys
import threading

def doit(index):
    os.system("python app.py 10 /vae/vae.logs vae-test-epoch")
    
cc = int(sys.argv[1])

for i in range(0, cc):
    t = threading.Thread(target=doit, args=(i,))
    t.start()
