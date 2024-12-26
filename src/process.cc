#include "base/process.h"

namespace mozc {
bool Process::OpenBrowser(const std::string &url) {}
bool Process::SpawnMozcProcess(const std::string &filename,
                               const std::string &arg, size_t *pid) {}
}  // namespace mozc
