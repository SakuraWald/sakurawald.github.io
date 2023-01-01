---
title: A Discussion About Minecraft Server Configurations
tags: []
id: '58142'
categories:
  - - uncategorized
date: 2022-12-16 06:26:48
---

# A Discussion About Minecraft Server Configurations

## Abstract

这篇文章将讨论如何对一个 `Minecraft服务端` 进行 `基本配置`，`优化配置` 以及一些进阶的内容。

我们将讨论如何在 `减少对VANILLA做出改变` 的情况下，对 `服务端核心` 进行性能优化。

这篇文章会从最基本的配置开始，并且逐渐介绍一些比较重要的 `配置项`。

当然，我们可能会略过一些无关影响的项目。

## How to choose the best server-core ?

如何选择 `服务端核心` 取决于你的需求。

由于这篇文章主要侧重于针对 `插件服` 的优化讨论，所以我们不会过多地讨论 `模组服` 的优化问题。

> 对于 `模组服` 而言，更应当考虑的是 `兼容性问题` 和 `安全性问题`。
> 
> 对于安装有多个 `模组` 的 `模组服` 而言，首要的任务是解决上述两个问题，然后再考虑解决 `影响较大的性能问题`。
> 
> > 目前来说，模组服可以选择两种主流的核心：
> > 
> > *   基于Forge + Bukkit 的核心：这类核心将同时支持 `Bukkit` 和 `Forge` 的 `API`，但或多或少存在不同的兼容问题，
> >     
> >     本质上来说，由于两套事件系统是相对独立的，如何较好地来处理EventBus一直是比较头疼的问题。
> >     
> >     > 如果你希望有较好的兼容性，可以尝试 `CatServer`
> >     > 
> >     > 如果你希望保持最新版本的更近，可以尝试 `Mohist`
> >     > 
> >     > > 尽管 `Mohist` 的开发团队尽力地保持版本跟进，并且他们宣称拥有 `99%的Bukkit插件兼容性`，但事实并不是这样的。
> >     > > 
> >     > > Mohist经常会出现莫名其妙的 `NPE异常`，并且对于部分 `流行插件` 仍具有兼容问题。
> >     > 
> >     > > 一些已经停止维护的核心，如MCPC，KCauldron等，以及他们的接力者将不被提及。
> >     
> > *   基于 Forge/Fabric 的核心：如果你选择了这类核心，那么将免去了 `插件` 的那些麻烦事情。
> >     
> >     你可能将无法安装插件，但你或许根本不需要他们。
> >     
> >     > 使用 `Mixin技术` 的 `Sponge` 比较激进，但是如果它符合你的需求，可以做一个尝试。
> >     > 
> >     > 此外， `Fabric` 搭配 `优化类模组` 也是不错的选择。
> >     

对于 `插件服` 而言，我们将首先排除掉 `Vanilla` ，这是 `Mojang` 所提供的默认服务端 ，尽管它可以保证原汁原味的特性，但由于极其糟糕的性能表现，以及不支持 `Bukkit API`，将不符合大部分的需求。

其次考虑 `CraftBukkit`，最大的特色是加入了 `Bukkit API` 的支持，这构成了 `插件服` 的基础。

但如果你打算使用 `CraftBukkit`，请不妨考虑下 `Spigot`，后者拥有 `更好的性能`，并且对 `特性的改变` 与前者相差甚微。

接下来，我们会讲本篇文章的主角：`Paper` 是一个注重于 `性能` 与 `安全` 的 `下一代服务端`，在保持 `较多特性` 不被改变的情况下，提供了 `极大的性能优化`。

并且，你根本不需要担心 `Bukkit API` 的兼容性问题，甚至相反地，`主流的插件` 会主动选择使用提供了更多功能的 `Paper API`，而这一切都是 `向下兼容的`

> `插件开发者` 应该尽量选择使用 `Paper API`，而不是 `Spigot API`。以便免费地获得 `性能提升`，同时不丢失 `兼容性`。

进一步地，`Purpur` 是一个 `基于Paper的服务端`，它提供 `更进一步的性能优化`，以及 `更高自由度的配置项`。

本文会着重讨论 `Paper/Purpur` 核心。

> 如果 `Paper` 已经完全足够满足你的需求，那么你可以选择就使用它。但 `Purpur` 仍然有许多有用的 `特性开关`，以及 `性能优化`

我知道有许多 `基于Paper/Purpur的服务端`，但 `Paper/Purpur` 已经提供了足够多的 `保守的性能优化`，以及一些 `激进的性能优化`。

在这个前提下，选择 `其他更进一步的优化端`，将很难获得 `显著的性能提升`，并且将引入更多的 `不稳定性`。

## How to config the server-core ?

这个章节将占据大部分的内容，而且也是 `最重要` 的，或许也是 `最难的`。

重新强调一遍，本篇文章基于的原则是：**最小化对VANILLA的改变的同时，尽可能地获得优化配置。**

> `优化配置` 是糟糕的方案，他们本应该在 `代码` 中完成优化，那样才会是最有效的。

我们会循序渐进地讨论每个配置项。

### server.properties

```properties
#Minecraft server properties
enable-jmx-monitoring=false
# 请关闭基于明文传输的RCON协议，如果坚持使用，你的密码将可能被嗅探，并导致潜在的安全问题。
rcon.port=25575
level-seed=
gamemode=survival
enable-command-block=false
# 是否启用"状态查询协议"，这将决定Server List的Status是否会正常显示。
enable-query=false
generator-settings={}
# 如果你希望将不当言论当成有效证据并提交给Mojang的话，请启用该项。
enforce-secure-profile=false
level-name=world
motd=A Minecraft Server
query.port=11565
pvp=true
generate-structures=true
max-chained-neighbor-updates=1000000
difficulty=hard
network-compression-threshold=256
max-tick-time=60000
require-resource-pack=false
use-native-transport=true
max-players=20
online-mode=false
enable-status=true
allow-flight=true
broadcast-rcon-to-ops=true
# 尽管修改该项可以极大地影响性能，但同时也将极大地损坏特性。请不要碰这项。
view-distance=10
server-ip=
resource-pack-prompt=
allow-nether=true
server-port=25565
enable-rcon=false
sync-chunk-writes=true
op-permission-level=4
server-name=Unknown Server
prevent-proxy-connections=false
# 对于较高版本的Client，当Cursor悬浮在Status栏时，可以查询到在线玩家。该项对带宽有极小影响。
hide-online-players=true
resource-pack=
entity-broadcast-range-percentage=100
# 见view-distance
simulation-distance=10
rcon.password=
player-idle-timeout=0
debug=false
force-gamemode=false
# 不要指望通过设置该值来避免流量攻击，当你需要用到该值时，已经为时过晚。
rate-limit=0
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
previews-chat=false
spawn-animals=true
function-permission-level=3
level-type=minecraft\:normal
text-filtering-config=
spawn-monsters=true
enforce-whitelist=false
spawn-protection=0
resource-pack-sha1=
max-world-size=29999984
```

对于 `server.properties` 而言，你应当只期望在这里完成 `最基本的设置`，通过修改这个 `配置文件` 不会让你获得 `期望的性能提升`。（不要碰 `view-distance` 和 `simulation-distance` ，如果你在乎 `特性` 的话）

### bukkit.yml

```yaml
settings:
  allow-end: true
  warn-on-overload: true
  permissions-file: permissions.yml
  update-folder: update
  plugin-profiling: false
  # 对于相同IP来说，两次连接之间必须等待的间隔：该项可以一定程度防御流量攻击。
  connection-throttle: 4000
  query-plugins: false
  deprecated-verbose: default
  shutdown-message: Server closed.
  minimum-api: none
  use-map-color-cache: true
# 如果你遭遇了实体过多的情况，可以选择减少spawn-limits中的数值。
# 一般来说，减少ambient和water-ambient数值不会有什么影响，但是尽量不要减少monsters
spawn-limits:
  monsters: 70
  animals: 10
  water-animals: 5
  water-ambient: 20
  water-underground-creature: 5
  axolotls: 5
  ambient: 15
chunk-gc:
  period-in-ticks: 600
ticks-per:
  animal-spawns: 400
  # 请注意，该项会对性能造成较大的影响。该项的默认值是一个非常疯狂的数值。它会按每秒20次的频率不断计算可生成怪物的区域。
  # 可以比较安全地提升该项数值，因为大部分的计算量实际上是无效的，对特性的改变极小。
  monster-spawns: 1
  water-spawns: 20
  water-ambient-spawns: 20
  water-underground-creature-spawns: '20'
  axolotl-spawns: 20
  ambient-spawns: 400
  # 可以选择禁用Bukkit的自动保存，因为Paper提供了一个更加高效且稳定的存储算法。
  autosave: 0
aliases: now-in-commands.yml
```

### spigot.yml

