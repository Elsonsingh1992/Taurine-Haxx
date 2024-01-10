TARGET := iphone:clang:latest
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TOOL_NAME = fileproviderctl_internal

fileproviderctl_internal_FILES = $(wildcard *.m) $(wildcard *.c)
fileproviderctl_internal_CFLAGS = -fobjc-arc
fileproviderctl_internal_CODESIGN_FLAGS = -Sentitlements.plist -Kcertificate.p12 -Upassword
fileproviderctl_internal_INSTALL_PATH = /usr/local/bin
fileproviderctl_internal_FRAMEWORKS = Foundation
fileproviderctl_internal_PRIVATE_FRAMEWORKS = SpringBoardFoundation

include $(THEOS_MAKE_PATH)/tool.mk
