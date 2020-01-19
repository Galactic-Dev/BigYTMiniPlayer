ARCHS = armv7 armv7s arm64 arm64e
FINALPACKAGE = 1
INSTALL_TARGET_PROCESSES = YouTube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BigYTMiniPlayer

BigYTMiniPlayer_FILES = Tweak.xm
BigYTMiniPlayer_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
