const mineflayer = require('mineflayer')
const mineflayerViewer = require('prismarine-viewer').mineflayer

const bot = mineflayer.createBot({
  host: 'michi.my',
  username: 'MiXBot',
  auth: 'microsoft'
})

bot.once('spawn', () => {
  mineflayerViewer(bot, { port: 3007, firstPerson: false })
})
