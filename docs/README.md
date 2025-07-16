# MiXBot
[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/SchweGELBin/MiXBot/total)](https://github.com/SchweGELBin/MiXBot/releases)
[![GitHub License](https://img.shields.io/github/license/SchweGELBin/MiXBot)](../LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/SchweGELBin/MiXBot)](https://github.com/SchweGELBin/MiXBot/releases/latest)

- Minecraft MiXBot
- Available in my [nur expressions](https://github.com/SchweGELBin/nur-expressions) repo
- This bot is very experimental and should not be used in the current state

## Environment
The Bot needs following environment variables to function:
| Variable | Description | Default |
| -------- | ----------- | ------- |
| MIXBOT_DISCORD_ID |  	Your Discord User ID | - |
| MIXBOT_DISCORD_PREFIX | Your Discord Bot Command Prefix | ! |
| MIXBOT_DISCORD_TOKEN | Your Discord Bot Token | - |
| MIXBOT_HOST | Your Server IP | localhost |
| MIXBOT_NAME | Your Bot's Name | MiXBot |
| MIXBOT_ONLINE | Authenticate with Microsoft | false |

## Commands
### Discord
| Command | Arguments | Description |
| ------- | --------- | ----------- |
| goto | [x] \<y\> [z] | Goto coordinates |
| help | \<command\> | Show command information |
| ping | - | Reply with "Pong!" |
| join | - | Join the Server |
| leave | - | Leave the Server |
| msg | \<name\> | Send Message to chat/user |
| status | - | Give Player List, TPS, Coordinates |

### Minecraft
| Command | Arguments | Description |
| ------- | --------- | ----------- |
| follow | \<name\> | Follow a player |
| stop | - | Stop the current action |
| tp | - | Close the nearest trapdoor |

### Extra
Minecraft: "/msg \<bot\> \<msg\>" -> Bridge to Discord
