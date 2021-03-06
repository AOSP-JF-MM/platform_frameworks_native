#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
ifneq ($(TARGET_USES_64_BIT_BINDER),true)
ifneq ($(TARGET_IS_64_BIT),true)
LOCAL_CFLAGS += -DBINDER_IPC_32BIT=1
endif
endif

LOCAL_MODULE := binderDriverInterfaceTest
LOCAL_SRC_FILES := binderDriverInterfaceTest.cpp
include $(BUILD_NATIVE_TEST)

include $(CLEAR_VARS)
LOCAL_MODULE := binderLibTest
LOCAL_SRC_FILES := binderLibTest.cpp
LOCAL_SHARED_LIBRARIES := libbinder libutils
include $(BUILD_NATIVE_TEST)

include $(CLEAR_VARS)
LOCAL_MODULE := binderThroughputTest
LOCAL_SRC_FILES := binderThroughputTest.cpp
LOCAL_SHARED_LIBRARIES := libbinder libutils
LOCAL_CLANG := true
LOCAL_CFLAGS += -g -Wall -Werror -std=c++11 -Wno-missing-field-initializers -Wno-sign-compare -O3
include $(BUILD_NATIVE_TEST)
