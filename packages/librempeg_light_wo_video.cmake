ExternalProject_Add(
  librempeg_light_wo_video
  DEPENDS bzip2
          lame
          opus
          vorbis
  GIT_REPOSITORY https://github.com/librempeg/librempeg.git
  GIT_TAG 0ada1735571528a47634d19d213d28eb49e01285
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND
    ${EXEC} <SOURCE_DIR>/configure
    --cc='ccache x86_64-w64-mingw32-gcc' --cxx='ccache x86_64-w64-mingw32-g++'
    --cross-prefix=x86_64-w64-mingw32-
    --prefix=${MINGW_INSTALL_PREFIX}
    --arch=x86_64
    --target-os=mingw32
    --target-exec=wine
    --pkg-config-flags=--static
    --disable-debug
    --disable-doc
    --disable-encoder=opus
    --disable-ffplay
    --disable-ffprobe
    --disable-htmlpages
    --disable-manpages
    --disable-podpages
    --disable-txtpages
    --disable-unstable
    --disable-vaapi
    --disable-vdpau
    --disable-videotoolbox
    --disable-vulkan
    --enable-agpl --enable-gpl --enable-version3
    --enable-cross-compile
    --enable-ffmpeg
    --enable-libmp3lame
    --enable-libopus
    --enable-libvorbis
    --enable-lto=thin
    --enable-runtime-cpudetect
  BUILD_COMMAND ${MAKE}
  INSTALL_COMMAND ""
  LOG_DOWNLOAD 1
  LOG_UPDATE 1
  LOG_CONFIGURE 1
  LOG_BUILD 1
  LOG_INSTALL 1)

ExternalProject_Add_Step(
  librempeg_light_wo_video copy-binary
  DEPENDEES install
  COMMAND
    ${CMAKE_COMMAND} -E copy
    <BINARY_DIR>/ffmpeg.exe
    ${CMAKE_CURRENT_BINARY_DIR}/librempeg_light_wo_video-package/ffmpeg.exe)

force_rebuild_git(librempeg_light_wo_video)
