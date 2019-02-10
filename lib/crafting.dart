import 'package:flutter/material.dart';

final header = const TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w700);
final subheader = const TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500);

final itemColor = Colors.blueGrey;
final foodColor = Colors.brown.shade400;
final lightSourceColor = Colors.yellow.shade800;
final materialsColor = Colors.green.shade600;
final buildingMaterialsColor = Colors.teal;
final furnitureColor = Colors.pink;
final craftingStationColor = Colors.grey.shade800;
final weaponToolColor = Colors.deepOrange;
final armourColor = Colors.lightBlue.shade700;
final roomColor = Colors.indigo.shade700;

enum ObjectType {items, food, light_source, materials, building_materials, furniture, crafting_station, weapon_tool, armour}

class Workstation {
	static const TREE = "Tree stump";
	static const MASON = "Mason\'s workstation";
	static const CARPENTER = "Carpenter\'s workstation";
	static const HERBALIST = "Herbalist\'s cauldron";
	static const SEWING = "Sewing station";
	static const MINER = "Miner\'s refiner";
	static const WELDER = "Welder\'s workbench";
	static const COOKFIRE = "Cookfire";
	static const BRICK = "Brick barbecue";
	static const FORGE = "Forge";
	static const FURNACE = "Furnace";
	static const TRANSMUTATION = "Transmutation table";
	static const DIVINER = "Diviner\'s altar";
	static const ANCIENT = "Ancient altar";
}

class Ingredient {
	static const TARNISHED_TOKEN = "Tarnished token";
	static const ORICHALCUM = "Orichalcum";
	static const STEEL_INGOT = "Steel ingot";
	static const COAL = "Coal";
	static const WHITE_PETALS = "White petals";
	static const MEDICINAL_LEAF = "Medicinal leaf";
	static const CHIMAERA_FEATHER = "Chimaera feather";
	static const ROCKBOMB_SHARD = "Rockbomb shard";
	static const IRON_INGOT = "Iron ingot";
	static const CORD = "Cord";
	static const BLUE_TABLET_FRAGMENT = "Blue tablet fragments";
	static const EARTH = "Earth";
	static const BLUE_GOO = "Blue goo";
	static const MARSHROOMS = "Marshrooms";
	static const MEAT = "Meat";
	static const MONSTER_EGG = "Monster egg";
	static const BUTTERBEANS = "Butterbeans";
	static const PLUMBERRY = "Plumberry";
	static const WHEAT = "Wheat";
	static const BREAD = "Bread";
	static const BOILED_BUTTERBEANS = "Boiled butterbeans";
	static const BUTTERMILK = "Buttermilk";
	static const BROKEN_BRANCH = "Broken branch";
	static const TORCH = "Torch";
	static const COPPER_INGOT = "Copper ingot";
	static const STONE = "Stone";
	static const PLUMBERRY_LUMBER = "Plumberry lumber";
	static const IVY = "Ivy";
	static const ORANGE_OIL = "Orange oil";
	static const SAND = "Sand";
	static const COPPER = "Copper";
	static const IRON = "Iron";
	static const GRASSY_LEAVES = "Grassy leaves";
	static const STRAW_FLOOR = "Straw floor";
	static const WOOD = "Wood";
	static const GOLEMITE = "Golemite";
	static const GLASS = "Glass";
	static const CLAY = "Clay";
	static const BRICK_WALL = "Brick wall";
	static const STONE_WALL = "Stone wall";
	static const FLAGSTONE = "Flagstone";
	static const MAGIC_DYE = "Magic dye";
	static const FUR = "Fur";
	static const POT = "Pot";
	static const COARSE_CLOTH = "Coarse cloth";
	static const FRUIT_SALAD = "Fruit salad";
	static const BUNICORN_STEAK = "Bunicorn Steak";
	static const CROCKERY = "Crockery";
	static const BONFIRE = "Bonfire";
	static const COOKFIRE = "Cookfire";
	static const FORGE = "Forge";
	static const SCORPION_HORN = "Scorpion horn";
	static const FINEST_FUR = "Finest fur";
	static const SILVER = "Silver";

	String _ingredientName;
	int _quantity;

	Ingredient(String ingredient, int num) {
		_ingredientName = ingredient;
		_quantity = num;
	}

	int get quantity => _quantity;

	String get ingredientName => _ingredientName;
}

