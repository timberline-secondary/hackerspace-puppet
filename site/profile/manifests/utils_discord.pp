class profile::utils_discord {
  include wget
  include gdebi

  wget::fetch { 'discord.deb':
    source      => 'https://dl.discordapp.net/apps/linux/0.0.4/discord-0.0.4.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
    package { 'discord':
      provider => gdebi,
      ensure   => latest,
      source   => '/tmp/discord.deb',
    }

}