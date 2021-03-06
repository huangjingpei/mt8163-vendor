########################
# SRS Processing

# DEFINE SRS_LIB_TARGET elsewhere to redirect dependancies; for example between libsrsprocessing and libsrsstub.
ifeq ($(SRS_LIB_TARGET),)
SRS_LIB_TARGET := libsrsprocessing
endif

# DEFINE SRS_LIB_PATH elsewhere to account for placing the srs library projects in another location.
ifeq ($(SRS_LIB_PATH),)
#SRS_LIB_PATH := frameworks/av/services/srs_processing
SRS_LIB_PATH := vendor/mediatek/proprietary/external/SRS_AudioEffect/srs_processing
endif

# DEFINE SRS_LIB_SUPRESS to prevent AudioFlinger from depending on any srs libraries (for use with NULL stubs)
ifeq ($(SRS_LIB_SUPRESS),)
LOCAL_SHARED_LIBRARIES += $(SRS_LIB_TARGET)
endif

LOCAL_C_INCLUDES += $(SRS_LIB_PATH)

# DEFINE POSTPRO_PROPGATE to force processing to gate based on build.prop.
ifneq (,$(POSTPRO_PROPGATE))
LOCAL_CFLAGS += -DPOSTPRO_PROPGATE
endif

# DEFINE POSTPRO_LOGGING to log from patched files.
ifneq (,$(POSTPRO_LOGGING))
LOCAL_CFLAGS += -DSRS_VERBOSE
endif

# SRS Processing
########################