```yaml
# This is the main configuration file for Spigot.
# As you can see, there's tons to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
# For a reference for any variable inside this file, check out the Spigot wiki at
# http://www.spigotmc.org/wiki/spigot-configuration/
#
# If you need help with the configuration or have any questions related to Spigot,
# join us at the Discord or drop by our forums and leave a post.
#
# Discord: https://www.spigotmc.org/go/discord
# Forums: http://www.spigotmc.org/

settings:
  debug: false
  sample-count: 0
  # 核心在未响应状态下，等待多久执行重启。对于较差的CPU或者网络状态，建议设置该值为60到180s以避免陷入"不正常的循环重启"之中
  # 一个注定失败的网络请求通常会耗费1-2分钟时间。（一般来说，开发者们总是假设网络请求不会失败，并且也很少为失败情况编写有效的处理代码。）
  timeout-time: 180
  restart-on-crash: true
  restart-script: ./start.sh
  bungeecord: false
  player-shuffle: 0
  user-cache-size: 1000
  save-user-cache-on-stop-only: false
  # 请务必禁用Spigot提供的AC功能，因为他们总是造成false-positive，以及影响游玩体验的setback
  moved-wrongly-threshold: '2048'
  moved-too-quickly-multiplier: '2048'
  netty-threads: 4
  attribute:
    maxHealth:
      max: 2048
    movementSpeed:
      max: 2048
    attackDamage:
      max: 2048
  log-villager-deaths: true
  log-named-deaths: true
messages:
  whitelist: message
  unknown-command: message
  server-full: message
  outdated-client: message
  outdated-server: message
  restart: message
advancements:
  disable-saving: false
  disabled:
  - minecraft:story/disabled
commands:
  spam-exclusions:
  - /skill
  silent-commandblock-console: false
  replace-commands:
  - setblock
  - summon
  - testforblock
  - tellraw
  log: true
  tab-complete: 0
  send-namespaced: true
players:
  disable-saving: false
world-settings:
  default:
    seed-ancientcity: 20083232
    seed-buriedtreasure: 10387320
    seed-mineshaft: default
    verbose: false
    below-zero-generation-in-existing-chunks: true
    end-portal-sound-radius: 0
    merge-radius:
      item: 2.5
      exp: 3
    # 如果你安装了任何清道夫插件，那么你应该回来好好看看这个配置项。
    item-despawn-rate: 6000
    view-distance: default
    simulation-distance: default
    thunder-chance: 100000
    enable-zombie-pigmen-portal-spawns: true
    wither-spawn-sound-radius: 0
    hanging-tick-frequency: 100
    arrow-despawn-rate: 1200
    trident-despawn-rate: 1200
    zombie-aggressive-towards-villager: true
    nerf-spawner-mobs: false
    mob-spawn-range: 8
    growth:
      cactus-modifier: 100
      cane-modifier: 100
      melon-modifier: 100
      mushroom-modifier: 100
      pumpkin-modifier: 100
      sapling-modifier: 100
      beetroot-modifier: 100
      carrot-modifier: 100
      potato-modifier: 100
      wheat-modifier: 100
      netherwart-modifier: 100
      vine-modifier: 100
      cocoa-modifier: 100
      bamboo-modifier: 100
      sweetberry-modifier: 100
      kelp-modifier: 100
      twistingvines-modifier: 100
      weepingvines-modifier: 100
      cavevines-modifier: 100
      glowberry-modifier: 100
    # activation-range会极大地影响性能，但仍然不建议修改该值。否则与生物特性相关的结构将会失效。
    entity-activation-range:
      animals: 32
      monsters: 32
      raiders: 48
      misc: 16
      water: 16
      villagers: 32
      flying-monsters: 32
      wake-up-inactive:
        animals-max-per-tick: 4
        animals-every: 1200
        animals-for: 100
        monsters-max-per-tick: 8
        monsters-every: 400
        monsters-for: 100
        villagers-max-per-tick: 4
        villagers-every: 600
        villagers-for: 100
        flying-monsters-max-per-tick: 8
        flying-monsters-every: 200
        flying-monsters-for: 100
      villagers-work-immunity-after: 100
      villagers-work-immunity-for: 20
      villagers-active-for-panic: true
      tick-inactive-villagers: true
      ignore-spectators: false
    entity-tracking-range:
      players: 48
      animals: 48
      monsters: 48
      misc: 32
      other: 64
    # 尽管hopper是性能代价最大的tile entity，但仍然不建议修改hopper的属性，因为Paper针对hopper使用了优化算法。
    ticks-per:
      hopper-transfer: 8
      hopper-check: 1
    hopper-amount: 1
    hopper-can-load-chunks: false
    dragon-death-sound-radius: 0
    # 如果你希望使用anti-xray功能，请记得在地图被生成之前修改structure-seed
    seed-village: 10387312
    seed-desert: 14357617
    seed-igloo: 14357618
    seed-jungle: 14357619
    seed-swamp: 14357620
    seed-monument: 10387313
    seed-shipwreck: 165745295
    seed-ocean: 14357621
    seed-outpost: 165745296
    seed-endcity: 10387313
    seed-slime: 987234911
    seed-nether: 30084232
    seed-mansion: 10387319
    seed-fossil: 14357921
    seed-portal: 34222645
    seed-stronghold: default
    hunger:
      jump-walk-exhaustion: 0.05
      jump-sprint-exhaustion: 0.2
      combat-exhaustion: 0.1
      regen-exhaustion: 6
      swim-multiplier: 0.01
      sprint-multiplier: 0.1
      other-multiplier: 0
    # 这项数值限制了每刻TNT的计算量上限，TNT的计算并不会造成laggy，除非该项被设置地足够大。
    max-tnt-per-tick: 1000
    # 为了在TPS不足20.0时保证hopper等tile entity以及普通entity的正确运算，可以将max-tick-time设置地足够长。
    max-tick-time:
      tile: 1000
      entity: 1000
  worldeditregentempworld:
    verbose: false
  faweregentempworld:
    verbose: false
config-version: 12
stats:
  disable-saving: false
  forced-stats: {}
```

### paper-global.yml

```yaml
# This is the global configuration file for Paper.
# As you can see, there's a lot to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
# 
# If you need help with the configuration or have any questions related to Paper,
# join us in our Discord or check the docs page.
# 
# The world configuration options have been moved inside
# their respective world folder. The files are named paper-world.yml
# 
# Docs: https://docs.papermc.io/
# Discord: https://discord.gg/papermc
# Website: https://papermc.io/

_version: 28
async-chunks:
  threads: -1
chunk-loading:
  autoconfig-send-distance: true
  enable-frustum-priority: false
  global-max-chunk-load-rate: -1.0
  global-max-chunk-send-rate: -1.0
  global-max-concurrent-loads: 500.0
  max-concurrent-sends: 2
  min-load-radius: 2
  player-max-chunk-load-rate: -1.0
  player-max-concurrent-loads: 20.0
  target-player-chunk-send-rate: 100.0
chunk-system:
  gen-parallelism: default
  io-threads: -1
  worker-threads: -1
collisions:
  enable-player-collisions: true
  send-full-pos-for-hard-colliding-entities: true
commands:
  fix-target-selector-tag-completion: true
  suggest-player-names-when-null-tab-completions: true
  time-command-affects-all-worlds: false
console:
  enable-brigadier-completions: true
  enable-brigadier-highlighting: true
  has-all-permissions: false
item-validation:
  book:
    author: 8192
    page: 16384
    title: 8192
  book-size:
    page-max: 2560
    total-multiplier: 0.98
  display-name: 8192
  lore-line: 8192
  resolve-selectors-in-books: false
logging:
  deobfuscate-stacktraces: true
  log-player-ip-addresses: true
  use-rgb-for-named-text-colors: true
messages:
  kick:
    authentication-servers-down: message
    connection-throttle: message
    flying-player: message
    flying-vehicle: message
  no-permission: message
  use-display-name-in-quit-message: false
misc:
  chat-threads:
    chat-executor-core-size: -1
    chat-executor-max-size: -1
  fix-entity-position-desync: true
  lag-compensate-block-breaking: true
  load-permissions-yml-before-plugins: true
  max-joins-per-tick: 3
  region-file-cache-size: 256
  strict-advancement-dimension-check: false
  use-alternative-luck-formula: false
  use-dimension-type-for-custom-spawners: false
packet-limiter:
  all-packets:
    action: KICK
    interval: 7.0
    max-packet-rate: 5000.0
  kick-message: <red><lang:disconnect.exceeded_packet_rate>
  overrides:
    ServerboundPlaceRecipePacket:
      action: DROP
      interval: 4.0
      max-packet-rate: 5.0
# 请注意，不同于bukkit.yml中的autosave，Paper中的playerdata和chunks数据是分开保存的。
player-auto-save:
  max-per-tick: -1
  rate: 6000
proxies:
  bungee-cord:
    online-mode: true
  proxy-protocol: false
  velocity:
    enabled: false
    online-mode: false
    secret: ''
scoreboards:
  save-empty-scoreboard-teams: false
  track-plugin-scoreboards: false
spam-limiter:
  incoming-packet-threshold: 300
  recipe-spam-increment: 1
  recipe-spam-limit: 20
  tab-spam-increment: 1
  tab-spam-limit: 500
timings:
  enabled: false
  hidden-config-entries:
  - database
  - proxies.velocity.secret
  history-interval: 300
  history-length: 3600
  really-enabled: false
  server-name: Unknown Server
  server-name-privacy: false
  url: https://timings.aikar.co/
  verbose: true
# 根据你的需求设置
unsupported-settings:
  allow-grindstone-overstacking: false
  allow-headless-pistons: true
  allow-permanent-block-break-exploits: true
  allow-piston-duplication: true
  perform-username-validation: true
watchdog:
  early-warning-delay: 180000
  early-warning-every: 5000
```

