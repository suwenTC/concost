FROM gw000/keras
USER root

RUN apt-get update
RUN apt-get install -y emacs
RUN mkdir /keras-irnn
RUN pip install torchvision
WORKDIR /keras-irnn
RUN touch keras-irnn.logs
COPY app.py /keras-irnn
COPY run_5in1.py /keras-irnn
COPY run.sh /keras-irnn
COPY download_data.py /keras-irnn
COPY run_100s_gap.py /keras-irnn
RUN chmod +x run.sh
RUN ["python", "download_data.py"]