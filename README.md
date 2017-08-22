# The Unknown Server

This repository contains the configuration for the Minecraft server.

## World border

Because the amount of available storage space is about 4 GB (more donations => more space :smile:), there is a world border in place. The size of the world border was calculated as follows:

1. Using [a large file of chunk sizes](https://gist.github.com/haxney/813325) and [a bash script](https://gist.github.com/Omniscimus/0a38f99002c6ecf43cf7857601a76acc), the average size of a chunk was established as approximately `3014` bytes.
1. 5 GB is equal to `5,000,000,000` bytes.
1. In 5 GB, we can fit `5,000,000,000 / 3014 = 1,658,925` chunks of average size.
1. A square world border with `1,658,925` chunks has a width of `sqrt(1,658,925) = 1288` chunks.
1. The width of `1288` chunks in a line is `16 * 1288 = 20,608` blocks.

Because the world border information is kept in the world save files, this repository does not contain the border. To set it, run the following command:

`/worldborder set 20608`
