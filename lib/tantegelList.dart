import 'package:flutter/material.dart';
import 'universalClasses.dart';
import 'package:dqbuilders_companion/crafting.dart';

class TantegelListPage extends StatefulWidget {
	@override
	_TantegelListPageState createState() => _TantegelListPageState();
}

class _TantegelListPageState extends State<TantegelListPage> with SingleTickerProviderStateMixin {
	bool _openItems = true;
	bool _openFood = false;
	bool _openLightSource = false;
	bool _openMaterials = false;
	bool _openBuildingMaterials = false;
	bool _openFurniture = false;
	bool _openCraftingStation = false;
	bool _openWeaponTool = false;
	bool _openArmour = false;
	bool _openOther = false;
	bool _openRoom = false;

	final TextEditingController _filter = new TextEditingController();

	String _searchText = "";
	bool _searchBarShow = false;
	AnimationController _searchBarController;

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			resizeToAvoidBottomPadding: false,
			appBar: AppBar(
				backgroundColor: Colors.grey,
				title: Text("Tantegel", style: Theme.of(context).textTheme.title,),
				actions: <Widget>[
					IconButton(
						icon: Icon(_searchBarShow ? Icons.close : Icons.search),
						onPressed: () {
							_searchPressed();
						},
					),
					settingsIcon(context),
				],
			),
			body: Column(
				children: <Widget>[
					searchBar(),
					Expanded(child: objectList(context))
				],
			),
		);
	}

	@override
	void initState() {
		super.initState();
		_searchBarController = AnimationController(
			vsync: this, // the SingleTickerProviderStateMixin
			duration: Duration(milliseconds: 300),
		);
		_searchBarController.addStatusListener((status) {
			if(status == AnimationStatus.dismissed) {
				_filter.clear();
			}
		});
		_filter.addListener(() {
			if (_filter.text.isEmpty) {
				setState(() {
					_searchText = "";
				});
			} else {
				setState(() {
					_searchText = _filter.text.toLowerCase();
					_openItems = true;
					_openFood = true;
					_openLightSource = true;
					_openMaterials = true;
					_openBuildingMaterials = true;
					_openFurniture = true;
					_openCraftingStation = true;
					_openWeaponTool = true;
					_openArmour = true;
					_openOther = true;
					_openRoom = true;
				});
			}
		});
	}

	@override
	void dispose() {
		super.dispose();
		_searchBarController.dispose();
	}

	Widget objectList(BuildContext context) {
		List<ObjectPage> items = new List();
		List<ObjectPage> food = new List();
		List<ObjectPage> lightSource = new List();
		List<ObjectPage> materials = new List();
		List<ObjectPage> buildingMaterials = new List();
		List<ObjectPage> furniture = new List();
		List<ObjectPage> craftingStation = new List();
		List<ObjectPage> weaponTool = new List();
		List<ObjectPage> armour = new List();

		List<Ingredient> ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PRISMATIC_CRYSTAL, 1));
		items.add(new ObjectPage(
			Craftable.RAINBOW_DROP,
			"A stone that shines with the light of life in all its many hues.",
			ingredients,
			Workstation.ANCIENT,
			ObjectType.items,
			effect: "Allows you to travel between Tantegel and the Dragonlord's island.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		items.add(new ObjectPage(
			Craftable.HOLY_WATER,
			"A bottle of blessed water with purifying powers.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.items,
			effect: "Purifies the surrounding land.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHITE_PETALS, 3));
		items.add(new ObjectPage(
			Craftable.HEALING_CREAM,
			"A palliative paste of pure white petals.",
			ingredients,
			Workstation.TREE,
			ObjectType.items,
			effect: "Restores 15 HP.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MEDICINAL_LEAF, 3));
		items.add(new ObjectPage(
			Craftable.MEDICINAL_HERB,
			"A carefully prepared pouch of pain-relieving leaves.",
			ingredients,
			Workstation.MASON,
			ObjectType.items,
			effect: "Restores 30 HP.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HOLY_WATER, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		items.add(new ObjectPage(
			Craftable.SHEEN_SALTS,
			"A sanctified solution of curse-cleansing compounds.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.items,
			effect: "Banishes curses.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HOLY_WATER, 1));
		ingredients.add(new Ingredient(Ingredient.MEDICINAL_LEAF, 3));
		ingredients.add(new Ingredient(Ingredient.WHITE_PETALS, 3));
		ingredients.add(new Ingredient(Ingredient.SCARE_ROOT, 1));
		items.add(new ObjectPage(
			Craftable.YGGDRASIL_ESSENCE,
			"An exotic elixir made to mirror the world tree\'s dew.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.items,
			effect: "Revives and restores you to full health upon death. Automatically used if held.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CHIMAERA_FEATHER, 5));
		items.add(new ObjectPage(
			Craftable.CHIMAERA_WING,
			"A fastly tied fan of fluttering feathers.",
			ingredients,
			Workstation.TREE,
			ObjectType.items,
			effect: "Instantly transports you to your base.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		items.add(new ObjectPage(
			Craftable.BUCKET,
			"A plain pail pieced together from wooden planks.",
			ingredients,
			Workstation.MASON,
			ObjectType.items,
			effect: "Scoops up water. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 2));
		ingredients.add(new Ingredient(Ingredient.HUGE_HORN, 1));
		items.add(new ObjectPage(
			Craftable.HORN_RIMMED_BUCKET,
			"A basic bucket with a trendy trim.",
			ingredients,
			Workstation.TREE,
			ObjectType.items,
			effect: "Scoops up water. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		ingredients.add(new Ingredient(Ingredient.PRICKLY_PEACH, 1));
		items.add(new ObjectPage(
			Craftable.FISHING_ROD,
			"A long line with a lure that the fish can\'t resist.",
			ingredients,
			Workstation.MASON,
			ObjectType.items,
			effect: "Allows you to fish in water. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		items.add(new ObjectPage(
			Craftable.DIVINE_DAGGER,
			"A silver throwing knife suffused with saintly sorcery.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.items,
			effect: "Inflicts damage. Inflicts paralysis on undead monsters.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ROCKBOMB_SHARD, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		items.add(new ObjectPage(
			Craftable.WRECKING_BALL,
			"An explosive steel sphere filled with fulminatory fragments.",
			ingredients,
			Workstation.MASON,
			ObjectType.items,
			effect: "Explodes a short time after being placed.",
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HOLY_WATER, 1));
		ingredients.add(new Ingredient(Ingredient.FLOAT_O_COPPER, 1));
		ingredients.add(new Ingredient(Ingredient.KEYSTONE, 1));
		items.add(new ObjectPage(
			Craftable.ULTIMATE_KEY,
			"A gemstone-studded key formed from a magical metal.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.items,
			effect: "Unlocks the doors to a certain castle.",
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MARSHROOMS, 1));
		food.add(new ObjectPage(
			Craftable.SHROOMS_ON_A_STICK,
			"A scrumptious skewer of barbecued marshrooms.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 20%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FROGSTOOL, 1));
		food.add(new ObjectPage(
			Craftable.FRIED_FROGSTOOL,
			"A fungus fried over an open flame to turn it from toxic to tasty.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 20%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		food.add(new ObjectPage(
			Craftable.FRIED_EGG,
			"A speckled egg fried sunny side up.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 20%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HARELOIN_STEAK, 1));
		ingredients.add(new Ingredient(Ingredient.CHILLI_PEPPERS, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.BONY_STEAK,
			"A substantial shank steak served on the bone.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 50% and increases attack power for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MARSHROOMS, 1));
		ingredients.add(new Ingredient(Ingredient.FROGSTOOL, 1));
		ingredients.add(new Ingredient(Ingredient.FROG, 1));
		ingredients.add(new Ingredient(Ingredient.NEWT, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.HELL_BROTH,
			"It takes a lot of toil and trouble to make a broth this tasty.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Completely fills hunger meter and increases defence for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		lightSource.add(new ObjectPage(
			Craftable.TORCH,
			"A burning branch fuelled with flammable liquid.",
			ingredients,
			Workstation.TREE,
			ObjectType.light_source,
			effect: "Light source.",
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 2));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		lightSource.add(new ObjectPage(
			Craftable.BONFIRE,
			"A big bundle of branches that burns brightly.",
			ingredients,
			Workstation.MASON,
			ObjectType.light_source,
			effect: "Light source.",
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SLUDGESTONE, 1));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		lightSource.add(new ObjectPage(
			Craftable.CANDLESTICK,
			"A handy candle stand to keep the darkness at bay.",
			ingredients,
			Workstation.MASON,
			ObjectType.light_source,
			effect: "Light source.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SLUDGESTONE, 1));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		lightSource.add(new ObjectPage(
			Craftable.CANDELABRUM,
			"A handsome candleholder that can be firmly fastened to any wall.",
			ingredients,
			Workstation.MASON,
			ObjectType.light_source,
			effect: "Light source.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		lightSource.add(new ObjectPage(
			Craftable.BRAZIER,
			"A blazing bowl of fire that illuminates everything around it.",
			ingredients,
			Workstation.MASON,
			ObjectType.light_source,
			effect: "Light source.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		ingredients.add(new Ingredient(Ingredient.SILVERY_SLUDGE, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		lightSource.add(new ObjectPage(
			Craftable.NAUGHTY_NIGHT_LIGHT,
			"A light-hearted lamp imbued with an alluring ambience.",
			ingredients,
			Workstation.MASON,
			ObjectType.light_source,
			effect: "Light source. Heats things up when placed in a room.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		lightSource.add(new ObjectPage(
			Craftable.FIREPLACE,
			"A large hearth that\'s handy for heating a house.",
			ingredients,
			Workstation.MASON,
			ObjectType.light_source,
			effect: "Light source.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PLUMBERRY_LUMBER, 1));
		materials.add(new ObjectPage(
			Craftable.WOOD,
			"A perfectly planed plank of stripped and sawn lumber.",
			ingredients,
			Workstation.MASON,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IVY, 3));
		materials.add(new ObjectPage(
			Craftable.CORD,
			"A coil of cord constructed from tightly twined vine.",
			ingredients,
			Workstation.MASON,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 3));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		materials.add(new ObjectPage(
			Craftable.MAGIC_DYE,
			"A rainbow-hued brew of colourful goo.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SAND, 5));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		materials.add(new ObjectPage(
			Craftable.GLASS,
			"A fragile fragment of completely clear crystal.",
			ingredients,
			Workstation.FORGE,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		materials.add(new ObjectPage(
			Craftable.IRON_INGOT,
			"A heavy hunk of purified iron.",
			ingredients,
			Workstation.FORGE,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 8));
		ingredients.add(new Ingredient(Ingredient.COAL, 3));
		materials.add(new ObjectPage(
			Craftable.STEEL_INGOT,
			"A sizeable slab of smelted metal.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.WOODEN_DOOR,
			"A durable door made from wooden planks reinforced with iron.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.MAGIC_DOOR,
			"Sheets of steel soldered together and painted bright red.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 6));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.STEEL_DOORS,
			"Massive double doors made solely out of steel.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STONE_COPING,
			"A semi-cylindrical stone sculpture.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STONE_CAPPING,
			"A stylishly spherical stone sculpture.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STONE_STEPS,
			"A staircase sculpted from solid stone.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 20,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.LADDER,
			"A set of vertical steps pieced together from planks.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			effect: "Can be climbed when placed on walls.",
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.WINDOW,
			"A window made from sticks and some strange, see-through stuff.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CLAY, 5));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.BRICK_WALL,
			"Kiln-fired clay bricks bound into blocks to form a convenient construction material.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 5,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BRICK_CLADDING,
			"A covering that adds class to any earthen wall.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into brick wall blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CASTLE_FOUNDATION,
			"The firm footing of a castle wall, made from perfectly polished and uniformly arranged segments of stone.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CASTLE_WALL,
			"A block of magnificent masonry made from perfectly polished and uniformly arranged segments of stone.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CASTLE_WALL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.CASTLE_CLADDING,
			"A covering that adds class to any earthen wall.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into castle wall blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CASTLE_TILE,
			"A polished, purple cube that\'s fit for a king.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CARVED_CASTLE_TILE,
			"A polished, purple cube covered with complex carvings.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CASTLE_TILE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.CASTLE_TILING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			effect: "Changes nearby earth floors into castle tile blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.HOLY_WATER, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.BLUE_TEMPLE_TILE,
			"A consecrated cube covered with a pattern of spiritual significance.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.SEPTIC_SHRUB, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.BRONZE_TEMPLE_TILE,
			"Mystical markings decorate this divine block.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 2));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.RED_CARPET,
			"A crimson carpet perfect for paving the way for royalty.",
			ingredients,
			Workstation.BUILDER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 2));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.FANCY_CARPET,
			"Classy carpeting with a pretty, patterned pile.",
			ingredients,
			Workstation.BUILDER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RED_CARPET, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.RED_CARPETING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.BUILDER,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into red carpet blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		ingredients.add(new Ingredient(Ingredient.FUR, 1));
		furniture.add(new ObjectPage(
			Craftable.SIMPLE_BED,
			"A wooden frame with a comfy cotton mattress on top.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be slept on.",
			score: 80,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.FUR, 3));
		furniture.add(new ObjectPage(
			Craftable.KING_SIZED_BED,
			"A bed of princely proportions, with plenty of space to roll around in.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be slept on.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.FUR, 3));
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 2));
		furniture.add(new ObjectPage(
			Craftable.PRINCESS_SIZED_BED,
			"A great big bed with closable curtains to give a princess her privacy.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be slept on.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		furniture.add(new ObjectPage(
			Craftable.CHEST,
			"Branches bundled together to form a stout strongbox.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be used to store items.",
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 8));
		ingredients.add(new Ingredient(Ingredient.FUR, 3));
		ingredients.add(new Ingredient(Ingredient.POT, 1));
		furniture.add(new ObjectPage(
			Craftable.COLOSSAL_COFFER,
			"An enormous enchanted chest that can store all the materials a busy Builder needs.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be used to store items.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.EARTH, 3));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		furniture.add(new ObjectPage(
			Craftable.POT,
			"An earthen urn that can be used to store one’s personal property.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.BARREL,
			"A cask crafted from curved wooden planks.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		furniture.add(new ObjectPage(
			Craftable.SMALL_TABLE,
			"The finest timber carefully carved into a small, square table.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		furniture.add(new ObjectPage(
			Craftable.BIG_TABLE,
			"The finest timber carefully carved into a long, low table.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 1));
		furniture.add(new ObjectPage(
			Craftable.DINING_TABLE,
			"A trendy tablecloth adorns this otherwise austere table.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		furniture.add(new ObjectPage(
			Craftable.WOODEN_STOOL,
			"A simple stool crafted from carefully whittled wood.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 80,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.COTTON, 1));
		furniture.add(new ObjectPage(
			Craftable.COMFY_STOOL,
			"A chair crowned with a cosy cushion, perfect for a painful posterior.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 120,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.BENCH,
			"A long, wooden seat that’s perfect for placing in a park.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 1));
		furniture.add(new ObjectPage(
			Craftable.CHIC_CHAIR,
			"A high-backed seat that\'s overflowing with opulence.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 3));
		ingredients.add(new Ingredient(Ingredient.FUR, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 3));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		furniture.add(new ObjectPage(
			Craftable.THRONE,
			"A sumptuous seat that\'s fit for a king.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 2));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		furniture.add(new ObjectPage(
			Craftable.COLUMN,
			"A massive marble support structure with a classical cut.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 2));
		ingredients.add(new Ingredient(Ingredient.HOLY_WATER, 1));
		furniture.add(new ObjectPage(
			Craftable.GODDESS_STATUE,
			"A sculpture of the gracious Goddess watching over her children with a sympathetic smile.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 3));
		furniture.add(new ObjectPage(
			Craftable.DECORATIVE_DRAPERY,
			"A coloured cloth drape designed to be strung from the ceiling, or used as a bulky blindfold.",
			ingredients,
			Workstation.BUILDER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		furniture.add(new ObjectPage(
			Craftable.BOLD_BANNER,
			"A tall tapestry with a distinguished design.",
			ingredients,
			Workstation.BUILDER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 2));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		furniture.add(new ObjectPage(
			Craftable.BIG_BOLD_BANNER,
			"A huge hanging handsome enough to be hung in the most magnificent of halls.",
			ingredients,
			Workstation.BUILDER,
			ObjectType.furniture,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		furniture.add(new ObjectPage(
			Craftable.INN_SIGN,
			"A sign that shows guests are welcome to stay the night.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		furniture.add(new ObjectPage(
			Craftable.SHOP_SIGN,
			"A sign that shows a shop sells items.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		furniture.add(new ObjectPage(
			Craftable.GENTLEMAN_SIGN,
			"A bold, blue sign to signify the denizen of a dwelling.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "When placed inside a room, can be used to assign it to a male resident.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		furniture.add(new ObjectPage(
			Craftable.LADY_SIGN,
			"A rich, red sign to signify the denizen of a dwelling.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "When placed inside a room, can be used to assign it to a female resident.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 2));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		furniture.add(new ObjectPage(
			Craftable.DECORATIVE_SHEILD,
			"A silver-plated shield too weighty to wield in combat.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SILVER, 5));
		furniture.add(new ObjectPage(
			Craftable.LYRE_SLIME,
			"An eccentric instrument that brings back memories of a bygone age. [Unlocked by completing a challenge.]",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Press [action button] after placing to activate.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 8));
		craftingStation.add(new ObjectPage(
			Craftable.MASONS_WORKSTATION,
			"A smoothed slab of stone inscribed with lines for accurate crafting.",
			ingredients,
			Workstation.MASON,
			ObjectType.crafting_station,
			effect: "Can be used to build simple items and weapons.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SILVER, 8));
		ingredients.add(new Ingredient(Ingredient.ZENITHIUM, 1));
		craftingStation.add(new ObjectPage(
			Craftable.DIVINERS_ALTAR,
			"A blessed workbench imbued with heavenly energy.",
			ingredients,
			Workstation.MASON,
			ObjectType.crafting_station,
			effect: "Can be used to craft divine items.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SUNSTONE, 1));
		ingredients.add(new Ingredient(Ingredient.STAFF_OF_RAIN, 1));
		ingredients.add(new Ingredient(Ingredient.ANCIENT_EMBLEM, 1));
		ingredients.add(new Ingredient(Ingredient.ZENITHIUM, 3));
		ingredients.add(new Ingredient(Ingredient.HOLY_WATER, 1));
		craftingStation.add(new ObjectPage(
			Craftable.ANCIENT_ALTAR,
			"A reconstruction of the sanctified stand that steered the scion of Erdrick to his destiny.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.crafting_station,
			effect: "Can be used to build legendary items.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		ingredients.add(new Ingredient(Ingredient.GRASSY_LEAVES, 3));
		ingredients.add(new Ingredient(Ingredient.BONFIRE, 1));
		craftingStation.add(new ObjectPage(
			Craftable.COOKFIRE,
			"A simple stand built above a bonfire, used for making mouth-watering meals.",
			ingredients,
			Workstation.MASON,
			ObjectType.crafting_station,
			effect: "Light source. Can be used to cook food.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COOKFIRE, 1));
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 5));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		craftingStation.add(new ObjectPage(
			Craftable.BRICK_BARBECUE,
			"The brick barrier focuses the flame to create an ideal toasting temperature.",
			ingredients,
			Workstation.MASON,
			ObjectType.crafting_station,
			effect: "Light source. Can be used to cook food.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 10));
		ingredients.add(new Ingredient(Ingredient.IRON, 10));
		ingredients.add(new Ingredient(Ingredient.COAL, 5));
		craftingStation.add(new ObjectPage(
			Craftable.FURNACE,
			"A massive metal chamber so hot it can melt the hardest materials.",
			ingredients,
			Workstation.MASON,
			ObjectType.crafting_station,
			effect: "Can be used to build orichalcum items and weapons.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		weaponTool.add(new ObjectPage(
			Craftable.SHOVEL,
			"A simple spade with a pointed blade.",
			ingredients,
			Workstation.MASON,
			ObjectType.weapon_tool,
			effect: "Attack +1. Allows you to dig up plants without destroying them.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		weaponTool.add(new ObjectPage(
			Craftable.CYPRESS_STICK,
			"A broken branch whittled to work as a weapon.",
			ingredients,
			Workstation.TREE,
			ObjectType.weapon_tool,
			effect: "Attack +1.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 2));
		weaponTool.add(new ObjectPage(
			Craftable.OAKEN_CLUB,
			"A stout and sturdy wooden cudgel.",
			ingredients,
			Workstation.MASON,
			ObjectType.weapon_tool,
			effect: "Attack +5.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		weaponTool.add(new ObjectPage(
			Craftable.STONE_SWORD,
			"A sword of honed stone with a wooden pommel.",
			ingredients,
			Workstation.MASON,
			ObjectType.weapon_tool,
			effect: "Attack +11.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		weaponTool.add(new ObjectPage(
			Craftable.IRON_BROADSWORD,
			"A strong sword forged from iron.",
			ingredients,
			Workstation.FORGE,
			ObjectType.weapon_tool,
			effect: "Attack +26.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 1));
		weaponTool.add(new ObjectPage(
			Craftable.STEEL_BROADSWORD,
			"A weighty weapon with a sharp steel blade.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.weapon_tool,
			effect: "Attack +35.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM , 3));
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT , 2));
		ingredients.add(new Ingredient(Ingredient.GOLD , 1));
		ingredients.add(new Ingredient(Ingredient.SILVER , 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE , 1));
		weaponTool.add(new ObjectPage(
			Craftable.SWORD_OF_KINGS,
			"A sacred sword forged from a mystical metal.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.weapon_tool,
			effect: "Attack +50. Does not degrade with use.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		weaponTool.add(new ObjectPage(
			Craftable.GIANT_MALLET,
			"A heavy hammer hewn from a large log.",
			ingredients,
			Workstation.TREE,
			ObjectType.weapon_tool,
			effect: "Attack +8.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		weaponTool.add(new ObjectPage(
			Craftable.SLEDGEHAMMER,
			"A massive mallet made from solid iron.",
			ingredients,
			Workstation.FORGE,
			ObjectType.weapon_tool,
			effect: "Attack + 29. Can break very hard blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 1));
		armour.add(new ObjectPage(
			Craftable.RAGGED_RAGS,
			"A torn and tattered tunic that provides paltry protection.",
			ingredients,
			Workstation.MASON,
			ObjectType.armour,
			effect: "Defence +1.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COTTON, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 2));
		armour.add(new ObjectPage(
			Craftable.PLAIN_CLOTHES,
			"An ordinary outfit for everyday wear.",
			ingredients,
			Workstation.TREE,
			ObjectType.armour,
			effect: "Defence +3.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 2));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.WAYFARERS_CLOTHES,
			"A light and long-lasting tunic for the trendy traveller.",
			ingredients,
			Workstation.MASON,
			ObjectType.armour,
			effect: "Defence +5. Slightly increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.FUR, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.IRON_ARMOUR,
			"A suit of protective plate fashioned from iron ingots.",
			ingredients,
			Workstation.FORGE,
			ObjectType.armour,
			effect: "Defence +17.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.FULL_PLATE_ARMOUR,
			"A sturdy suit of impenetrable steel plate.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Defence +26.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FUR, 2));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		armour.add(new ObjectPage(
			Craftable.LEATHER_SHIELD,
			"A basic buckler hardened with hide.",
			ingredients,
			Workstation.MASON,
			ObjectType.armour,
			effect: "Defence +2.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		armour.add(new ObjectPage(
			Craftable.IRON_SHIELD,
			"A sturdy iron shield with a wooden handle.",
			ingredients,
			Workstation.FORGE,
			ObjectType.armour,
			effect: "Defence +5.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		armour.add(new ObjectPage(
			Craftable.STEEL_SHIELD,
			"A strong shield shaped from a single sheet of steel.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Defence +10.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ZENITHIUM, 2));
		ingredients.add(new Ingredient(Ingredient.RUBY, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		armour.add(new ObjectPage(
			Craftable.HERO_SHIELD,
			"The sacred shield of a hero of legend.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Defence +16.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ZENITHIUM, 3));
		ingredients.add(new Ingredient(Ingredient.RUBY, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 2));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.AURORAL_ARMOUR,
			"Illustrious armour blessed by benelovent Rubiss Herself.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Defence +30. Take no damage from poison or lava.",
		));

		List<Widget> _listRows = new List();
		_listRows.add(categoryHeader(ObjectType.items, itemColor));
		if (_openItems) {
			addListCategory(_listRows, items, context);
		}
		_listRows.add(categoryHeader(ObjectType.food, foodColor));
		if (_openFood) {
			addListCategory(_listRows, food, context);
		}
		_listRows.add(categoryHeader(ObjectType.light_source, lightSourceColor));
		if (_openLightSource) {
			addListCategory(_listRows, lightSource, context);
		}
		_listRows.add(categoryHeader(ObjectType.materials, materialsColor));
		if (_openMaterials) {
			addListCategory(_listRows, materials, context);
		}
		_listRows.add(categoryHeader(ObjectType.building_materials, buildingMaterialsColor));
		if (_openBuildingMaterials) {
			addListCategory(_listRows, buildingMaterials, context);
		}
		_listRows.add(categoryHeader(ObjectType.furniture, furnitureColor));
		if (_openFurniture) {
			addListCategory(_listRows, furniture, context);
		}
		_listRows.add(categoryHeader(ObjectType.crafting_station, craftingStationColor));
		if (_openCraftingStation) {
			addListCategory(_listRows, craftingStation, context);
		}
		_listRows.add(categoryHeader(ObjectType.weapon_tool, weaponToolColor));
		if (_openWeaponTool) {
			addListCategory(_listRows, weaponTool, context);
		}
		_listRows.add(categoryHeader(ObjectType.armour, armourColor));
		if (_openArmour) {
			addListCategory(_listRows, armour, context);
		}

		return Container(
			padding: EdgeInsets.symmetric(horizontal: 15.0),
			decoration: new BoxDecoration(
				image: new DecorationImage(image: AssetImage("assets/gamePic.jpg"), fit: BoxFit.cover)
			),
			child: Container(
				color: Colors.white54,
				child: ListView.builder(
					itemBuilder: (context, i){
						return _listRows[i];
					},
					itemCount: _listRows.length,
				),
			),
		);
	}

	Widget categoryHeader(ObjectType type, Color color) {
		String title;
		bool openDrawer;
		switch (type) {
			case ObjectType.items:
				title = "Items";
				openDrawer = _openItems;
				break;
			case ObjectType.food:
				title = "Food";
				openDrawer = _openFood;
				break;
			case ObjectType.light_source:
				title = "Light Source";
				openDrawer = _openLightSource;
				break;
			case ObjectType.materials:
				title = "Materials";
				openDrawer = _openMaterials;
				break;
			case ObjectType.building_materials:
				title = "Building Materials";
				openDrawer = _openBuildingMaterials;
				break;
			case ObjectType.furniture:
				title = "Furniture";
				openDrawer = _openFurniture;
				break;
			case ObjectType.crafting_station:
				title = "Crafting Station";
				openDrawer = _openCraftingStation;
				break;
			case ObjectType.weapon_tool:
				title = "Weapons/Tools";
				openDrawer = _openWeaponTool;
				break;
			case ObjectType.armour:
				title = "Armour";
				openDrawer = _openArmour;
				break;
			case ObjectType.other:
				title = "Other";
				openDrawer = _openArmour;
				break;
			case ObjectType.room:
				title = "Room Recipe";
				openDrawer = _openArmour;
				break;
		}
		return Container(
			color: color,
			child: ListTile(
				title: Text(title, style: header,),
				trailing: new Icon(
					openDrawer ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
					color: Colors.white,
					size: 40.0,
				),
				onTap: (){
					setState(() {
						switch (type) {
							case ObjectType.items:
								_openItems = !_openItems;
								break;
							case ObjectType.food:
								_openFood = !_openFood;
								break;
							case ObjectType.light_source:
								_openLightSource = !_openLightSource;
								break;
							case ObjectType.materials:
								_openMaterials = !_openMaterials;
								break;
							case ObjectType.building_materials:
								_openBuildingMaterials = !_openBuildingMaterials;
								break;
							case ObjectType.furniture:
								_openFurniture = !_openFurniture;
								break;
							case ObjectType.crafting_station:
								_openCraftingStation = !_openCraftingStation;
								break;
							case ObjectType.weapon_tool:
								_openWeaponTool = !_openWeaponTool;
								break;
							case ObjectType.armour:
								_openArmour = !_openArmour;
								break;
							case ObjectType.other:
								_openOther = !_openOther;
								break;
							case ObjectType.room:
								_openRoom = !_openRoom;
								break;
						}
					});
				},
			),
		);
	}

	void addListCategory(List<Widget> widgetList, List<ObjectPage> objectList, BuildContext context) {
		for (ObjectPage o in objectList) {
			if (o.objectName.toLowerCase().contains(_searchText)) {
				widgetList.add(
					Padding(
						padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
						child: Material(
							type: MaterialType.transparency,
							child: InkWell(
								highlightColor: Colors.grey,
								onTap: () {
									Navigator.push(
										context, SlideAndFadeRoute(widget: o));
								},
								child: Container(
									margin: EdgeInsets.only(left: 10.0, right: 25.0),
									padding: EdgeInsets.symmetric(
										horizontal: 10.0, vertical: 8.0),
									decoration: BoxDecoration(
										color: Colors.white,
										borderRadius: BorderRadius.all(
											Radius.circular(5.0)),
										border: Border.all(color: Colors.grey, width: 3.0)
									),
									child: Text(o.objectName, style: subheader,)),
							),
						),
					)
				);
			}
		}
	}

	void _searchPressed() {
		setState(() {
			if (!_searchBarShow) {
				_searchBarController.forward();
			} else {
				_searchBarController.reverse();
				_searchText = "";
				FocusScope.of(context).requestFocus(new FocusNode());
			}
			_searchBarShow = !_searchBarShow;
		});
	}

	Widget searchBar() {
		return SizeTransition(
			child: Container(
				color: Colors.grey.shade200,
				child: TextField(
					style: TextStyle(fontSize: 20, color: Colors.black),
					controller: _filter,
					decoration: new InputDecoration(
						hintStyle:
						TextStyle(inherit: false, fontSize: 20, color: Colors.black),
						prefixIcon: new Icon(
							Icons.search,
							color: Colors.black,
						),
						hintText: "Search...",
					),
					maxLength: 40,
					autocorrect: false,
					cursorColor: Colors.black87,
				),
			),
			sizeFactor:
			CurvedAnimation(parent: _searchBarController, curve: Curves.easeIn),
		);
	}
}