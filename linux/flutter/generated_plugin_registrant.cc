//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_dropdown_plus/flutter_dropdown_plus_plugin.h>
#include <objectbox_sync_flutter_libs/objectbox_sync_flutter_libs_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_dropdown_plus_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterDropdownPlusPlugin");
  flutter_dropdown_plus_plugin_register_with_registrar(flutter_dropdown_plus_registrar);
  g_autoptr(FlPluginRegistrar) objectbox_sync_flutter_libs_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ObjectboxSyncFlutterLibsPlugin");
  objectbox_sync_flutter_libs_plugin_register_with_registrar(objectbox_sync_flutter_libs_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
