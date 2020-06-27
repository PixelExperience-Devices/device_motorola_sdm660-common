package sdm660

import (
    "android/soong/android"
    "android/soong/cc"
    "strings"
)

func initFlags(ctx android.BaseContext) []string {
    var cflags []string

    var config = ctx.AConfig().VendorConfig("MOTOROLA_SDM660_INIT")
    var lib = strings.TrimSpace(config.String("DEVICE_LIB"))

    if len(strings.TrimSpace(lib)) != 0 {
        cflags = append(cflags, "-DTARGET_PROVIDES_DEVICE_LIBINIT")
    }
    return cflags
}

func initStaticLibs(ctx android.BaseContext) []string {
    var staticlibs []string

    var config = ctx.AConfig().VendorConfig("MOTOROLA_SDM660_INIT")
    var lib = strings.TrimSpace(config.String("DEVICE_LIB"))

    if len(strings.TrimSpace(lib)) != 0 {
        staticlibs = append(staticlibs, lib)
    }
    return staticlibs
}

func initLibrary(ctx android.LoadHookContext) {
    type props struct {
        Target struct {
            Android struct {
                Cflags []string
                Whole_static_libs []string
            }
        }
    }

    p := &props{}
    p.Target.Android.Cflags = initFlags(ctx)
    p.Target.Android.Whole_static_libs = initStaticLibs(ctx)
    ctx.AppendProperties(p)
}

func initLibraryFactory() android.Module {
    module, library := cc.NewLibrary(android.HostAndDeviceSupported)
    library.BuildOnlyStatic()
    newMod := module.Init()
    android.AddLoadHook(newMod, initLibrary)
    return newMod
}
