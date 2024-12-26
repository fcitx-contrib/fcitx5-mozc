#include "base/mac/mac_util.h"

#include "base/environ.h"
#include "base/file_util.h"

namespace mozc {
// Originally ~/Library/Application Support.
// Google appends "Mozc" to it to be equivalent to ~/.config/mozc on Linux.
// But we believe user history should be stored in ~/.local/share/fcitx5 like
// pinyin and rime.
std::string MacUtil::GetApplicationSupportDirectory() {
  const std::string home = Environ::GetEnv("HOME");
  return FileUtil::JoinPath(home, ".local/share/fcitx5");
}

// Originally ~/Library/Logs/APP_NAME
// On non-apple platforms it's just ~/.config/mozc.
// On Linux mozc only generates a mozc_server.log, so we don't care here.
std::string MacUtil::GetLoggingDirectory() { return "/tmp/mozc"; }

// Sorry, we don't want server on our platforms.
std::string MacUtil::GetServerDirectory() { return ""; }

// Useless info.
std::string MacUtil::GetOSVersionString() { return ""; }

// For data encryption/decryption.
// Original implementation says return empty string if failed instead of aborts
// program, so it's acceptable.
std::string MacUtil::GetSerialNumber() { return ""; }
}  // namespace mozc
