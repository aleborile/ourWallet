ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

EXPLODED_AAR := $(LOCAL_PATH)/../build/intermediates/exploded-aar
TESS_TWO := $(EXPLODED_AAR)/com.rmtheis/tess-two
TESS_TWO_V := 5.4.2b
TESS_TWO_LIBS := $(TESS_TWO)/$(TESS_TWO_V)/jni

PREBUILD_LIBS := $(TESS_TWO_LIBS)
PREBUILT_PATH := $(PREBUILD_LIBS)/$(TARGET_ARCH_ABI)

LOCAL_MODULE := libtextdetect

LOCAL_SRC_FILES += \
  src/clusterer.cpp \
  src/hydrogentextdetector.cpp \
  src/thresholder.cpp \
  src/utilities.cpp \
  src/validator.cpp

LOCAL_SRC_FILES += \
  jni/hydrogentextdetector.cpp \
  jni/thresholder.cpp \
  jni/jni.cpp

LOCAL_C_INCLUDES += \
  $(LOCAL_PATH)/src \
  $(LOCAL_PATH)/include/leptonica

LOCAL_LDLIBS += \
  -llog

LOCAL_MODULE_TAGS := optional

LOCAL_PRELINK_MODULE := false

LOCAL_DISABLE_FORMAT_STRING_CHECKS := true

TARGET_PREBUILT_SHARED_LIBRARIES += \
  $(PREBUILT_PATH)/liblept.so

include $(BUILD_SHARED_LIBRARY)

endif #TARGET_SIMULATOR
