<p align="center"><img src="logo.jpg" alt="Logo" width="150px"></p>

# The Unknown Server

This repository contains the configuration files for *The Unknown*, a Minecraft server. Please refer to [the wiki](https://github.com/The-Unknown-Minecraft/The-Unknown-Server/wiki) for non-technical information about the server.

## Contributing

There are many ways to contribute to the server. To find out how you can help, have a look at [the contributing guide](https://github.com/The-Unknown-Minecraft/The-Unknown-Server/wiki/Contributing).

If you would like to improve something in the server's configuration or its plugins, you can fork this project on GitHub and make the improvements yourself. Pull requests are welcome! (But not guaranteed to be merged; it may be better to open an issue first if you plan on making radical changes.) You can also click the Edit button (:pencil2:) to the top right of files in the repository. If you experience any problems, don't hesitate to send an email to the administrator!

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

We use Docker to run the server in a container. We also compile the server and most plugins from source. Some people may find it easier to run the server without installing Docker and compiling stuff. You will then have to install some additional programs. If you use Docker, you only have to install Docker.

### (Easiest way) Without Docker, download the server and plugins from somewhere

This may be the easiest way to run the server for people unfamiliar with Docker. You will only need to install Java 1.8 or higher. Download the repository. Download all required jar-files for the server and plugins yourself and put them in the `server/` and `server/plugins/` directories. Then open a terminal window (or the `cmd` utility for Windows), change directory to the `server/` directory and start the server using the following command (replace <version> with the version of Spigot in the `server/` directory):

```bash
java -jar spigot-<version>.jar
```

### Without Docker, compile the server and plugins yourself

To test the server without Docker, you will need to install Java 1.8 or higher, Git, [git-lfs](https://git-lfs.github.com/) and Maven. Download or clone this repository, open a terminal, change directory to this repository and run the following commands to get all required plugin and server files in their proper locations:

```bash
git lfs pull
scripts/compile-spigot.sh server
scripts/compile-plugins.sh server/plugins
cp bin/* server/plugins
```

Then change directory to `server/` and start the server using the following command (replace <version> with the version of Spigot in the `server/` directory):

```bash
java -jar spigot-<version>.jar
```

### Production

To run the server the same way as in production, you will need to install [Docker](https://www.docker.com) and [git-lfs](https://git-lfs.github.com/).

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