### paper-world-defaults.yml

```yaml
# This is the world defaults configuration file for Paper.
# As you can see, there's a lot to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
# 
# If you need help with the configuration or have any questions related to Paper,
# join us in our Discord or check the docs page.
# 
# Configuration options here apply to all worlds, unless you specify overrides inside
# the world-specific config file inside each world folder.
# 
# Docs: https://docs.papermc.io/
# Discord: https://discord.gg/papermc
# Website: https://papermc.io/

_version: 29
anticheat:
  # 如果你需要反矿透功能，请务必选择Paper的anti-xray，没有任何插件可以优于Paper的anti-xary
  anti-xray:
    enabled: false
    # mode 2对带宽和内存影响非常大，但效果也最强力。（尽管仍然可以被bypass）
    # mode 1可以较为有效地降低作弊玩家的优势。
    engine-mode: 2
    hidden-blocks:
    - chest
    - coal_ore
    - deepslate_coal_ore
    - copper_ore
    - deepslate_copper_ore
    - raw_copper_block
    - diamond_ore
    - deepslate_diamond_ore
    - emerald_ore
    - deepslate_emerald_ore
    - gold_ore
    - deepslate_gold_ore
    - iron_ore
    - deepslate_iron_ore
    - raw_iron_block
    - lapis_ore
    - deepslate_lapis_ore
    - redstone_ore
    - deepslate_redstone_ore
    lava-obscures: false
    max-block-height: 64
    replacement-blocks:
    - stone
    - oak_planks
    - deepslate
    update-radius: 2
    use-permission: false
  obfuscation:
    items:
      hide-durability: false
      hide-itemmeta: false
chunks:
  # 如果你禁用了bukkit.yml的autosave，那么请务必记得启用Paper的auto-save-interval （该项仅保存chunks）
  auto-save-interval: '6000'
  # 该项用于设置区块卸载的缓冲区，如果经常发生往复传送，则设置该项为10-20s可以避免相同区块被反复地卸载和加载。
  delay-chunk-unloads-by: 0s
  entity-per-chunk-save-limit:
    arrow: -1
    ender_pearl: -1
    experience_orb: -1
    fireball: -1
    small_fireball: -1
    snowball: -1
  fixed-chunk-inhabited-time: -1
  max-auto-save-chunks-per-tick: 24
  prevent-moving-into-unloaded-chunks: false
collisions:
  allow-player-cramming-damage: false
  allow-vehicle-collisions: true
  fix-climbing-bypassing-cramming-rule: false
  max-entity-collisions: 8
  only-players-collide: false
entities:
  armor-stands:
    do-collision-entity-lookups: true
    tick: true
  behavior:
    baby-zombie-movement-modifier: 0.5
    disable-chest-cat-detection: false
    disable-creeper-lingering-effect: false
    disable-player-crits: false
    door-breaking-difficulty:
      husk:
      - HARD
      vindicator:
      - NORMAL
      - HARD
      zombie:
      - HARD
      zombie_villager:
      - HARD
      zombified_piglin:
      - HARD
    ender-dragons-death-always-places-dragon-egg: false
    experience-merge-max-value: -1
    mobs-can-always-pick-up-loot:
      skeletons: false
      zombies: false
    nerf-pigmen-from-nether-portals: false
    parrots-are-unaffected-by-player-movement: false
    phantoms-do-not-spawn-on-creative-players: true
    phantoms-only-attack-insomniacs: true
    piglins-guard-chests: true
    pillager-patrols:
      disable: false
      spawn-chance: 0.2
      spawn-delay:
        per-player: false
        ticks: 12000
      start:
        day: 5
        per-player: false
    should-remove-dragon: false
    spawner-nerfed-mobs-should-jump: false
    zombie-villager-infection-chance: -1.0
    zombies-target-turtle-eggs: true
  entities-target-with-follow-range: false
  mob-effects:
    immune-to-wither-effect:
      wither: true
      wither-skeleton: true
    spiders-immune-to-poison-effect: true
    undead-immune-to-certain-effects: true
  spawning:
    all-chunks-are-slime-chunks: false
    # 为不同的item设置不同的despawn-rate，这里可能需要进行设置。
    # 保持默认配置也是可以接受的，因为item一般不造成服务端卡顿。
    alt-item-despawn-rate:
      enabled: true
      items:
        cobblestone: 300
    count-all-mobs-for-spawning: false
    creative-arrow-despawn-rate: default
    despawn-ranges:
      ambient:
        hard: 128
        soft: 32
      axolotls:
        hard: 128
        soft: 32
      creature:
        hard: 128
        soft: 32
      misc:
        hard: 128
        soft: 32
      monster:
        hard: 128
        soft: 32
      underground_water_creature:
        hard: 128
        soft: 32
      water_ambient:
        hard: 64
        soft: 32
      water_creature:
        hard: 128
        soft: 32
    disable-mob-spawner-spawn-egg-transformation: true
    duplicate-uuid:
      mode: SAFE_REGEN
      safe-regen-delete-range: 32
    filter-nbt-data-from-spawn-eggs-and-related: true
    iron-golems-can-spawn-in-air: false
    monster-spawn-max-light-level: -1
    non-player-arrow-despawn-rate: default
    per-player-mob-spawns: true
    scan-for-legacy-ender-dragon: true
    skeleton-horse-thunder-spawn-chance: default
    slime-spawn-height:
      slime-chunk:
        maximum: 40.0
      surface-biome:
        maximum: 70.0
        minimum: 50.0
    spawn-limits:
      ambient: -1
      axolotls: -1
      creature: -1
      monster: -1
      underground_water_creature: -1
      water_ambient: -1
      water_creature: -1
    wandering-trader:
      spawn-chance-failure-increment: 25
      spawn-chance-max: 75
      spawn-chance-min: 25
      spawn-day-length: 24000
      spawn-minute-length: 1200
    wateranimal-spawn-height:
      maximum: default
      minimum: default
environment:
  disable-explosion-knockback: false
  disable-ice-and-snow: false
  disable-teleportation-suffocation-check: false
  disable-thunder: false
  fire-tick-delay: 30
  frosted-ice:
    delay:
      max: 40
      min: 20
    enabled: true
  generate-flat-bedrock: false
  nether-ceiling-void-damage-height: disabled
  optimize-explosions: true
  portal-create-radius: 16
  portal-search-radius: 128
  portal-search-vanilla-dimension-scaling: true
  treasure-maps:
    enabled: true
    find-already-discovered:
      loot-tables: default
      villager-trade: false
  water-over-lava-flow-speed: 5
# 如果你愿意付出使用anti-xary的mode2的代价，那么最好也为"结构生成"启用随机种子
# 否则，Github上的SeedCrackerX将可以在取得一定特征值后，轻松地完成对seed的暴力破解。
feature-seeds:
  generate-random-seeds-for-all: false
fishing-time-range:
  maximum: 600
  minimum: 100
fixes:
  disable-unloaded-chunk-enderpearl-exploit: true
  falling-block-height-nerf: disabled
  fix-curing-zombie-villager-discount-exploit: false
  fix-items-merging-through-walls: false
  prevent-tnt-from-moving-in-water: false
  split-overstacked-loot: true
  tnt-entity-height-nerf: disabled
hopper:
  cooldown-when-full: true
  disable-move-event: false
  ignore-occluding-blocks: false
lootables:
  auto-replenish: false
  max-refills: -1
  refresh-max: 2d
  refresh-min: 12h
  reset-seed-on-fill: true
  restrict-player-reloot: true
maps:
  item-frame-cursor-limit: 128
  item-frame-cursor-update-interval: 10
max-growth-height:
  bamboo:
    max: 16
    min: 11
  cactus: 3
  reeds: 3
misc:
  disable-end-credits: false
  disable-relative-projectile-velocity: false
  disable-sprint-interruption-on-attack: false
  light-queue-size: 20
  max-leash-distance: 10.0
  # 尽管有些高性能的红石实现算法，但他们往往只支持一些特定的版本，并且也不是完美复现特性。
  # 对于上述所提到的服务端核心，该项均使用的是VANILLA实现算法。
  redstone-implementation: VANILLA
  shield-blocking-delay: 5
  show-sign-click-command-failure-msgs-to-player: false
  update-pathfinding-on-block-update: false
scoreboards:
  allow-non-player-entities-on-scoreboards: false
  use-vanilla-world-scoreboard-name-coloring: false
spawn:
  allow-using-signs-inside-spawn-protection: false
  keep-spawn-loaded: true
  keep-spawn-loaded-range: 10
tick-rates:
  # 对于entity计算量过大的情况下，通常可以修改该项来进行优化。
  # 这里不会公布一份万能的配置，但你可以通过阅读timings或者sparks报告来填写这些数值。
  # 对于pillager和zombified_piglin的行为限制略有不同。
  behavior: {}
  container-update: 1
  grass-spread: 1
  mob-spawner: 1
  # 见behavior
  # 如果villager和zombie的计算量过大，则应当着重查看该项。
  sensor: {}
unsupported-settings:
  fix-invulnerable-end-crystal-exploit: true
```

