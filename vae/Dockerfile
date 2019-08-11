FROM pytorch/pytorch
USER root

RUN apt-get update
RUN apt-get install -y emacs
RUN mkdir /vae
RUN pip install torchvision
WORKDIR /vae
RUN touch vae.logs
COPY app.py /vae
COPY run_5in1.py /vae
COPY download_data.py /vae
COPY run_100s_gap.py /vae
RUN ["python", "download_data.py"]