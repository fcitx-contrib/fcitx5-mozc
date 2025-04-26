#include "base/process.h"

namespace mozc {
bool Process::OpenBrowser(zstring_view url) {}
bool Process::SpawnMozcProcess(zstring_view filename, zstring_view arg,
                               size_t *pid) {}
} // namespace mozc