class Craftable {
	static const ANCIENT_EMBLEM = "Ancient emblem";
	static const HOLY_WATER = "Holy water";
	static const SPRINGTIDE_SPRINKLES = "Springtide sprinkles";
	static const FAERIE_FERTILISER = "Faerie fertiliser";
	static const CONFETTI = "Confetti";
	static const HEALING_CREAM = "Healing cream";
	static const MEDICINAL_HERB = "Medicinal herb";
	static const ANTIDOTAL_HERB = "Antidotal herb";
	static const DEFUDDLE_DROPS = "Defuddle drops";
	static const TINGLE_TABLET = "Tingle tablet";
	static const SHEEN_SALTS = "Sheen salts";
	static const YGGDRASIL_ESSENCE = "Yggdrasil essence";
	static const CHIMAERA_WING = "Chimaera wing";
	static const BUCKET = "Bucket";
	static const FISHING_ROD = "Fishing rod";
	static const RAKE = "Rake";
	static const THROWING_STONE = "Throwing stone";
	static const DIVINE_DAGGER = "Divine dagger";
	static const WRECKING_BALL = "Wrecking ball";
	static const BASHMOBILE = "Bashmobile";
	static const WOODEN_MINECART = "Wooden minecart";
	static const METAL_MINECART = "Metal minecart";
	static const SIZZ_SHOT = "Sizz shot";
	static const CRACK_SHOT = "Crack shot";
	static const KABOOM_SHOT = "Kaboom shot";
	static const KEY = "Key";
	static const WHEAT_SEED = "Wheat seed";
	static const HEARTFRUIT_SEED = "Heartfruit seed";
	static const SUGARCANE_SEEDLING = "Sugarcane seedling";
	static const BUTTERBEAN_SPROUT = "Butterbean sprout";
	static const POTATO_SPROUT = "Potato sprout";
	static const HOLYHOCK_SEED = "Holyhock seed";
	static const BLUE_TELEPORTAL = "Blue teleportal";
	static const SQUID_ON_A_STICK = "Squid on a stick";
	static const SARDINE_ON_A_STICK = "Sardine on a stick";
	static const SHROOMS_ON_A_STICK = "Shrooms-on-a-stick";
	static const FRIED_FROGSTOOL = "Fried frogstool";
	static const FRIED_FROG_MEAT = "Fried frog meat";
	static const BUNICORN_STEAK = "Bunicorn steak";
	static const FRIED_EGG = "Fried egg";
	static const CODDLED_EGG = "Coddled egg";
	static const CACTUS_STEAK = "Cactus steak";
	static const SEARING_STEAK = "Searing steak";
	static const BONY_STEAK = "Bony steak";
	static const BREAD = "Bread";
	static const BUTTERMILK = "Buttermilk";
	static const PORRIDGE = "Porridge";
	static const BOILED_BUTTERBEANS = "Boiled butterbeans";
	static const FRUIT_SALAD = "Fruit salad";
	static const BUNNY_BURGER = "Bunny burger";
	static const BEANY_BUNNY_BURGER = "Beany bunny burger";
	static const BAGUETTE = "Baguette";
	static const FRIES = "Fries";
	static const POTATO_SALAD = "Potato salad";
	static const SUPER_SALAD = "Super salad";
	static const COOKED_CRAB_CLAW = "Cooked crab claw";
	static const CREAM_OF_MARSHROOM_SOUP = "Cream of marshroom soup";
	static const BOUILLABAISSE = "Bouillabaisse";
	static const SAILORS_STEW = "Sailor\'s stew";
	static const HELL_BROTH = "Hell broth";
	static const FRESH_FISH_FEAST = "Fresh fish feast";
	static const SAUTEED_SALMON = "Sautéed salmon";
	static const GUNGERBREAD = "Gungerbread";
	static const PANCAKES = "Pancakes";
	static const HEARTY_CREAM_CAKE = "Hearty cream cake";
	static const ICE_CREAM = "Ice cream";
	static const STEEL_INGOT = "Steel ingot";
	static const IRON_INGOT = "Iron ingot";
	static const CORD = "Cord";
	static const TORCH = "Torch";
	static const SCONCE = "Sconce";
	static const BONFIRE = "Bonfire";
	static const CANDLESTICK = "Candlestick";
	static const CANDELABRUM = "Candelabrum";
	static const BRAZIER = "Brazier";
	static const LANTERN = "Lantern";
	static const NAUGHTY_NIGHT_LIGHT = "Naughty night light";
	static const FIREPLACE = "Fireplace";
	static const COPPER_INGOT = "Copper ingot";
	static const STRAW_FLOOR = "Straw floor";
	static const WOOD = "Wood";
	static const GLASS = "Glass";
	static const FIBROUS_FABRIC = "Fibrous fabric";
	static const LIQUID_SILVER = "Liquid silver";
	static const VULCOVOLTAIC_MAGIMOTOR = "Vulcovoltaic magimotor";
	static const MAGIC_INGOT = "Magic ingot";
	static const POWER_CRYSTAL = "Power crystal";
	static const SPRING = "Spring";
	static const THERMOBATTERY = "Thermobattery";
	static const MAGIC_DOOR = "Magic door";
	static const CELL_DOOR = "Cell door";
	static const STONE_COPING = "Stone coping";
	static const STONE_CAPPING = "Stone capping";
	static const FENCING = "Fencing";
	static const BRICK_WALL = "Brick wall";
	static const STONE_WALL = "Stone wall";
	static const FLAGSTONE = "Flagstone";
	static const MAGIC_DYE = "Magic dye";
	static const POT = "Pot";
	static const STRAW_FLOORING = "Straw flooring";
	static const STRAW_DOOR = "Straw door";
	static const WOODEN_DOOR = "Wooden door";
	static const CANTLIN_SHIELD = "Cantlin shield";
	static const BARRICADE = "Barricade";
	static const SPIKE_TRAP = "Spike trap";
	static const LADDER = "Ladder";
	static const STONE_STEPS = "Stone steps";
	static const WOODEN_STEPS = "Wooden steps";
	static const STONE_WINDOW = "Stone window";
	static const PORCHED_WINDOW = "Porched window";
	static const ARCHED_WINDOW = "Arched window";
	static const WINDOW = "Window";
	static const STONE_FOUNDATION = "Stone foundation";
	static const BUTTRESS = "Buttress";
	static const WOODEN_WALL = "Wooden wall";
	static const WOODEN_CLADDING = "Wooden cladding";
	static const WOODEN_FLOOR = "Wooden floor";
	static const WOODEN_FLOORING = "Wooden flooring";
	static const HARDWOOD_TILE = "Hardwood tile";
	static const CASTLE_FOUNDATION = "Castle foundation";
	static const CASTLE_WALL = "Castle wall";
	static const CASTLE_CRENELLATION = "Castle crenellation";
	static const CASTLE_BATTLEMENT = "Castle battlement";
	static const MINI_MERLON = "Mini merlon";
	static const CASTLE_CLADDING = "Castle cladding";
	static const CASTLE_TILE = "Castle tile";
	static const CARVED_CASTLE_TILE = "Carved castle tile";
	static const CASTLE_TILING = "Castle tiling";
	static const BLUE_TEMPLE_TILE = "Blue temple tile";
	static const BRONZE_TEMPLE_TILE = "Bronze temple tile";
	static const TIMBERED_FOUNDATION = "Timbered foundation";
	static const TIMBERED_WALL = "Timbered wall";
	static const TIMBERED_CAPITAL = "Timbered capital";
	static const TIMBERED_CLADDING = "Timbered cladding";
	static const HARDWOOD_PEDESTAL = "Hardwood pedestal";
	static const HARDWOOD_COLUMN = "Hardwood column";
	static const HARDWOOD_CAPITAL = "Hardwood capital";
	static const RED_CARPET = "Red carpet";
	static const FANCY_CARPET = "Fancy carpet";
	static const RED_CARPETING = "Red carpeting";
	static const PURPLE_FLAGSTONE = "Purple flagstone";
	static const PURPLE_FLAGSTONE_FLOORING = "Purple flagstone flooring";
	static const BLUE_FLAGSTONE = "Blue flagstone";
	static const BLUE_FLAGSTONE_FLOORING = "Blue flagstone flooring";
	static const ROOF_TILING = "Roof tiling";
	static const RIDGE_TILING = "Ridge tiling";
	static const TILED_WINDOW = "Tiled window";
	static const PITCHED_TILING = "Pitched tiling";
	static const OUTER_CORNER_TILING = "Outer corner tiling";
	static const INNER_CORNER_TILING = "Inner corner tiling";
	static const BRICK_CLADDING = "Brick cladding";
	static const STONE_CLADDING = "Stone cladding";
	static const FLAGSTONE_FLOORING = "Flagstone flooring";
	static const PISTON = "Piston";
	static const PRESSURE_PLATE = "Pressure plate";
	static const BUTTON = "Button";
	static const STRAIGHT_TRACK = "Straight track";
	static const CURVED_TRACK = "Curved track";
	static const SLOPED_TRACK = "Sloped track";
	static const END_OF_LINE_SIGN = "End-of-the-line sign";
	static const HOT_WATER_CRYSTAL = "Hot water crystal";
	static const WATER_CRYSTAL = "Water crystal";
	static const SHARING_STONE = "Sharing stone";
	static const SUMMONING_STONE = "Summoning stone";
	static const BLACK_BLOCK = "Black block";
	static const GREY_BLOCK = "Grey block";
	static const WHITE_BLOCK = "White block";
	static const BURGUNDY_BLOCK = "Burgundy block";
	static const RED_BLOCK = "Red block";
	static const PURPLE_BLOCK = "Purple block";
	static const PINK_BLOCK = "Pink block";
	static const GREEN_BLOCK = "Green block";
	static const LIME_GREEN_BLOCK = "Lime green block";
	static const ORANGE_BLOCK = "Orange block";
	static const YELLOW_BLOCK = "Yellow block";
	static const NAVY_BLOCK = "Navy block";
	static const BLUE_BLOCK = "Blue block";
	static const BEIGE_BLOCK = "Beige block";
	static const CYAN_BLOCK = "Cyan block";
	static const SILVER_BLOCK = "Silver block";
	static const GOLD_BLOCK = "Gold block";
	static const EYEWALL = "Eyewall";
	static const SLIMY_BLOCK = "Slimy block";
	static const TIME_HONOURED_TURF = "Time-honoured turf";
	static const EIGHT_BIT_BRICK = "8 bit brick";
	static const OLDE_WORLDE_WALL = "Olde worlde wall";
	static const RETRO_ROOF = "Retro roof";
	static const CLASSIC_COUNTER = "Classic counter";
	static const TRADITIONAL_TRAP_TILE = "Traditional trap tile";
	static const DATED_DESERT = "Dated desert";
	static const OLD_SCHOOL_OCEAN = "Old school ocean";
	static const BYGONE_BOG = "Bygone bog";
	static const CHIMNEY = "Chimney";
	static const WELL = "Well";
	static const SIGNPOST = "Signpost";
	static const DRAGONLORDS_STANDARD = "Dragonlord\'s standard";
	static const VILE_TILE = "Vile tile";
	static const DRACONIC_COLUMN = "Draconic column";
	static const VILE_VISAGE = "Vile visage";
	static const EVIL_IDOL = "Evil idol";
	static const BEASTLY_BURROW = "Beastly burrow";
	static const HELLIPORTAL = "Helliportal";
	static const BALLISTA = "Ballista";
	static const CANNON = "Cannon";
	static const MAGIC_CANNON = "Magic cannon";
	static const SIMPLE_BED = "Simple bed";
	static const KING_SIZED_BED = "King-sized bed";
	static const PRINCESS_SIZED_BED = "Princess-sized bed";
	static const COLOSSAL_CLOSET = "Colossal closet";
	static const BARREL = "Barrel";
	static const BEER_BARREL = 'Beer barrel';
	static const STONE_TABLE = 'Stone table';
	static const STONE_STOOL = "Stone stool";
	static const BIG_TABLE = "Big table";
	static const DINING_TABLE = "Dining table";
	static const ROUND_TABLE = "Round table";
	static const EXTRAVAGANT_TABLE = 'Extravagant table';
	static const WOODEN_STOOL = 'Wooden stool';
	static const COMFY_SOFA = "Comfy sofa";
	static const CHIC_CHAIR = 'Chic chair';
	static const THRONE = 'Throne';
	static const DRAGONLORDS_THRONE = "Dragonlord\'s throne";
	static const WOODEN_MEMORIAL = "Wooden memorial";
	static const PRETTY_PILLAR = "Pretty pillar";
	static const COLUMN = 'Column';
	static const WASHTUB = 'Washtub';
	static const POT_PLANT = 'Pot plant';
	static const PLANT_POT = 'Plant pot';
	static const FILTER_FOUNTAIN = "Filter fountain";
	static const FOUNTAIN = "Fountain";
	static const FIERCE_FOUNTAIN = "Fierce fountain";
	static const BAR_COUNTER = "Bar counter";
	static const TOWEL_RAIL = "Towel rail";
	static const DUMB_BELLS = "Dumb-bells";
	static const GODDESS_STATUE = "Goddess statue";
	static const DECORATIVE_DRAPERY = "Decorative drapery";
	static const STEEL_DOORS = "Steel doors";
	static const SALOON_DOOR = "Saloon door";
	static const STRAW_MATTRESS = "Straw mattress";
	static const CHEST = "Chest";
	static const COLOSSAL_COFFER = "Colossal coffer";
	static const BENCH = "Bench";
	static const GRAVESTONE = "Gravestone";
	static const BOLD_BANNER = "Bold banner";
	static const BIG_BOLD_BANNER = "Big bold banner";
	static const DRESSING_TABLE = "Dressing table";
	static const BOOK = "Book";
	static const BOOKCASE = "Bookcase";
	static const CRATE = "Crate";
	static const TREASURE_CHEST = 'Treasure chest';
	static const WARDROBE = "Wardrobe";
	static const GRANDFATHER_CLOCK = "Grandfather clock";
	static const CHEST_OF_DRAWERS = "Chest of drawers";
	static const ARMOIRE = "Armoire";
	static const INN_SIGN = "Inn sign";
	static const SHOP_SIGN = "Shop sign";
	static const GENTLEMAN_SIGN = "Gentleman sign";
	static const LADY_SIGN = "Lady sign";
	static const ORNAMENTAL_SWORDS = "Ornamental swords";
	static const ORNAMENTAL_ARMOUR = "Ornamental armour";
	static const ARMOURERS_SIGN = 'Armoures\'s sign';
	static const HELAS_HAMMER_SIGN = "Hela\'s hammer sign";
	static const CLOVER_CARVING = "Clover carving";
	static const DECORATIVE_SHEILD = "Decorative shield";
	static const PORTRAIT_OF_LADY = "Portrait of a lady";
	static const CHAINS = 'Chains';
	static const NOTE = "Note";
	static const STATIONERY = 'Stationery';
	static const TREASURES_N_TRAPDOORS = 'Treasures \'n\' Trapdoors';
	static const STUFFED_HAMMERHOOD = 'Stuffed hammerhood';
	static const SLIME_BALLOONS = 'Slime balloons';
	static const POWIE_YOWIE_RUG = 'Powie yowie rug';
	static const ITEM_DISPLAY_STAND = "Item dislay stand";
	static const EQUIPMENT_DISPLAY_STAND = "Eqiupment display stand";
	static const STOVE = "Stove";
	static const SINK = "Sink";
	static const BATHTUB = "Bathtub";
	static const CROCKERY = "Crockery";
	static const WATER_JUG = "Water jug";
	static const BOTTLES = 'Bottles';
	static const BREADBASKET = "Breadbasket";
	static const SALAD_PLATE = "Salad plate";
	static const MEAT_FEAST = "Meat feast";
	static const FISH_DISH = "Fish dish";
	static const TEA_SERVICE = "Tea service";
	static const LYRE_SLIME = "Lyre of slime immemorial";
	static const OBJECT_SPRITE = "Object sprite";
	static const CHARACTER_SPRITE = "Character sprite";
	static const SAVIOUR_SPRITE = "Saviour sprite";
	static const FLAT_OBJECT_SPRITE = "Flat object sprite";
	static const FLAT_CHARACTER_SPRITE = "Flat character sprite";
	static const FLAT_SAVIOUR_SPRITE = "Flat saviour sprite";
	static const HEALIX_THE_HERO = "Healix the hero";
	static const MASONS_WORKSTATION = "Mason\'s workstation";
	static const CARPENTERS_WORKSTATION = "Carpenter\'s workstation";
	static const HERBALISTS_CAULDRON = "Herbalist\'s cauldron";
	static const SEWING_STATION = "Sewing station";
	static const MINERS_REFINER = "Miner\'s refiner";
	static const WELDERS_WORKBANCH = "Welder\'s workbench";
	static const DIVINERS_ALTAR = "Diviner\'s altar";
	static const COOKFIRE = "Cookfire";
	static const BRICK_BARBECUE = "Brick barbecue";
	static const FORGE = "Forge";
	static const FURNACE = "Furnace";
	static const TRANSMUTATION_TABLE = "Transmutation table";
	static const BUILDERS_WORKBENCH = "Builder\'s workbench";
	static const MACHINISTS_WORKBENCH = "Machinist\'s workbench";
	static const FORBIDDEN_ALTAR = "Forbidden altar";
	static const DQ_GAME_PAK = "Dragon quest game pak";
	static const SHOVEL = "Shovel";
	static const CYPRESS_STICK = "Cypress sticks";
	static const OAKEN_CLUB = "Oaken club";
	static const STONE_SWORD = "Stone sword";
	static const COPPER_SWORD = "Copper sword";
	static const IRON_BROADSWORD = "Iron broadsword";
	static const STEEL_BROADSWORD = "Steel broadsword";
	static const FALCON_BLADE = "Falcon blade";
	static const FIRE_BLADE = "Fire blade";
	static const AURORA_BLADE = "Aurora blade";
	static const SWORD_OF_KINGS = "Sword of kings";
	static const ERDRICKS_SWORD = "Erdrick\'s sword";
	static const SWORD_OF_RUIN = "Sword of ruin";
	static const GIANT_MALLET = "Giant mallet";
	static const SLEDGEHAMMER = "Sledgehammer";
	static const WAR_HAMMER = "War hammer";
	static const HELAS_HAMMER = "Hela\'s hammer";
	static const HAMMER_OF_BUILDER = "Hammer of the builder";
	static const STONE_AXE = "Stone axe";
	static const IRON_AXE = "Iron axe";
	static const BATTLEAXE = "Battleaxe";
	static const RAGGED_RAGS = "Ragged rags";
	static const PLAIN_CLOTHES = "Plain clothes";
	static const WAYFARERS_CLOTHES = "Wayfarers clothes";
	static const GUARDS_GARB = "Guard\'s garb";
	static const VILLAGERS_VESTURE = "Villager\'s vesture";
	static const TRADERS_TUNIC = "Trader\'s tunic";
	static const TRAINING_TOGS = "Training togs";
	static const CLOAK_OF_EVASION = "Cloak of evasion";
	static const CHAINMAIL = "Chainmail";
	static const LEATHER_ARMOUR = "Leather armour";
	static const IRON_ARMOUR = "Iron armour";
	static const FULL_PLATE_ARMOUR = "Full plate armour";
	static const SPIKED_ARMOUR = "Spiked armour";
	static const MAGIC_ARMOUR = "Magic armour";
	static const LEATHER_SHIELD = "Leather shield";
	static const IRON_SHIELD = "Iron shield";
	static const STEEL_SHIELD = "Steel shield";
	static const MAGIC_SHIELD = "Magic shield";
	static const HERO_SHIELD = "Hero\'s shield";
	static const AURORAL_ARMOUR = "Auroral armour";
	static const FLOWING_DRESS = "Flowing dress";
	static const SILVER_SHIELD = "Silver shield";
	static const WAILERS_MAIL = "Wailer\'s mail";
	static const THANATOS_SHIELD = "Thanatos\' shield";
	static const SCANDALOUS_SWIMSUIT = "Scandalous swimsuit";
	static const RING_OF_IMMUNITY = "Ring of immunity";
	static const FULL_MOON_RING = "Full moon ring";
	static const RING_OF_CLARITY = "Ring of clarity";
	static const GOURMANDS_GIRDLE = "Gourmand\'s girdle";
	static const STRENGTH_RING = "Strength ring";
	static const CATHOLICON_RING = "Catholicon ring";
	static const FEATHERFALL_FOOTWEAR = "Featherfall footwear";
	static const METEORITE_BRACER = "Meteorite bracer";
	static const RING_OF_CRITICALITY = "Ring of criticality";
	static const TALARIA = "Talaria";
	static const SLIMY_TUSSLE_TICKET = "Slimy tussle ticket";
	static const FLATTENED_TUSSLE_TICKET = "Flattened tussle ticket";
	static const POISONOUS_TUSSLE_TICKET = "Poisonous tussle ticket";
	static const ROUGHED_UP_TUSSLE_TICKET = "Roughed-up tussle ticket";
	static const TORRID_TUSSLE_TICKET = "Torrid tussle ticket";
	static const MAGICAL_TUSSLE_TICKET = "Magical tussle ticket";
	static const BLOODY_TUSSLE_TICKET = "Bloody tussle ticket";
	static const DEMONIC_TUSSLE_TICKET = "Demonic tussle ticket";
	static const SKELETAL_TROUBLE_TICKET = "Skeletal trouble ticket";
	static const FEATHERY_TROUBLE_TICKET = "Feathery trouble ticket";
	static const PRICKLY_TROUBLE_TICKET = "Prickly trouble ticket";
	static const ROTTEN_TROUBLE_TICKET = "Rotten trouble ticket";
	static const TRICKY_TROUBLE_TICKET = "Tricky trouble ticket";
	static const METALLIC_TROUBLE_TICKET = "Metallic trouble ticket";
	static const BALEFUL_TROUBLE_TICKET = "Baleful trouble ticket";
	static const DEADLY_TROUBLE_TICKET = "Deadly trouble ticket";
	static const STONY_TRAUMA_TICKET = "Stony trauma ticket";
	static const FRIGHTENING_TRAUMA_TICKET = "Frightening trauma ticket";
	static const PIERCING_TRAUMA_TICKET = "Piercing trauma ticket";
	static const RESPLENDENT_TRAUMA_TICKET = "Resplendent trauma ticket";
	static const TOWERING_TRAUMA_TICKET = "Towering trauma ticket";
	static const MECHANICAL_TRAUMA_TICKET = "Mechanical trauma ticket";
	static const BURNING_TRAUMA_TICKET = "Burning trauma ticket";
	static const DREADFUL_TRAUMA_TICKET = "Dreadful trauma ticket";
	static const ALL_KNIGHTER_TICKET = "All-Knighter trauma ticket";
	static const FULL_METAL_TICKET = "Full Metal ticket";
	static const GOLD_RUSH_TICKET = "Gold Rush ticket";
	static const FURRY_FURY_TICKET = "Furry Fury ticket";
	static const MAGER_LEAGUE_TICKET = "Mager League ticket";
	static const BLACKENED_BLOOZE_TICKET = "Blackened Blooze ticket";
}

