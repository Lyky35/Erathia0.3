-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
hotkeyAimbotEnabled = false
protectionLevel = 5
killsToRedSkull = 3

killsToBlackSkull = 6
pzLocked = 60000

removeChargesFromRunes = true
removeChargesFromPotions = true

removeWeaponCharges = true

timeToDecreaseFrags = 24 * 60 * 60 * 1000
whiteSkullTime = 15 * 60 * 1000
stairJumpExhaustion = 2000
experienceByKillingPlayers = true
expFromPlayersLevelRange = 75

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "127.0.0.1"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 1000
motd = "Welcome to Erathia!"
onePlayerOnlinePerAccount = false
allowClones = false
serverName = "Erathia"
statusTimeout = 5000
replaceKickOnLogin = true
maxPacketsPerSecond = 64

-- Version Manual

clientVersionMin = 800

clientVersionMax = 800

clientVersionStr = "Erathia"




-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = 5

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSQM = 100
houseRentPeriod = "never"

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "erathia"
mapAuthor = "erathia"

-- MySQL
mysqlHost = "erathia.org"
mysqlUser = "Pyrokhar"
mysqlPass = "MJEPns,7A8?]*Qm8"
mysqlDatabase = "erathia_test"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

-- Misc.
allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = false
classicEquipmentSlots = true
allowWalkthrough = false
classicAttackSpeed = true


-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
rateExp = 3
rateSkill = 3
rateLoot = 3
rateMagic = 2
rateSpawn = 1

rateMonsterHealth = 1.0

rateMonsterAttack = 1.0

rateMonsterDefense = 1.0

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = true

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = false

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process priority.
defaultPriority = "high"
startupDatabaseOptimization = true

-- Status server information
ownerName = "KS @ US"
ownerEmail = ""
url = ""
location = "USA"