### pufferfish.yml

```yaml
# Pufferfish Configuration
# Check out Pufferfish Host for maximum performance server hosting: https://pufferfish.host
# Join our Discord for support: https://discord.gg/reZw4vQV9H
# Download new builds at https://ci.pufferfish.host/job/Pufferfish
info:
  version: '1.0'
# These values define a entity's maximum lifespan. If an
# entity is in this list and it has survived for longer than
# that number of ticks, then it will be removed. Setting a value to
# -1 disables this feature.
entity_timeouts:
  SNOWBALL: -1
  LLAMA_SPIT: -1
sentry-dsn: ''
enable-books: true
enable-suffocation-optimization: true
# 这一项并不意味着mob-spawning是fully-async的，仍然是parted-async，但开启这项基本不造成特性改变。
enable-async-mob-spawning: true
# Optimizes projectile settings
projectile:
  max-loads-per-tick: 10
  max-loads-per-projectile: 10
# Optimizes entity brains when
# they're far away from the player
# 对于实体过多的情况，使用DAB来控制brain-tick是有效的方案，但是请注意通过blacklist过滤掉不适宜的实体。
# 修改该数值会造成较为明显的特性改变。
dab:
  enabled: false
  start-distance: 12
  max-tick-freq: 20
  activation-dist-mod: 8
  blacklisted-entities: []
inactive-goal-selector-throttle: false
# Settings for things that don't belong elsewhere
misc:
  disable-method-profiler: true
  disable-out-of-order-chat: false
```

### purpur.yml