class ObjectPage extends StatefulWidget {
	ObjectPage(this.objectName, this.description, this.ingredients, this.workstation, this.type, {this.effect, this.score});

	final String objectName;
	final String description;
	final List<Ingredient> ingredients;
	final String workstation;
	final ObjectType type;
	final String effect;
	final int score;


	@override
	_ObjectPageState createState() => _ObjectPageState();
}

class _ObjectPageState extends State<ObjectPage> {
	@override
	Widget build(BuildContext context) {
		AssetImage image;
		Color color;
		switch (widget.type) {
			case ObjectType.items:
				image = new AssetImage("assets/item.png");
				color = itemColor;
				break;
			case ObjectType.food:
				image = new AssetImage("assets/food.png");
				color = foodColor;
				break;
			case ObjectType.light_source:
				image = new AssetImage("assets/lightsource.png");
				color = lightSourceColor;
				break;
			case ObjectType.materials:
				image = new AssetImage("assets/materials.png");
				color = materialsColor;
				break;
			case ObjectType.building_materials:
				image = new AssetImage("assets/buildingmaterials.png");
				color = buildingMaterialsColor;
				break;
			case ObjectType.furniture:
				image = new AssetImage("assets/furniture.png");
				color = furnitureColor;
				break;
			case ObjectType.crafting_station:
				image = new AssetImage("assets/craftingstation.png");
				color = craftingStationColor;
				break;
			case ObjectType.weapon_tool:
				image = new AssetImage("assets/weapon.png");
				color = weaponToolColor;
				break;
			case ObjectType.armour:
				image = new AssetImage("assets/armour.png");
				color = armourColor;
				break;
		}

		List<Widget> renderList = new List();
		renderList.add(
			Container(
				margin: EdgeInsets.all(10.0),
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(20.0),
					border: Border.all(color: color, width: 15.0)
				),
				padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
				child: Image(image: image,)
			)
		);
		renderList.add(
			Container(
				decoration: BoxDecoration(
					color: color,
					borderRadius: BorderRadius.circular(5.0)
				),
				padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
				margin: EdgeInsets.only(bottom: 3.0),
				child: Text(widget.objectName, style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600),)
			)
		);
		renderList.add(
			blackTextBox(
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Text("Description:", style: Theme.of(context).textTheme.body2,),
						Text(widget.description, style: Theme.of(context).textTheme.body1,)
					],
				)
			)
		);
		if (widget.effect != null) {
			renderList.add(
				blackTextBox(
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text("Effect:", style: Theme.of(context).textTheme.body2,),
							Text(widget.effect, style: Theme.of(context).textTheme.body1,)
						],
					)
				)
			);
		}
		List<Widget> ingredientWidgets = new List();
		ingredientWidgets.add(
			Text("Ingredients:", style: Theme.of(context).textTheme.body2,)
		);
		for (Ingredient i in widget.ingredients) {
			ingredientWidgets.add(
				Text("•" + i.ingredientName + " x" + i.quantity.toString() + "  ", style: Theme.of(context).textTheme.body1,)
			);
		}
		renderList.add(
			blackTextBox(
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: ingredientWidgets,
				)
			)
		);
		if (widget.score != null) {
			renderList.add(
				blackTextBox(
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text("Score:", style: Theme.of(context).textTheme.body2,),
							Text(widget.score.toString() + " points.", style: Theme.of(context).textTheme.body1,)
						],
					)
				)
			);
		}

		return Scaffold(
			appBar: AppBar(
				backgroundColor: color,
				title: Text(widget.objectName),
			),
			body: Container(
				  decoration: BoxDecoration(
					  image: DecorationImage(image: AssetImage("assets/gamePic.jpg"), fit: BoxFit.cover)
				  ),
			  padding: EdgeInsets.symmetric(horizontal: 20.0),
			  child: Container(
					 color: Colors.white54,
			    child: Flex(
						direction: Axis.vertical,
			      children: <Widget>[
						Expanded(
						flex: 1,
						child: SingleChildScrollView(
						  child: Column(
						  	children: renderList,
						  ),
						),
						),
					  ],
			    ),
			  ),
			),
		);
	}
}

