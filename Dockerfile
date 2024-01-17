FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git libgl1 libglib2.0-0 libsm6 libxrender1 libxext6
RUN git clone https://github.com/bensonbs/DragNUWA-Fork
WORKDIR DragNUWA
RUN pip install -r environment.txt
ADD ./models ./models
RUN pip uninstall -y torchaudio
ADD ./DragNUWA_demo.py .
CMD ["python","DragNUWA_demo.py"]