```yaml
# This is the main configuration file for Purpur.
# As you can see, there's tons to configure. Some options may impact gameplay, so use
# with caution, and make sure you know what each option does before configuring.
#
# If you need help with the configuration or have any questions related to Purpur,
# join us in our Discord guild.
#
# Website: https://purpurmc.org 
# Docs: https://purpurmc.org/docs 

verbose: false
settings:
  block-fall-multipliers:
    minecraft:black_bed:
      distance: 0.5
    minecraft:yellow_bed:
      distance: 0.5
    minecraft:lime_bed:
      distance: 0.5
    minecraft:brown_bed:
      distance: 0.5
    minecraft:light_gray_bed:
      distance: 0.5
    minecraft:magenta_bed:
      distance: 0.5
    minecraft:purple_bed:
      distance: 0.5
    minecraft:light_blue_bed:
      distance: 0.5
    minecraft:pink_bed:
      distance: 0.5
    minecraft:red_bed:
      distance: 0.5
    minecraft:hay_block:
      damage: 0.2
    minecraft:white_bed:
      distance: 0.5
    minecraft:gray_bed:
      distance: 0.5
    minecraft:cyan_bed:
      distance: 0.5
    minecraft:blue_bed:
      distance: 0.5
    minecraft:green_bed:
      distance: 0.5
    minecraft:orange_bed:
      distance: 0.5
  fix-projectile-looting-transfer: false
  blast-resistance-overrides: {}
  messages:
    cannot-ride-mob: <red>You cannot mount that mob
    afk-broadcast-away: <yellow><italic>%s is now AFK
    afk-broadcast-back: <yellow><italic>%s is no longer AFK
    afk-tab-list-prefix: '[AFK] '
    afk-tab-list-suffix: ''
    credits-command-output: <green>%s has been shown the end credits
    demo-command-output: <green>%s has been shown the demo screen
    ping-command-output: <green>%s's ping is %sms
    ram-command-output: '<green>Ram Usage: <used>/<xmx> (<percent>)'
    rambar-command-output: <green>Rambar toggled <onoff> for <target>
    tpsbar-command-output: <green>Tpsbar toggled <onoff> for <target>
    dont-run-with-scissors: <red><italic>Don't run with scissors!
    uptime-command-output: <green>Server uptime is <uptime>
    unverified-username: default
    sleep-skipping-night: default
    sleeping-players-percent: default
    death-message:
      run-with-scissors: <player> slipped and fell on their shears
      stonecutter: <player> has sawed themself in half
  broadcasts:
    advancement:
      only-broadcast-to-affected-player: false
    death:
      only-broadcast-to-affected-player: false
  # 与anti-xray搭配使用
  seed:
    structure:
      buried_treasure: -1
      mineshaft: -1
  # 该项用于规定laggy的判定阈值，与villager的动态tick-brain搭配使用。
  lagging-threshold: 16.0
  command:
    rambar:
      title: <gray>Ram<yellow>:</yellow> <used>/<xmx> (<percent>)
      overlay: NOTCHED_20
      progress-color:
        good: GREEN
        medium: YELLOW
        low: RED
      text-color:
        good: <gradient:#55ff55:#00aa00><text></gradient>
        medium: <gradient:#ffff55:#ffaa00><text></gradient>
        low: <gradient:#ff5555:#aa0000><text></gradient>
      tick-interval: 20
    tpsbar:
      title: <gray>TPS<yellow>:</yellow> <tps> MSPT<yellow>:</yellow> <mspt> Ping<yellow>:</yellow>
        <ping>ms
      overlay: NOTCHED_20
      fill-mode: MSPT
      progress-color:
        good: GREEN
        medium: YELLOW
        low: RED
      text-color:
        good: <gradient:#55ff55:#00aa00><text></gradient>
        medium: <gradient:#ffff55:#ffaa00><text></gradient>
        low: <gradient:#ff5555:#aa0000><text></gradient>
      tick-interval: 20
    compass:
      title: 'S  ·  ◈  ·  ◈  ·  ◈  ·  SW  ·  ◈  ·  ◈  ·  ◈  ·  W  ·  ◈  ·  ◈  ·  ◈  ·  NW  ·  ◈  ·  ◈  ·  ◈  ·  N  ·  ◈  ·  ◈  ·  ◈  ·  NE  ·  ◈  ·  ◈  ·  ◈  ·  E  ·  ◈  ·  ◈  ·  ◈  ·  SE  ·  ◈  ·  ◈  ·  ◈  ·  S  ·  ◈  ·  ◈  ·  ◈  ·  SW  ·  ◈  ·  ◈  ·  ◈  ·  W  ·  ◈  ·  ◈  ·  ◈  ·  NW  ·  ◈  ·  ◈  ·  ◈  ·  N  ·  ◈  ·  ◈  ·  ◈  ·  NE  ·  ◈  ·  ◈  ·  ◈  ·  E  ·  ◈  ·  ◈  ·  ◈  ·  SE  ·  ◈  ·  ◈  ·  ◈  ·  '
      overlay: PROGRESS
      progress-color: BLUE
      percent: 1.0
      tick-interval: 5
    gamemode:
      requires-specific-permission: false
    fill:
      max-area: 32768
    hide-hidden-players-from-entity-selector: false
    uptime:
      format: <days><hours><minutes><seconds>
      day: '%02d day, '
      days: '%02d days, '
      hour: '%02d hour, '
      hours: '%02d hours, '
      minute: '%02d minute, and '
      minutes: '%02d minutes, and '
      second: '%02d second'
      seconds: '%02d seconds'
  blocks:
    barrel:
      rows: 3
    ender_chest:
      six-rows: false
      use-permissions-for-rows: false
    crying_obsidian:
      valid-for-portal-frame: false
    beehive:
      max-bees-inside: 3
    anvil:
      cumulative-cost: true
    lightning_rod:
      range: 128
    grindstone:
      ignored-enchants:
      - minecraft:binding_curse
      - minecraft:vanishing_curse
      remove-attributes: false
      remove-name-and-lore: false
    cave_vines:
      max-growth-age: 25
    kelp:
      max-growth-age: 25
    twisting_vines:
      max-growth-age: 25
    weeping_vines:
      max-growth-age: 25
    disable-mushroom-updates: false
    disable-note-block-updates: false
    disable-chorus-plant-updates: false
  enchantment:
    allow-transparent-blocks-in-enchantment-box: false
    allow-infinity-and-mending-together: false
    allow-infinity-on-crossbow: false
    allow-looting-on-shears: false
    anvil:
      allow-unsafe-enchants: false
      allow-inapplicable-enchants: false
      allow-incompatible-enchants: false
      allow-higher-enchants-levels: false
    allow-unsafe-enchant-command: false
    clamp-levels: true
  entity:
    enderman:
      short-height: false
  allow-water-placement-in-the-end: true
  logger:
    suppress-library-loader: false
    suppress-init-legacy-material-errors: false
    suppress-ignored-advancement-warnings: false
    suppress-unrecognized-recipe-errors: false
    suppress-setblock-in-far-chunk-errors: false
    suppress-sent-expired-chat: false
  network:
    upnp-port-forwarding: false
    max-joins-per-second: true
    kick-for-out-of-order-chat: false
  username-valid-characters: ^[a-zA-Z0-9_.]*$
  food-properties: {}
  use-alternate-keepalive: true
  # 动态地调整tps，可以显著提高tps的观测数值，基本没有副作用。
  tps-catchup: true
  server-mod-name: Purpur
  disable-give-dropping: true
config-version: 30
world-settings:
  default:
    blocks:
      grindstone:
        allow-oversized-stacking: false
      observer:
        disable-clock: false
      anvil:
        use-mini-message: false
        allow-colors: false
        iron-ingots-used-for-repair: 0
        obsidian-used-for-damage: 0
      azalea:
        growth-chance: 0.0
      beacon:
        effect-range:
          level-1: 20
          level-2: 30
          level-3: 40
          level-4: 50
      bed:
        explode: true
        explode-on-villager-sleep: false
        explosion-power: 5.0
        explosion-fire: true
        explosion-effect: DESTROY
      big_dripleaf:
        tilt-delay:
          FULL: 100
          UNSTABLE: 10
          PARTIAL: 10
      budding_amethyst:
        silk-touch: false
      cactus:
        breaks-from-solid-neighbors: true
      campfire:
        lit-when-placed: true
      chest:
        open-with-solid-block-on-top: false
      composter:
        sneak-to-bulk-process: false
      coral:
        die-outside-water: true
      dispenser:
        apply-cursed-to-armor-slots: true
        place-anvils: false
      door:
        requires-redstone: []
      dragon_egg:
        teleport: true
      end-crystal:
        baseless:
          explode: true
          explosion-power: 6.0
          explosion-fire: false
          explosion-effect: DESTROY
        base:
          explode: true
          explosion-power: 6.0
          explosion-fire: false
          explosion-effect: DESTROY
      farmland:
        bypass-mob-griefing: false
        gets-moist-from-below: false
        use-alpha-farmland: false
        disable-trampling: false
        only-players-trample: false
        feather-fall-distance-affects-trampling: false
        trample-height: -1.0
      flowering_azalea:
        growth-chance: 0.0
      furnace:
        use-lava-from-underneath: false
      end_portal:
        safe-teleporting: false
      packed_ice:
        allow-mob-spawns: true
      blue_ice:
        allow-mob-spawns: true
        allow-snow-formation: true
      lava:
        infinite-source: false
        infinite-required-sources: 2
        speed:
          nether: 10
          not-nether: 30
      conduit:
        effect-distance: 16
        mob-damage:
          distance: 8.0
          damage-amount: 4.0
        valid-ring-blocks:
        - minecraft:prismarine
        - minecraft:prismarine_bricks
        - minecraft:sea_lantern
        - minecraft:dark_prismarine
      cauldron:
        fill-chances:
          rain: 0.05000000074505806
          powder-snow: 0.10000000149011612
          dripstone-water: 0.17578125
          dripstone-lava: 0.05859375
      piston:
        block-push-limit: 12
      magma-block:
        damage-when-sneaking: false
        damage-with-frost-walker: false
      powder_snow:
        bypass-mob-griefing: false
      powered-rail:
        activation-range: 8
      respawn_anchor:
        explode: true
        explosion-power: 5.0
        explosion-fire: true
        explosion-effect: DESTROY
      sand:
        fix-duping: false
      sculk_shrieker:
        can-summon-default: false
      shulker_box:
        allow-oversized-stacks: false
      sign:
        right-click-edit: false
        allow-colors: false
      slab:
        break-individual-slabs-when-sneaking: false
      spawner:
        deactivate-by-redstone: false
        fix-mc-238526: false
      sponge:
        absorption:
          area: 64
          radius: 6
        absorbs-lava: false
      stonecutter:
        damage: 0.0
      turtle_egg:
        break-from-exp-orbs: true
        break-from-items: true
        break-from-minecarts: true
        bypass-mob-griefing: false
        random-tick-crack-chance: 500
        feather-fall-distance-affects-trampling: false
      water:
        infinite-source: true
        infinite-required-sources: 2
      enchantment-table:
        lapis-persists: false
    tools:
      axe:
        strippables:
          minecraft:dark_oak_wood:
            into: minecraft:stripped_dark_oak_wood
            drops: {}
          minecraft:warped_stem:
            into: minecraft:stripped_warped_stem
            drops: {}
          minecraft:mangrove_log:
            into: minecraft:stripped_mangrove_log
            drops: {}
          minecraft:birch_log:
            into: minecraft:stripped_birch_log
            drops: {}
          minecraft:warped_hyphae:
            into: minecraft:stripped_warped_hyphae
            drops: {}
          minecraft:acacia_log:
            into: minecraft:stripped_acacia_log
            drops: {}
          minecraft:jungle_wood:
            into: minecraft:stripped_jungle_wood
            drops: {}
          minecraft:dark_oak_log:
            into: minecraft:stripped_dark_oak_log
            drops: {}
          minecraft:jungle_log:
            into: minecraft:stripped_jungle_log
            drops: {}
          minecraft:crimson_stem:
            into: minecraft:stripped_crimson_stem
            drops: {}
          minecraft:acacia_wood:
            into: minecraft:stripped_acacia_wood
            drops: {}
          minecraft:crimson_hyphae:
            into: minecraft:stripped_crimson_hyphae
            drops: {}
          minecraft:oak_wood:
            into: minecraft:stripped_oak_wood
            drops: {}
          minecraft:birch_wood:
            into: minecraft:stripped_birch_wood
            drops: {}
          minecraft:spruce_wood:
            into: minecraft:stripped_spruce_wood
            drops: {}
          minecraft:spruce_log:
            into: minecraft:stripped_spruce_log
            drops: {}
          minecraft:oak_log:
            into: minecraft:stripped_oak_log
            drops: {}
          minecraft:mangrove_wood:
            into: minecraft:stripped_mangrove_wood
            drops: {}
        waxables:
          minecraft:waxed_weathered_cut_copper_stairs:
            into: minecraft:weathered_cut_copper_stairs
            drops: {}
          minecraft:waxed_oxidized_cut_copper_stairs:
            into: minecraft:oxidized_cut_copper_stairs
            drops: {}
          minecraft:waxed_exposed_cut_copper:
            into: minecraft:exposed_cut_copper
            drops: {}
          minecraft:waxed_cut_copper:
            into: minecraft:cut_copper
            drops: {}
          minecraft:waxed_cut_copper_stairs:
            into: minecraft:cut_copper_stairs
            drops: {}
          minecraft:waxed_exposed_copper:
            into: minecraft:exposed_copper
            drops: {}
          minecraft:waxed_weathered_cut_copper_slab:
            into: minecraft:weathered_cut_copper_slab
            drops: {}
          minecraft:waxed_oxidized_cut_copper_slab:
            into: minecraft:oxidized_cut_copper_slab
            drops: {}
          minecraft:waxed_exposed_cut_copper_stairs:
            into: minecraft:exposed_cut_copper_stairs
            drops: {}
          minecraft:waxed_weathered_cut_copper:
            into: minecraft:weathered_cut_copper
            drops: {}
          minecraft:waxed_oxidized_cut_copper:
            into: minecraft:oxidized_cut_copper
            drops: {}
          minecraft:waxed_weathered_copper:
            into: minecraft:weathered_copper
            drops: {}
          minecraft:waxed_oxidized_copper:
            into: minecraft:oxidized_copper
            drops: {}
          minecraft:waxed_copper_block:
            into: minecraft:copper_block
            drops: {}
          minecraft:waxed_cut_copper_slab:
            into: minecraft:cut_copper_slab
            drops: {}
          minecraft:waxed_exposed_cut_copper_slab:
            into: minecraft:exposed_cut_copper_slab
            drops: {}
        weatherables:
          minecraft:weathered_cut_copper_slab:
            into: minecraft:exposed_cut_copper_slab
            drops: {}
          minecraft:oxidized_cut_copper_slab:
            into: minecraft:weathered_cut_copper_slab
            drops: {}
          minecraft:weathered_cut_copper:
            into: minecraft:exposed_cut_copper
            drops: {}
          minecraft:exposed_cut_copper_slab:
            into: minecraft:cut_copper_slab
            drops: {}
          minecraft:oxidized_cut_copper_stairs:
            into: minecraft:weathered_cut_copper_stairs
            drops: {}
          minecraft:oxidized_copper:
            into: minecraft:weathered_copper
            drops: {}
          minecraft:exposed_cut_copper_stairs:
            into: minecraft:cut_copper_stairs
            drops: {}
          minecraft:weathered_copper:
            into: minecraft:exposed_copper
            drops: {}
          minecraft:exposed_cut_copper:
            into: minecraft:cut_copper
            drops: {}
          minecraft:oxidized_cut_copper:
            into: minecraft:weathered_cut_copper
            drops: {}
          minecraft:exposed_copper:
            into: minecraft:copper_block
            drops: {}
          minecraft:weathered_cut_copper_stairs:
            into: minecraft:exposed_cut_copper_stairs
            drops: {}
      hoe:
        tillables:
          minecraft:coarse_dirt:
            into: minecraft:dirt
            drops: {}
            condition: air_above
          minecraft:dirt_path:
            into: minecraft:farmland
            drops: {}
            condition: air_above
          minecraft:rooted_dirt:
            into: minecraft:dirt
            drops:
              minecraft:hanging_roots: 1.0
            condition: always
          minecraft:dirt:
            into: minecraft:farmland
            drops: {}
            condition: air_above
          minecraft:grass_block:
            into: minecraft:farmland
            drops: {}
            condition: air_above
        replant-crops: false
        replant-nether-warts: false
    mobs:
      tropical_fish:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      turtle:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 30.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      vex:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 14.0
        takes-damage-from-water: false
        always-drop-exp: false
      villager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        brain-ticks: 300
        use-brain-ticks-only-when-lagging: true
        follow-emerald-blocks: false
        can-be-leashed: false
        can-breed: true
        breeding-delay-ticks: 6000
        clerics-farm-warts: false
        cleric-wart-farmers-throw-warts-at-villagers: true
        bypass-mob-griefing: false
        takes-damage-from-water: false
        allow-trading: true
        always-drop-exp: false
        minimum-demand: 0
        lobotomize:
          enabled: false
          check-interval: 100
        display-trade-item: true
        spawn-iron-golem:
          radius: 0
          limit: 0
      vindicator:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 24.0
        johnny:
          spawn-chance: 0.0
        takes-damage-from-water: false
        always-drop-exp: false
      wandering_trader:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        follow-emerald-blocks: false
        can-be-leashed: false
        takes-damage-from-water: false
        allow-trading: true
        always-drop-exp: false
      warden:
        ridable: false
        ridable-in-water: false
        controllable: true
      witch:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 26.0
        takes-damage-from-water: false
        always-drop-exp: false
      wither:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 300.0
        health-regen-amount: 1.0
        health-regen-delay: 20
        bypass-mob-griefing: false
        takes-damage-from-water: false
        can-ride-vehicles: false
        explosion-radius: 1.0
        play-spawn-sound: true
        always-drop-exp: false
      wither_skeleton:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        takes-damage-from-water: false
        always-drop-exp: false
      wolf:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        default-collar-color: RED
        milk-cures-rabid-wolves: true
        spawn-rabid-chance: 0.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      zoglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 40.0
        takes-damage-from-water: false
        always-drop-exp: false
      zombie:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        aggressive-towards-villager-when-lagging: true
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
        head-visibility-percent: 0.5
      zombie_horse:
        ridable-in-water: false
        can-swim: false
        attributes:
          max_health:
            min: 15.0
            max: 15.0
          jump_strength:
            min: 0.4
            max: 1.0
          movement_speed:
            min: 0.2
            max: 0.2
        spawn-chance: 0.0
        takes-damage-from-water: false
        always-drop-exp: false
      zombie_villager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        takes-damage-from-water: false
        curing_time:
          min: 3600
          max: 6000
        cure:
          enabled: true
        always-drop-exp: false
      zombified_piglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.0
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        count-as-player-kill-when-angry: true
        takes-damage-from-water: false
        always-drop-exp: false
      hoglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 40.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      horse:
        ridable-in-water: false
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.4
            max: 1.0
          movement_speed:
            min: 0.1125
            max: 0.3375
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        stand-with-rider: true
        stand-when-hurt: true
        always-drop-exp: false
      husk:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        takes-damage-from-water: false
        always-drop-exp: false
      illusioner:
        ridable: false
        ridable-in-water: false
        controllable: true
        movement-speed: 0.5
        follow-range: 18.0
        attributes:
          max_health: 32.0
        takes-damage-from-water: false
        always-drop-exp: false
      iron_golem:
        ridable: false
        ridable-in-water: false
        controllable: true
        can-swim: false
        attributes:
          max_health: 100.0
        takes-damage-from-water: false
        poppy-calms-anger: false
        healing-calms-anger: false
        always-drop-exp: false
      llama:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        join-caravans: true
        always-drop-exp: false
      magma_cube:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: size * size
          attack_damage: size
        takes-damage-from-water: false
        always-drop-exp: false
      mooshroom:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      mule:
        ridable-in-water: false
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      ocelot:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      panda:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      parrot:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 6.0
        takes-damage-from-water: false
        can-breed: false
        always-drop-exp: false
      phantom:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        flames:
          damage: 1.0
          fire-time: 8
        allow-griefing: false
        attributes:
          max_health: '20.0'
          attack_damage: 6 + size
        attacked-by-crystal-range: 0.0
        attacked-by-crystal-damage: 1.0
        orbit-crystal-radius: 0.0
        spawn:
          delay:
            min: 1200
            max: 2400
          min-sky-darkness: 5
          only-above-sea-level: true
          only-with-visible-sky: true
          local-difficulty-chance: 3.0
          min-time-since-slept: 72000
          overhead:
            min: 20
            max: 35
            radius: 10
          per-attempt:
            min: 1
            max: -1
        burn-in-light: 0
        burn-in-daylight: true
        ignore-players-with-torch: false
        flames-on-swoop: false
        takes-damage-from-water: false
        always-drop-exp: false
        size:
          min: 0
          max: 0
      pig:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        give-saddle-back: false
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      piglin:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 16.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        portal-spawn-modifier: 2000
        always-drop-exp: false
      piglin_brute:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 50.0
        takes-damage-from-water: false
        always-drop-exp: false
      pillager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 24.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      polar_bear:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 30.0
        breedable-item: ''
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      pufferfish:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      rabbit:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 3.0
        spawn-toast-chance: 0.0
        spawn-killer-rabbit-chance: 0.0
        breeding-delay-ticks: 6000
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      ravager:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 100.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        griefable-blocks:
        - minecraft:oak_leaves
        - minecraft:spruce_leaves
        - minecraft:birch_leaves
        - minecraft:jungle_leaves
        - minecraft:acacia_leaves
        - minecraft:dark_oak_leaves
        - minecraft:beetroots
        - minecraft:carrots
        - minecraft:potatoes
        - minecraft:wheat
        always-drop-exp: false
      salmon:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      sheep:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        breeding-delay-ticks: 6000
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
        jeb-shear-random-color: false
      shulker:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 30.0
        takes-damage-from-water: false
        spawn-from-bullet:
          base-chance: 1.0
          require-open-lid: true
          nearby-range: 8.0
          nearby-equation: (nearby - 1) / 5.0
          random-color: false
        change-color-with-dye: false
        always-drop-exp: false
      silverfish:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      skeleton:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        takes-damage-from-water: false
        always-drop-exp: false
        head-visibility-percent: 0.5
        feed-wither-roses: 0
        bow-accuracy: 14 - difficulty * 4
      skeleton_horse:
        ridable-in-water: true
        can-swim: false
        attributes:
          max_health:
            min: 15.0
            max: 15.0
          jump_strength:
            min: 0.4
            max: 1.0
          movement_speed:
            min: 0.2
            max: 0.2
        takes-damage-from-water: false
        always-drop-exp: false
      slime:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: size * size
          attack_damage: size
        takes-damage-from-water: false
        always-drop-exp: false
      snow_golem:
        ridable: false
        ridable-in-water: false
        controllable: true
        leave-trail-when-ridden: false
        attributes:
          max_health: 4.0
        drop-pumpkin-when-sheared: true
        pumpkin-can-be-added-back: false
        min-shoot-interval-ticks: 20
        max-shoot-interval-ticks: 20
        snow-ball-modifier: 10.0
        attack-distance: 1.25
        bypass-mob-griefing: false
        takes-damage-from-water: true
        always-drop-exp: false
      squid:
        ridable: false
        controllable: true
        attributes:
          max_health: 10.0
        immune-to-EAR: true
        water-offset-check: 0.0
        can-fly: false
        takes-damage-from-water: false
        always-drop-exp: false
      spider:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 16.0
        takes-damage-from-water: false
        always-drop-exp: false
        can-climb-world-border: true
      stray:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        takes-damage-from-water: false
        always-drop-exp: false
      strider:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        breeding-delay-ticks: 6000
        give-saddle-back: false
        takes-damage-from-water: true
        always-drop-exp: false
      tadpole:
        ridable: false
        ridable-in-water: false
        controllable: true
      trader_llama:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      allay:
        ridable: false
        ridable-in-water: false
        controllable: true
        respect-nbt: []
      axolotl:
        ridable: false
        controllable: true
        attributes:
          max_health: 14.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      bat:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 6.0
        takes-damage-from-water: false
        always-drop-exp: false
      bee:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        can-work-at-night: false
        can-work-in-rain: false
        always-drop-exp: false
        dies-after-sting: true
      blaze:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 20.0
        takes-damage-from-water: true
        always-drop-exp: false
      cat:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        spawn-delay: 1200
        scan-range-for-other-cats:
          swamp-hut: 16
          village: 48
        breeding-delay-ticks: 6000
        default-collar-color: RED
        takes-damage-from-water: false
        always-drop-exp: false
      cave_spider:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 12.0
        takes-damage-from-water: false
        always-drop-exp: false
      chicken:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 4.0
        retaliate: false
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      cod:
        ridable: false
        controllable: true
        attributes:
          max_health: 3.0
        takes-damage-from-water: false
        always-drop-exp: false
      cow:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        feed-mushrooms-for-mooshroom: 0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        naturally-aggressive-to-players:
          chance: 0.0
          damage: 2.0
        always-drop-exp: false
      creeper:
        encircle-target: false
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
        naturally-charged-chance: 0.0
        allow-griefing: true
        bypass-mob-griefing: false
        takes-damage-from-water: false
        explode-when-killed: false
        health-impacts-explosion: false
        always-drop-exp: false
        head-visibility-percent: 0.5
      dolphin:
        ridable: false
        controllable: true
        spit:
          cooldown: 20
          speed: 1.0
          damage: 2.0
        attributes:
          max_health: 10.0
        disable-treasure-searching: false
        takes-damage-from-water: false
        naturally-aggressive-to-players-chance: 0.0
        always-drop-exp: false
      donkey:
        ridable-in-water: false
        attributes:
          max_health:
            min: 15.0
            max: 30.0
          jump_strength:
            min: 0.5
            max: 0.5
          movement_speed:
            min: 0.175
            max: 0.175
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      drowned:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 20.0
          spawn_reinforcements: 0.1
        jockey:
          only-babies: true
          chance: 0.05
          try-existing-chickens: true
        takes-damage-from-water: false
        can-break-doors: false
        always-drop-exp: false
      elder_guardian:
        ridable: false
        controllable: true
        attributes:
          max_health: 80.0
        takes-damage-from-water: false
        always-drop-exp: false
      ender_dragon:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 200.0
        always-drop-full-exp: false
        bypass-mob-griefing: false
        takes-damage-from-water: false
        can-ride-vehicles: false
      enderman:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 40.0
        allow-griefing: true
        can-despawn-with-held-block: false
        bypass-mob-griefing: false
        takes-damage-from-water: true
        aggressive-towards-endermites: true
        aggressive-towards-endermites-only-spawned-by-player-thrown-ender-pearls: false
        ignore-players-wearing-dragon-head: false
        disable-player-stare-aggression: false
        ignore-projectiles: false
        always-drop-exp: false
      endermite:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 8.0
        takes-damage-from-water: false
        always-drop-exp: false
      evoker:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 24.0
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      fox:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        tulips-change-type: false
        breeding-delay-ticks: 6000
        bypass-mob-griefing: false
        takes-damage-from-water: false
        always-drop-exp: false
      frog:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-jump-height: 0.6499999761581421
        breeding-delay-ticks: 6000
      ghast:
        ridable: false
        ridable-in-water: false
        controllable: true
        ridable-max-y: 320.0
        attributes:
          max_health: 10.0
        takes-damage-from-water: false
        always-drop-exp: false
      giant:
        ridable: false
        ridable-in-water: false
        controllable: true
        movement-speed: 0.5
        attack-damage: 50.0
        attributes:
          max_health: 100.0
        step-height: 2.0
        jump-height: 1.0
        have-ai: false
        have-hostile-ai: false
        takes-damage-from-water: false
        always-drop-exp: false
      glow_squid:
        rainglow-mode: rainbow
        ridable: false
        controllable: true
        attributes:
          max_health: 10.0
        can-fly: false
        takes-damage-from-water: false
        always-drop-exp: false
      goat:
        ridable: false
        ridable-in-water: false
        controllable: true
        attributes:
          max_health: 10.0
        breeding-delay-ticks: 6000
        takes-damage-from-water: false
        always-drop-exp: false
      guardian:
        ridable: false
        controllable: true
        attributes:
          max_health: 30.0
        takes-damage-from-water: false
        always-drop-exp: false
    hunger:
      starvation-damage: 1.0
    ridable-settings:
      babies-are-ridable: true
      untamed-tamables-are-ridable: true
      use-night-vision: false
    settings:
      entity:
        shared-random: true
    gameplay-mechanics:
      milk-clears-beneficial-effects: true
      mob-effects:
        health-regen-amount: 1.0
        minimal-health-poison-amount: 1.0
        poison-degeneration-amount: 1.0
        wither-degeneration-amount: 1.0
        hunger-exhaustion-amount: 0.004999999888241291
        saturation-regen-amount: 1.0
      mob-spawning:
        village-cats: default
        raid-patrols: default
        phantoms: default
        wandering-traders: default
        village-sieges: default
        ignore-creative-players: false
      player:
        burp-delay: 10
        netherite-fire-resistance:
          duration: 0
          amplifier: 0
          ambient: false
          show-particles: false
          show-icon: true
        idle-timeout:
          kick-if-idle: false
          tick-nearby-entities: true
          count-as-sleeping: false
          update-tab-list: false
          mobs-target: true
        spawn-invulnerable-ticks: 60
        invulnerable-while-accepting-resource-pack: false
        exp-dropped-on-death:
          equation: expLevel * 7
          maximum: 100
        teleport-if-outside-border: false
        totem-of-undying-works-in-inventory: false
        fix-stuck-in-portal: false
        one-punch-in-creative: false
        sleep-ignore-nearby-mobs: false
        can-skip-night: true
        critical-damage-multiplier: 1.5
        burp-when-full: false
        armor-click-equip:
          allow-hot-swapping: false
          creative-makes-copy: true
        ridable-in-water: false
        curse-of-binding:
          remove-with-weakness: false
        shift-right-click-repairs-mending-points: 0
        exp-pickup-delay-ticks: 2
        allow-void-trading: true
      projectile-offset:
        bow: 1.0
        crossbow: 1.0
        egg: 1.0
        ender-pearl: 1.0
        throwable-potion: 1.0
        trident: 1.0
        snowball: 1.0
      projectile-damage:
        snowball: -1
      shovel-turns-block-to-grass-path:
      - minecraft:coarse_dirt
      - minecraft:dirt
      - minecraft:grass_block
      - minecraft:mycelium
      - minecraft:podzol
      - minecraft:rooted_dirt
      silk-touch:
        enabled: false
        spawner-name: <reset><white>Spawner
        minimal-level: 1
        spawner-lore:
        - Spawns a <mob>
        tools:
        - minecraft:iron_pickaxe
        - minecraft:golden_pickaxe
        - minecraft:diamond_pickaxe
        - minecraft:netherite_pickaxe
      armorstand:
        step-height: 0.0
        set-name-visible-when-placing-with-custom-name: false
        fix-nametags: false
        can-movement-tick: true
        can-move-in-water: true
        can-move-in-water-over-fence: true
        place-with-arms-visible: false
      arrow:
        movement-resets-despawn-counter: true
      use-better-mending: false
      always-tame-in-creative: false
      boat:
        eject-players-on-land: false
        do-fall-damage: true
      disable-drops-on-cramming-death: false
      entities-can-use-portals: true
      entities-pick-up-loot-bypass-mob-griefing: false
      fireballs-bypass-mob-griefing: false
      impose-teleport-restrictions-on-gateways: false
      milk-cures-bad-omen: true
      note-block-ignore-above: false
      persistent-tileentity-display-names-and-lore: false
      persistent-droppable-entity-display-names: false
      projectiles-bypass-mob-griefing: false
      tick-fluids: true
      entity-blindness-multiplier: 1.0
      trident-loyalty-void-return-height: 0.0
      void-damage-height: -64.0
      void-damage-dealt: 4.0
      raid-cooldown-seconds: 0
      animal-breeding-cooldown-seconds: 0
      mobs-ignore-rails: false
      rain-stops-after-sleep: true
      thunder-stops-after-sleep: true
      mob-last-hurt-by-player-time: 100
      daylight-cycle-ticks:
        daytime: 12000
        nighttime: 12000
      drowning:
        air-ticks: 300
        ticks-per-damage: 20
        damage-from-drowning: 2.0
      elytra:
        damage-per-second: 1
        damage-multiplied-by-speed: 0.0
        ignore-unbreaking: false
        damage-per-boost:
          firework: 0
          trident: 0
        kinetic-damage: true
      infinity-bow:
        works-without-arrows: false
        normal-arrows: true
        spectral-arrows: false
        tipped-arrows: false
      item:
        immune:
          cactus: []
          explosion: []
          fire: []
          lightning: []
        shears:
          damage-if-sprinting: false
          sprinting-damage: 1.0
        ender-pearl:
          damage: 5.0
          cooldown: 20
          creative-cooldown: 20
          endermite-spawn-chance: 0.05000000074505806
        glow_berries:
          eat-glow-duration: 0
        shulker_box:
          drop-contents-when-destroyed: true
        compass:
          holding-shows-bossbar: false
        snowball:
          extinguish:
            fire: false
            candles: false
            campfires: false
      halloween:
        force: false
        head-chance: 0.25
      entity-lifespan: 0
      entity-left-handed-chance: 0.05000000074505806
      minecart:
        max-speed: 0.4
        place-anywhere: false
        powered-rail:
          boost-modifier: 0.06
        controllable:
          enabled: false
          step-height: 1.0
          hop-boost: 0.5
          fall-damage: true
          base-speed: 0.1
          block-speed:
            grass_block: 0.3
            stone: 0.5
  # 添加这项仅仅是为了修复Mojang不愿修复的内容缺陷：避免enderman的指数爆炸增长。
  # 该项有可能影响游玩体验，也可能没有影响。
  world_the_end:
    mobs:
      enderman:
        can-despawn-with-held-block: true
```

