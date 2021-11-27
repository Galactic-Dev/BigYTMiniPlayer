PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

export ARCHS = arm64 arm64e
export TARGET := iphone:clang:14.4
FINALPACKAGE = 1
INSTALL_TARGET_PROCESSES = YouTube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BigYTMiniPlayer

BigYTMiniPlayer_FILES = Tweak.xm
BigYTMiniPlayer_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
