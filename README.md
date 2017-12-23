# The Unknown Server

<img src="logo.jpg" alt="Logo" style="width: 150px;">

This repository contains the configuration files for *The Unknown*, a Minecraft server. Please refer to [the wiki](https://github.com/The-Unknown-Minecraft/The-Unknown-Server/wiki) for non-technical information about the server.

## Contributing

If you have any suggestions for improvements to the server, you can open an issue in the GitHub issue tracker, or contact one of the administrators. Or, even better, you can fork this project on GitHub and make the improvements yourself. Pull requests are welcome! (But not guaranteed to be merged; it may be better to open an issue first if you plan on making radical changes.)

## Plugins

Before (a new version of) a plugin is added, it should be checked if it creates any files that should be ignored by Git because it contains privacy-sensitive information. Such files should be included in `.gitignore` files in the appropriate directories.

The following plugins are currently in use:

- [Bukkit-Mailman](https://github.com/Omniscimus/Bukkit-Mailman). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [EssentialsX](https://ci.drtshock.net/job/EssentialsX/). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [EssentialsXChat](https://ci.drtshock.net/job/EssentialsX/). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [EssentialsXSpawn](https://ci.drtshock.net/job/EssentialsX/). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [GriefPrevention](https://www.spigotmc.org/resources/griefprevention.1884/). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [LuckPerms](https://www.spigotmc.org/resources/luckperms-an-advanced-permissions-plugin.28140/). Licensed under the MIT License. The full text of this license can be found in the file `licenses/MIT-Luckperms.txt`.
- [NoCheatPlus](https://github.com/NoCheatPlus/Docs/wiki/Notable-Builds). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [Vault](http://dev.bukkit.org/bukkit-plugins/vault/). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.
- [WorldEdit](http://builds.enginehub.org/). Licensed under the GNU General Public License v3.0. The full text of this license can be found in the file `licenses/GPLv3.txt`.

## Setting up the server

You will need to install [Docker](https://www.docker.com) and [git-lfs](https://git-lfs.github.com/) to run the server.

1. First get the jars in `bin/` using `git lfs pull`
1. Run `docker build -t the-unknown .`
1. Run `docker run -dit --mount type=bind,source=$(pwd)/server,destination=/data -p 25565:25565 --name minecraft the-unknown:latest`. The first run may take considerable time, because it needs to compile the server and most plugins.

To view the logs, run `docker container logs minecraft`. To use the console, run `docker attach minecraft`. To detach from the console (but keep the server running), press `Ctrl + p` followed by `Ctrl q`.

Stop the server by running `stop` in the Minecraft console and pressing `Ctrl + c` when asked to.

To start the server again, run `docker start minecraft`.

### World border

Because the world border information is kept in the world save files, this repository does not contain the border. To set it, run the following command:

`/worldborder set 18432`

## License

This project is licensed under the MIT license, which can be found in the file `LICENSE`.