## How to analyse profile reports ?

如果你在 `服务端核心` 处于 `laggy` 状态的时候进行 `采样`，那么结论往往是：`tick entity` 和 `tick chunk` 将占据最多的 `计算量`。

对于 `tick chunk` 而言，你能做的事情其实很有限。

> 可以通过修改 `tick-per` 中的 `monter-spawn` 来大幅度减少 `tick chunk` 的 `计算量`。
> 
> 但这么做取决于你的需求。

对于 `tick entity` 而言，你需要根据 `报告` 所指出的 `异常指标` ，对 `behavior` 和 `sensor` 进行调整。

> 这里列出几个需要特别注意的实体：`villager`， `zombified_piglin`， `illager`
> 
> > 对于 `villager` 而言，可以通过修改 `acquirepoi` 来显著地减少计算量，但这会导致 `寻路算法` 的执行频率降低。
> > 
> > 而 `validatenearbypoi` 会影响对 `工作方块` 的 `识别速度`。
> > 
> > 如果此时有多个 `劫掠塔` 在运行，则可以发现 `victorystroll` 的计算量显著上升。
> > 
> > 如果你希望 `runone` 的平均值降低，则可以修改 `dab` 或者 `lagging-threshold`，但是这将会影响 `villager` 的 `全部的` `behavior` 和 `sensor`。
> > 
> > 一般不建议这么做。
> > 
> > > 请注意，`某个entity的gravity计算` 是包括在 `该entity的AI计算` 之中的。
> > > 
> > > `entity` 有自己 `内置的tick` 来进行 `AI计算`，它不受 `外部的tick` 影响。
> 
> > 对于 `zombified_piglin` 而言，主要是2个原因导致 `计算量` 偏高。
> > 
> > *   联动仇恨
> > *   高刷怪效率
> > 
> > 即使 `zombified_piglin` 被 `高效率地处置`，仍然会 `持续占据` 这部分 `计算量`。
> > 
> > > Paper早已修复了由于 `player` 跨越 `dimension` 使得 `zombified_pigin` 因为 `raytrace` 错误计算而导致的 `追踪射线沿途的大量区块被错误地加载` 造成的卡顿问题。
> > > 
> > > 对于 `bee` 来说，曾经也存在类似的问题，但目前已经被修复。
> 
> > 对于 `illeger` 来说，情况和 `zombified_piglin` 类似。
> > 
> > 区别在于 `单座劫掠塔` 一般比 `单座猪人塔` 的 `刷怪效率更低`，而且 `刷怪效率` 呈现 `锯齿形波动`。
> > 
> > > 如果你只看到了 `pillager` 偏高，那么原因可能是其在野外环境的 `自然生成` 占用 `计算量`，该BUG可以通过升级版本修复。