class RoomComponent {
	static const STRAW_MATTRESS = "Straw mattress";
	static const LIGHT_SOURCE = "[Light source]";
	static const FANCY_BED = "[Fancy bed]";
	static const INN_SIGN = "Inn sign";
	static const BED = "[Bed]";
	static const PORTRAIT_OF_A_LADY = "Portrait of a lady";
	static const COOKFIRE = "Cookfire";
	static const CHEST = "Chest";
	static const TABLE = "[Table]";
	static const CHAIR = "[Chair]";
	static const DECORATIVE_FOOD = "[Decorative food]";
	static const BRICK_BARBECUE = "Brick barbecue";
	static const BEER_BARREL = "Beer barrel";
	static const BAR_COUNTER = "Bar counter";
	static const SMALL_TABLE = "Small table";
	static const COMFY_STOOL = "Comfy stool";
	static const ARMOIRE = "Armoire";
	static const ORNAMENTAL_SWORDS = "Ornamental swords";
	static const ORNAMENTAL_ARMOUR = "Ornamental armour";
	static const SEWING_STATION = "Sewing station";
	static const HOT_WATER = "Block of hot water";
	static const TOWEL_RAIL = "Towel rail";
	static const WASHTUB = "Washtub";
	static const ARMOURER_SIGN = "Armourer\'s sign";
	static const HELA = "Hela\'s hammer sign";
	static const MASON = "Mason\'s workstation";
	static const CARPENTER = "Carpenter\'s workstation";
	static const MINER = "Miner\'s refiner";
	static const LEATHER_SACK = "Leather sack";
	static const SHOP_SIGN = "Shop sign";
	static const FANCY_LIGHT_SOURCE = "[Fancy light source]";
	static const SMITHING_STATION = "Smithing station";
	static const HERBALIST = "Herbalist\'s cauldron";
	static const POT = "Pot";
	static const TRANSMUTATION_TABLE = "Transmutation table";
	static const WELDER = "Welder\'s workbench";
	static const BOOKCASE = "Bookcase";
	static const BOOK = "Book";
	static const RESIDENT_SIGN = "[Resident\'s sign]";
	static const BENCH = "Bench";
	static const FLOWER = "[Flower]";
	static const PLANT = "[Plant]";
	static const MEMORIAL = "[Memorial]";
	static const TREASURE_CHEST = "Treasure chest";
	static const COLOSSAL_COFFER = "Colossal coffer";
	static const BOLD_BANNER = "Bold banner";
	static const SIMPLE_BED = "Simple bed";
	static const POT_PLANT = "Pot plant";
	static const WATER = "Block of water";
	static const FILTER_FOUNTAIN = "Filter fountain";
	static const DIVINER = "Diviner\'s altar";
	static const CANDELABRUM = "Candelabrum";
	static const GODDESS = "Goddess statue";
	static const DINING_TABLE = "Dining table";
	static const THRONE = "Throne";
	static const BIG_BOLD_BANNER = "Big bold banner";
	static const COLUMN = "Column";
	static const LADY_SIGN = "Lady sign";
	static const PRINCESS_BED = "Princess-sized bed";
	static const CHIC_CHAIR = "Chic chair";
	static const TELEPORTAL = "[Teleportal]";
	static const PLUMBERRY_TREE = "Plumberry tree";
	static const BRAZIER = "Brazier";
	static const BATHTUB = "Bathtub";
	static const DUMBBELL = "Dumb-bells";
	static const FOUNTAIN = "Fountain";
	static const ROCK = "Rocks";
	static const TREES = "[Trees]";
	static const IVY = "Ivy";
	static const CACTUS = "Cactus";
	static const SANDWORT = "Sandwort";
	static const DEAD_TREE = "Dead tree";
	static const PONGSETTIA = "Pongsettia";
	static const BIGONIA = "Bigonia";
	static const COTTON_PLANT = "COTTON PLANT";
	static const TINGLEWEED = "Tingleweed";
	static const CROP = "[Crop]";
	static const MARSHROOM = "Marshroom";
	static const FROGSTOOL = "Frogstool";
	static const STOVE = "Stove";
	static const ROUND_TABLE = "Round table";
	static const EXTRAVAGANT_TABLE = "Extravagant table";
	static const DRAGONLORD_THRONE = "Dragonlord\'s throne";
	static const DRACONIC_COLUMN = "Draconic column";
	static const DISPLAY_STAND = "Display stand";
	static const TORCH = "Torch";
	static const SCONCE = "Sconce";
	static const TRACK = "Track";
	static const PISTON = "Piston";
	static const PRESSURE_PLATE = "Pressure plate";
	static const FIREPLACE = "Fireplace";
	static const CHAINS = "Chains";
	static const BONES = "Bones";
	static const EVIL_ITEM = "[Evil item]";
	static const BLIGHTED_ITEM = "[Blighted item]";
	static const WRECKING_BALL = "Wrecking ball";

