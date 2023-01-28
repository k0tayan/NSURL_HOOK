FINALPACKAGE=1
GO_EASY_ON_ME=1
ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:13.6
THEOS_DEVICE_IP = 192.168.1.46
THEOS_DEVICE_PORT = 22
INSTALL_TARGET_PROCESSES = com.xxx.xxxx


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = nsurlhook
TWEAK_NAME_LIBRARIES = substrate

emuserver_FILES = Tweak.xm
emuserver_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