> 关于 `性能采样器`，这里使用 `Timings v2` 进行性能分析（这是Paper所提供的）。
> 
> 如果你使用的是Purpur，那么非常建议你使用 `Spark` 进行分析，它比 `Timings v2` 更加优秀。
> 
> *   更美观的UI
> *   更易读的报表
> *   更好的性能
> *   更细的采样粒度

> `Plugins` 不应当占据过多的 `计算量`。如果某个 `Plugin` 占据了太多计算量，那么你应该考虑弃用它，或者选择一个替代品。
> 
> 并不是所有的开发者都会在编写代码的时候，时刻关注高性能。

> `Player实体` 并不真正地占用 `计算量`，他们甚至不如 `Villager实体` 占用的 `计算量` 高。
> 
> `Entity` 占用计算量的真实原因是，他们需要为 `AI计算` 付出 `高额的代价` （往往的 `寻路算法`，也包括部分敏感的 `传感器 (Sensor)`）。
> 
> 单个 `Entity` 越聪明，则占用的 `计算量` 越大。（毫无疑问，`Villager` 是最聪明的实体，此外，`Zombie 族` 实体由于存在 `与Villager的威胁关联`，所以其 AI计算也会比其他实体更高）

> `Tile Entity` 占用的 `计算量` 远少于 `Entity`。
> 
> 尽管 Paper 针对 `hopper` 有优化算法，但是由于 `hopper` 的数量一般较多，在报告结果中，`hopper` 仍然可能是 `计算量` 最高的 `Tile Entity`。
> 
> `Chest` ，`Furnace` 和 `Sign` 对 `计算量` 的占用极小，但是他们的渲染可能会导致客户端卡顿。
> 
> `Observer` 以及 `单纯的时钟电路` 并不占用多少 `计算量`，一般取决于这个结构的 `输出端` 在做什么。
> 
> 但 `Piston` ，特别是 `Sticky Piston` 则非常占用 `计算量`。
> 
> > 这是因为他们每次的 `激活` 与 `失活` 均会造成 `方块更新`，同时会产生 `Moving-Piston` 这个 `Tile Entity`

