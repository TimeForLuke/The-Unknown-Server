# The Unknown Server

This repository contains the configuration files for *The Unknown*, a Minecraft server. The server can be joined with the IP `omniscimus.net`.

## World border

Because the amount of available storage space is about 4 GB, there is a world border in place. The size of the world border was calculated as follows:

1. Using [a large file of chunk sizes](https://gist.github.com/haxney/813325) and [a bash script](https://gist.github.com/Omniscimus/0a38f99002c6ecf43cf7857601a76acc), the average size of a chunk was established as approximately `3014` bytes.
1. 4 GB is equal to `4,000,000,000` bytes.
1. In 4 GB, we can fit `4,000,000,000 / 3014 = 1,327,140` chunks of average size.
1. A square world border with `1,327,140` chunks has a width of `sqrt(1,327,140) = 1152` chunks.
1. The width of `1152` chunks in a line is `16 * 1152 = 18,432` blocks.

Because the world border information is kept in the world save files, this repository does not contain the border. To set it, run the following command:

`/worldborder set 18432`

## Server hardware issues

Hosting a server costs money. The server's speed (higher speed => less lag) depends on how much money we can spend on hosting. Similarly, we can increase the world border size if we have enough money to pay for a server with more storage space. (To increase the world border, we'd need a more or less persistent source of income, because we pay for the server monthly and if we increase the size, we can't easily decrease it again without a map reset.)

## Plugins

Before (a new version of) a plugin is added, it should be checked if it creates any files that should be ignored by Git because it contains privacy-sensitive information. Such files should be included in `.gitignore` files in the appropriate directories.

The following plugins are currently in use:

- [EssentialsX](https://ci.drtshock.net/job/EssentialsX/) v2.0.1-b319. Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [EssentialsXChat](https://ci.drtshock.net/job/EssentialsX/) v2.0.1-b319. Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [EssentialsXSpawn](https://ci.drtshock.net/job/EssentialsX/) v2.0.1-b319. Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [GriefPrevention](https://www.spigotmc.org/resources/griefprevention.1884/) v16.7.1. Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [LuckPerms](https://www.spigotmc.org/resources/luckperms-an-advanced-permissions-plugin.28140/) v3.3. Licensed under the MIT License. The full text of this license can be found in the file `licenses/MIT-Luckperms.txt`.
- [NoCheatPlus](https://github.com/NoCheatPlus/Docs/wiki/Notable-Builds) development version, commit 7e43dea. Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [Vault](http://dev.bukkit.org/bukkit-plugins/vault/) v1.5.6. Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [WorldEdit](http://builds.enginehub.org/) v6.1. Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [WorldGuard](http://builds.enginehub.org/) development version, commit 3a8e3e8. Licensed under the GNU Lesser General Public License version 3. The full text of this license can be found in the file `licenses/LGPLv3-WorldGuard.txt`.

## Setting up the server

- First get the jars in `bin/` using `git lfs pull`
- Download Docker
- Run `docker build .`
- Run blabla TODO

## Contributing

If you have any suggestions for improvements to the server, you can open an issue in the GitHub issue tracker, or contact one of the administrators. Or, even better, you can fork this project on GitHub and make the improvements yourself. Pull requests are welcome! (But not guaranteed to be merged; it may be better to open an issue first if you plan on making radical changes.)

## License

This project is licensed under the MIT license, which can be found in the file `LICENSE`.
