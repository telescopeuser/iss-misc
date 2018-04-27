#!/bin/bash
cd /home/iss-user/iss-vm-program/object_detector_app
source /home/iss-user/anaconda3/bin/activate iss-env-py3
python object_detection_app-ssd_mobilenet_v1_coco_11_06_2017.py
