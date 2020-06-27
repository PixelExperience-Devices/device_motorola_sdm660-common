package sdm660

import (
    "android/soong/android"
)

func init() {
    android.RegisterModuleType("motorola_sdm660_init_library_static", initLibraryFactory)
}
