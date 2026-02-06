FROM amazonlinux:latest
LABEL Name=portal Version=0.0.1
ENV LAST_UPDATED 2026-01-31-0200
RUN yum update -y && \
    yum install -y python3-pip net-tools bind-utils iputils
COPY . /app
RUN pip install -r /app/requirements.txt
CMD ["python3", "/app/index.py"]