> 通过使用拥有更高睿频和IPC的CPU虽然对提升性能有所帮助，但性价比极低。
> 
> `Vanilla` 从一开始就没有考虑过 `多线程任务`，并且也不是针对 `multi-player games` （个位数以上的玩家）设计的。
> 
> 后续的核心很难在维持 `Vanilla` 的同时，实现 `多线程任务`。
> 
> 大部分情况下，`CPU的利用率` 仅仅维持在 `5-15%` 之间。

> 这里提供一个有效且相对可以接受的软件解决思路：
> 
> 根据 `上下文` 来选择性地限制 `实体` 的 `行为` 和 `传感器`。
> 
> > 目前已经有一些 `插件方案` 使用这个思路，尽管他们使用的 `具体策略` 不同。
> > 
> > 对性能的优化较为显著甚至明显，但对 `vanilla` 的破坏较少。
> > 
> > > 比较有知名度的 `anti-villager` 没有考虑上下文和控制粒度，但实际上 `villager` 的控制粒度可以更细。
> > > 
> > > 而 `farm-limiter` 虽然很早就使用该思路，但是对 `上下文` 的判定选项不够精准。

## How to choose plugins ?

这个章节不太应该属于本文，这里选择仅讨论一小部分的 `Anti-Cheat` 。

对于 `plugin` 选择，一般考虑：

*   功能足够简单，但满足需求
*   可配置度高
*   没有造成卡顿的Events

> 这两个原则大部分情况是对的：
> 
> *   服务端核心可以做的事情，不要用插件。
> *   1个插件可以做的事情，不要用2个插件去完成。
> 
> 难以遵守这两个原则的主要原因是：维护者自己根本不清楚 `core` 和 `plugin` 到底有什么职责。

### Anti-Cheat Review

> `bypass` 是不可避免的，这是协议的缺陷。

*   NCP：开源，最好搭配其他AC使用，适合魔改。
*   Vulcan：较高的可配置性，适合Survival，默认不启用setback。（已经有full-bypass了）
*   Matrix：开箱即用，配置比Vulcan简单，Movement和Timer没什么问题，Premium版新增对Scaffold的额外检测，但KillAura检测存在缺陷。
*   Spartan：不推荐，`FP` 和 `FN` 指标都不好看。
*   GrimAC：值得尝试，开源，对Reach，Movement，Timer的检测精度较高，但Scaffold检测存在缺陷。
*   Intave：看需求，可能不适合Survival，目前存在较多的致命FP尚未解决。但是对于Mini-Game是合适的。