# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(pdfio_library VERSION 0.0.1 LANGUAGES C)

add_library(pdfio SHARED
  "pdfio-aes.c"
  "pdfio-array.c"
  "pdfio-common.c"
  "pdfio-content.c"
  "pdfio-crypto.c"
  "pdfio-dict.c"
  "pdfio-file.c"
  "pdfio-md5.c"
  "pdfio-object.c"
  "pdfio-page.c"
  "pdfio-rc4.c"
  "pdfio-sha256.c"
  "pdfio-stream.c"
  "pdfio-string.c"
  "pdfio-token.c"
  "pdfio-value.c"
  "ttf.c"
)

set_target_properties(pdfio PROPERTIES
  PUBLIC_HEADER pdfio.h
  OUTPUT_NAME "pdfio"
)

target_compile_definitions(pdfio PUBLIC DART_SHARED_LIB)
