#include "base/process.h"

namespace mozc {
bool Process::OpenBrowser(absl::string_view url) {}
bool Process::SpawnMozcProcess(absl::string_view filename,
                               absl::string_view arg, size_t *pid) {}
} // namespace mozc