	String _componentName;
	int _quantity;

	RoomComponent(String name, int num) {
		_componentName = name;
		_quantity = num;
	}

	int get quantity => _quantity;

	String get componentName => _componentName;
}

class RoomPage extends StatefulWidget {
	RoomPage(this.objectName, this.description, this.components,this.effect,);

	final String objectName;
	final String description;
	final List<RoomComponent> components;
	final String effect;

	@override
	_RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
	@override
	Widget build(BuildContext context) {
		List<Widget> renderList = new List();
		renderList.add(
			Container(
				margin: EdgeInsets.all(10.0),
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(20.0),
					border: Border.all(color: roomColor, width: 15.0),
				),
				padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
				child: Image(image: AssetImage("assets/house.png"),)
			)
		);
		renderList.add(
			Container(
				decoration: BoxDecoration(
					color: roomColor,
					borderRadius: BorderRadius.circular(5.0)
				),
				padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
				margin: EdgeInsets.only(bottom: 3.0),
				child: Text(widget.objectName, style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600),)
			)
		);
		renderList.add(
			blackTextBox(
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Text("Description:", style: Theme.of(context).textTheme.body2,),
						Text(widget.description, style: Theme.of(context).textTheme.body1,)
					],
				)
			)
		);
		renderList.add(
			blackTextBox(
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Text("Effect:", style: Theme.of(context).textTheme.body2,),
						Text(widget.effect, style: Theme.of(context).textTheme.body1,)
					],
				)
			)
		);
		List<Widget> componentWidgets = new List();
		componentWidgets.add(
			Text("Components:", style: Theme.of(context).textTheme.body2,)
		);
		for (RoomComponent i in widget.components) {
			componentWidgets.add(
				Text("•" + i.componentName + " x" + i.quantity.toString() + "  ", style: Theme.of(context).textTheme.body1,)
			);
		}
		renderList.add(
			blackTextBox(
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: componentWidgets,
				)
			)
		);

	}
}

class Rooms {

}

Widget blackTextBox(Column column) {
	return Container(
		margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
		padding: const EdgeInsets.all(6.0),
		decoration: const BoxDecoration(
			color: Colors.black,
			borderRadius: BorderRadius.all(Radius.circular(7.0)),
			border: Border(
				top: BorderSide(width: 4.0, color: Colors.white),
				left: BorderSide(width: 4.0, color: Colors.white),
				right: BorderSide(width: 4.0, color: Colors.white),
				bottom: BorderSide(width: 4.0, color: Colors.white),
			)
		),
		child: Flex(direction: Axis.horizontal, children: <Widget>[
			Expanded(child: column, flex: 1,)
		],),
	);
}