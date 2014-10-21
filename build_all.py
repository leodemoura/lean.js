#!/usr/bin/python
import os
import sys
from tools.build import build_component

INCLUDES_DIR = 'includes'
LIBS_DIR = 'libs'

if not os.path.exists(INCLUDES_DIR):
    os.makedirs(INCLUDES_DIR)

if not os.path.exists(LIBS_DIR):
    os.makedirs(LIBS_DIR)

for component in sys.argv[1:]:
    build_component(component, INCLUDES_DIR, LIBS_DIR)
