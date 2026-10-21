#include "base/mac/mac_util.h"

namespace mozc {
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

} // namespace mozc
