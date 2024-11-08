// Test only


const random = (min, max) => {
  max = max + 1
  const minCeiled = Math.ceil(min)
  const maxFloored = Math.floor(max)
  return Math.floor(Math.random() * (maxFloored - minCeiled) + minCeiled)
}

const simulatePainiteSmall = (percent) => {
    let stones = 1
    while(true) {
        const chance = Math.round(100 * percent)
        if(random(1, 10000) <= chance)
            break
        else
            stones++
    }
    return { stones, price: stones * 10_000 }
}

const simulatePainiteShard = (percent) => {
    let stones = 1
    while(true) {
        const chance = Math.round(100 * percent / 5)
        if(random(1, 10000) <= chance)
            break
        else
            stones++
    }
    return { stones, price: stones * 3_000 }
}

const runs = 1_000_000
const enchantment_chance = 20

let tries = []
for(let i = 1; i <= runs; i++) {
    tries.push(simulatePainiteSmall(enchantment_chance))
}

let triesShard = []
for(let i = 1; i <= runs; i++) {
    triesShard.push(simulatePainiteShard(enchantment_chance))
}


const avgStones = tries.reduce((acc, x) => acc + x.stones, 0) / tries.length
const avgPrice = tries.reduce((acc, x) => acc + x.price, 0) / tries.length

const highestStonesSmall = tries.reduce((acc, x) => Math.max(acc , x.stones), 0)
const highestPriceSmall = tries.reduce((acc, x) => Math.max(acc , x.price), 0)


const avgStonesShard = triesShard.reduce((acc, x) => acc + x.stones, 0) / triesShard.length
const avgPriceShard = triesShard.reduce((acc, x) => acc + x.price, 0) / triesShard.length

// const highestStonesShard = triesShard.reduce((acc, x) => Math.max(acc , x.stones), 0)
// const highestPriceShard = triesShard.reduce((acc, x) => Math.max(acc , x.price), 0)

console.log("Small", "Avg: ", avgStones, "stones, ", avgPrice / 1000, "k")
// console.log("Small", "Max: ", highestStonesSmall, "stones, ", highestPriceSmall / 1000, "k")

console.log("Shard", "Avg: ", avgStonesShard, "stones, ", avgPriceShard / 1000, "k")
// console.log("Shard", "Max: ", highestStonesShard, "stones, ", highestPriceShard / 1000, "k")
