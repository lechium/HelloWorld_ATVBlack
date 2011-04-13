GO_EASY_ON_ME=1
export SDKVERSION=4.3
FW_DEVICE_IP=apple-tv.local
THEOS_DEVICE_IP=apple-tv.local
include theos/makefiles/common.mk
#include theos/makefiles/xpackage.mk

BUNDLE_NAME = HW
HW_FILES = Classes/HWAppliance.mm Classes/HWBasicMenu.m
HW_INSTALL_PATH = /Applications/Lowtide.app/Appliances
HW_BUNDLE_EXTENSION = frappliance
HW_LDFLAGS = -undefined dynamic_lookup #-L$(FW_PROJECT_DIR) -lBackRow

include $(FW_MAKEDIR)/bundle.mk


after-HW-stage:: 
	mkdir -p $(FW_STAGING_DIR)/Applications/AppleTV.app/Appliances; ln -f -s /Applications/Lowtide.app/Appliances/HW.frappliance $(FW_STAGING_DIR)/Applications/AppleTV.app/Appliances/

after-install::
	install.exec "killall -9 AppleTV"
	
	