# 
class role::student_workstation_2004_rtx2070 {
  # Each node should have only one role.
  # The role should include all profiles required to make it work.

  # All roles should include the base profile
  include profile::base

  include profile::desktop::base
  include profile::config::ldap_client
  include profile::config::auto_fs
  include profile::config::gnome
  include profile::config::lightdm
  # include profile::config::upgrades
  # include profile::config_restart_daily
  # include profile::config_printers

  # include profile::config::nvidia_rtx2070

  include profile::apps::blender
  include profile::apps::krita
  include profile::apps::cura
  include profile::apps::gimp
  include profile::apps::godot

  # include profile::app_audio_suite
  # include profile::app_games
  # include profile::app_darktable
  # include profile::app_steam

  # include profile::utils_multimedia
  # include profile::utils_browsers
  # include profile::utils_misc
  # include profile::utils_gnome
  # include profile::utils_screencast
  # include profile::utils_desktops
  # include profile::utils_discord
  # include profile::utils_fonts
  # include profile::utils_play_on_linux

  # include profile::dev_java
  # include profile::dev_python
  # include profile::dev_general_utils
  # include profile::dev_git_desktop
  # include profile::dev_godot
  # include profile::dev::vs_code
  # include profile::dev::processing
  # include profile::dev::virtual_machines

}


