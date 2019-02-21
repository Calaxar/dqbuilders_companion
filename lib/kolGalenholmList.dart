import 'package:flutter/material.dart';
import 'universalClasses.dart';
import 'package:dqbuilders_companion/crafting.dart';

class KolGalenholmListPage extends StatefulWidget {
	@override
	_KolGalenholmListPageState createState() => _KolGalenholmListPageState();
}

class _KolGalenholmListPageState extends State<KolGalenholmListPage> with SingleTickerProviderStateMixin {
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
			appBar: AppBar(
				backgroundColor: Colors.blueAccent,
				title: Text("Kol & Galenholm", style: Theme.of(context).textTheme.title,),
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
		ingredients.add(new Ingredient(Ingredient.CRACKED_CRYSTAL, 1));
		ingredients.add(new Ingredient(Ingredient.LAVA, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 1));
		items.add(new ObjectPage(
			Craftable.SUNSTONE,
			"A divine jewel that shines like the summer sun.",
			ingredients,
			Workstation.WELDER,
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
			Workstation.MINER,
			ObjectType.items,
			effect: "Restores 30 HP.",
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
			Workstation.MINER,
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
			Workstation.MINER,
			ObjectType.items,
			effect: "Allows you to fish in water. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.VULCOVOLTAIC_MOTOR, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 8));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 5));
		items.add(new ObjectPage(
			Craftable.BASHMOBILE,
			"A spiked trike that can move at scary speeds.",
			ingredients,
			Workstation.WELDER,
			ObjectType.items,
			effect: "Can be ridden to increase movement speed. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		items.add(new ObjectPage(
			Craftable.WOODEN_MINECART,
			"A classic cart with a frame fashioned from wood.",
			ingredients,
			Workstation.WELDER,
			ObjectType.items,
			effect: "Can be used to ride on track. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		items.add(new ObjectPage(
			Craftable.METAL_MINECART,
			"A cast-iron cart that\'s tougher than its timber cousin.",
			ingredients,
			Workstation.WELDER,
			ObjectType.items,
			effect: "Can be used to ride on track. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LAVA, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		items.add(new ObjectPage(
			Craftable.SIZZ_SHOT,
			"A burning bullet imbued with magmatic might.",
			ingredients,
			Workstation.WELDER,
			ObjectType.items,
			effect: "Inflicts damage on enemies.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ICE, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		items.add(new ObjectPage(
			Craftable.CRACK_SHOT,
			"A blistering bullet imbued with polar might.",
			ingredients,
			Workstation.WELDER,
			ObjectType.items,
			effect: "Inflicts damage on enemies.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_LYRE, 1));
		ingredients.add(new Ingredient(Ingredient.LYRE_STRING, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 3));
		items.add(new ObjectPage(
			Craftable.LYRE_IRE,
			"The lyre of legend that fills the air with cords of crystal clarity.",
			ingredients,
			Workstation.WELDER,
			ObjectType.items,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SQUID, 1));
		food.add(new ObjectPage(
			Craftable.SQUID_ON_A_STICK,
			"The meaty mantle of a marine mollusc sizzled on a skewer.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 20%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SARDINE, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.SARDINE_ON_A_STICK,
			"A single sardine skewered and seared over an open flame.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 30%.",
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
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.HOT_WATER, 1));
		food.add(new ObjectPage(
			Craftable.CODDLED_EGG,
			"Gently poached in warm water and served while still soft.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 30%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CACTUS_CUTLET, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.CACTUS_STEAK,
			"A fragrant and filling fillet of flame-grilled cactus.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 40%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MEAT, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.BUNICORN_STEAK,
			"A rabbity rib-eye roasted right over the coals.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 20% and increases attack power for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HARELOIN_STEAK, 1));
		ingredients.add(new Ingredient(Ingredient.CHILLI_PEPPERS, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.SEARING_STEAK,
			"A flaming fillet the fills its eater with energy.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 50% and increases attack power for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHEAT, 1));
		ingredients.add(new Ingredient(Ingredient.SUGARCANE, 1));
		food.add(new ObjectPage(
			Craftable.GUNGERBREAD,
			"Slime-shaped biscuits with a chewy, gooey centre.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 20% and restores 10 HP.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHEAT, 2));
		ingredients.add(new Ingredient(Ingredient.DRACKY_BUTTER, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.PANCAKES,
			"Soft and sugary hotcakes bathed in butter.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 60%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHEAT, 2));
		ingredients.add(new Ingredient(Ingredient.SUGARCANE, 1));
		ingredients.add(new Ingredient(Ingredient.DRACKY_BUTTER, 1));
		ingredients.add(new Ingredient(Ingredient.HEARTFRUIT, 1));
		food.add(new ObjectPage(
			Craftable.HEARTY_CREAM_CAKE,
			"A succulent sponge cake smothered in whipped cream.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 80%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SNOW, 1));
		ingredients.add(new Ingredient(Ingredient.SUGARCANE, 1));
		ingredients.add(new Ingredient(Ingredient.DRACKY_BUTTER, 1));
		food.add(new ObjectPage(
			Craftable.ICE_CREAM,
			"Buttery custard cooled to form a frozen ambrosia.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 20% and restores 50 HP.",
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
		ingredients.add(new Ingredient(Ingredient.TORCH, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		lightSource.add(new ObjectPage(
			Craftable.SCONCE,
			"A copper cradle that keeps the torch attached to the wall.",
			ingredients,
			Workstation.MINER,
			ObjectType.light_source,
			effect: "Light source.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 2));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		lightSource.add(new ObjectPage(
			Craftable.BONFIRE,
			"A big bundle of branches that burns brightly.",
			ingredients,
			Workstation.MINER,
			ObjectType.light_source,
			effect: "Light source.",
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		lightSource.add(new ObjectPage(
			Craftable.BRAZIER,
			"A blazing bowl of fire that illuminates everything around it.",
			ingredients,
			Workstation.MINER,
			ObjectType.light_source,
			effect: "Light source.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 1));
		lightSource.add(new ObjectPage(
			Craftable.LANTERN,
			"A bright light powered by a mysterious mechanism.",
			ingredients,
			Workstation.WELDER,
			ObjectType.light_source,
			effect: "Light source.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CEDAR_LUMBER, 1));
		materials.add(new ObjectPage(
			Craftable.WOOD,
			"A perfectly planed plank of stripped and sawn lumber.",
			ingredients,
			Workstation.MINER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IVY, 3));
		materials.add(new ObjectPage(
			Craftable.CORD,
			"A coil of cord constructed from tightly twined vine.",
			ingredients,
			Workstation.MINER,
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
		ingredients.add(new Ingredient(Ingredient.COPPER, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		materials.add(new ObjectPage(
			Craftable.COPPER_INGOT,
			"A big brown bar of cast copper.",
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
		ingredients.add(new Ingredient(Ingredient.CURIOUS_CONTRAPTION, 1));
		ingredients.add(new Ingredient(Ingredient.POWER_CRYSTAL, 3));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 5));
		materials.add(new ObjectPage(
			Craftable.VULCOVOLTAIC_MAGIMOTOR,
			"A complicated component made of metal and machinery.",
			ingredients,
			Workstation.WELDER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MYTHRIL, 3));
		ingredients.add(new Ingredient(Ingredient.POWER_CRYSTAL, 1));
		materials.add(new ObjectPage(
			Craftable.MAGIC_INGOT,
			"A mass of magically modified mythril.",
			ingredients,
			Workstation.WELDER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MECHROCHIP, 5));
		ingredients.add(new Ingredient(Ingredient.FLAME_ORB, 3));
		ingredients.add(new Ingredient(Ingredient.FROST_ORB, 3));
		materials.add(new ObjectPage(
			Craftable.POWER_CRYSTAL,
			"A crystal containing an elemental energy.",
			ingredients,
			Workstation.WELDER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		materials.add(new ObjectPage(
			Craftable.SPRING,
			"A corkscrew coil of compressible material.",
			ingredients,
			Workstation.WELDER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LAVA, 3));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		materials.add(new ObjectPage(
			Craftable.THERMOBATTERY,
			"A fiery fuel cell that produces a prodigous amount of power.",
			ingredients,
			Workstation.WELDER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SANDGRASS, 3));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAW_DOOR,
			"A primitive door made of sticks and stew.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.WOODEN_DOOR,
			"A durable door made from wooden planks reinforced with iron.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.SALOON_DOOR,
			"Pianos stop playing when these trendy timber doors swing open.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SANDGRASS, 5));
		ingredients.add(new Ingredient(Ingredient.CORD, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAW_FLOOR,
			"Dried grass tied together to create a cushiony floor covering.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			score: 5,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STRAW_FLOOR, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAW_FLOORING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			effect: "Changes nearby earth floors into straw floor blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STONE_STEPS,
			"A staircase sculpted from solid stone.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			score: 20,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.WINDOW,
			"A window made from sticks and some strange, see-through stuff.",
			ingredients,
			Workstation.MINER,
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
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.STONE_WALL,
			"A block of massy MINERry made of intricately interlocked rocks. Brilliant for building stout stone walls.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE_WALL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STONE_CLADDING,
			"A covering that adds class to any earthen wall.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into stone wall blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.FLAGSTONE,
			"Rough rocks smoothed flat and fused flush, form this old-fashioned flooring.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FLAGSTONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.FLAGSTONE_FLOORING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			effect: "Changes nearby earth floors into flagstone blocks.",
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 5));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.PURPLE_FLAGSTONE,
			"Cobblestones cobbled together then painted purple.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PURPLE_FLAGSTONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.PURPLE_FLAGSTONE_FLOORING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into purple flagstone blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 5));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.BLUE_FLAGSTONE,
			"Cobblestones cobbled together then dipped in blue dye.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLUE_FLAGSTONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BLUE_FLAGSTONE_FLOORING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into blue flagstone blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 3));
		ingredients.add(new Ingredient(Ingredient.SPRING, 5));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.PISTON,
			"A booby-trapped box fitted with a powerful propulsive paddle.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			effect: "Forcefully pushes away any monster or person it hits.",
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.SPRING, 3));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.PRESSURE_PLATE,
			"A simple switch that sets off any appliances in the local area.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			effect: "Activates nearby traps and armaments when stepped on.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.SPRING, 3));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.BUTTON,
			"A big red button that activates any appliances in the local area.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			effect: "Activates nearby traps and armaments when pressed.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAIGHT_TRACK,
			"A straight section of rails and sleepers for carts to career along.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CURVED_TRACK,
			"A curved section of rails and sleepers for carts to career along.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.SLOPED_TRACK,
			"A sloped section of rails and sleepers for carts to career along.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.END_OF_LINE_SIGN,
			"When you see this sign, it\'s the end of the line.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ICE, 3));
		ingredients.add(new Ingredient(Ingredient.POWER_CRYSTAL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.BLUE_BLOCK,
			"A chunk of chalk dyed a bright blue.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 5));
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 3));
		furniture.add(new ObjectPage(
			Craftable.CANNON,
			"Artillery for hurling huge metal missiles massive distances.",
			ingredients,
			Workstation.WELDER,
			ObjectType.furniture,
			effect: "Can be fired after placing by pressing the action button.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CANNON, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 3));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 3));
		furniture.add(new ObjectPage(
			Craftable.MAGIC_CANNON,
			"A magical mortar that blasts foes with a concussive Kaboom.",
			ingredients,
			Workstation.WELDER,
			ObjectType.furniture,
			effect: "Can be fired after placing by pressing the action button.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SANDGRASS, 3));
		furniture.add(new ObjectPage(
			Craftable.STRAW_MATTRESS,
			"Basic bedding made from dried weeds woven together.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			effect: "Can be slept on.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.POWIE_YOWIE_FUR, 1));
		furniture.add(new ObjectPage(
			Craftable.KING_SIZED_BED,
			"A bed of princely proportions, with plenty of space to roll around in.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			effect: "Can be slept on.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		furniture.add(new ObjectPage(
			Craftable.CHEST,
			"Branches bundled together to form a stout strongbox.",
			ingredients,
			Workstation.MINER,
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
			Workstation.MINER,
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
			Workstation.MINER,
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
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 2));
		furniture.add(new ObjectPage(
			Craftable.BEER_BARREL,
			"A round recepticle best suited for storing beverages.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		furniture.add(new ObjectPage(
			Craftable.WOODEN_STOOL,
			"A simple stool crafted from carefully whittled wood.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 80,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.BENCH,
			"A long, wooden seat that’s perfect for placing in a park.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.WASHTUB,
			"A watertight wooden tub used to scoop up water.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		ingredients.add(new Ingredient(Ingredient.LAVA, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 1));
		furniture.add(new ObjectPage(
			Craftable.FIERCE_FOUNTAIN,
			"A corner carving featuring the face of a ferocious feline.",
			ingredients,
			Workstation.WELDER,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.BAR_COUNTER,
			"A classy counter for a stylish saloon.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FUR, 1));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		furniture.add(new ObjectPage(
			Craftable.TOWEL_RAIL,
			"A wall-mounted rail with a towel attached.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.DUMB_BELLS,
			"Heavy hunks of iron used by bodybuilders to beef up ther biceps.",
			ingredients,
			Workstation.FORGE,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FREEZIA_FLOWER, 5));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		furniture.add(new ObjectPage(
			Craftable.BOOK,
			"A hardback book full of swashbuckling stories and useful information.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 20,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.BOOK, 3));
		furniture.add(new ObjectPage(
			Craftable.BOOKCASE,
			"A simple set of shelves loaded with literature.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		furniture.add(new ObjectPage(
			Craftable.INN_SIGN,
			"A sign that shows guests are welcome to stay the night.",
			ingredients,
			Workstation.MINER,
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
			Workstation.MINER,
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
			Workstation.MINER,
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
			Workstation.MINER,
			ObjectType.furniture,
			effect: "When placed inside a room, can be used to assign it to a female resident.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.ORNAMENTAL_SWORDS,
			"These swords might be crummy in combat, but they’re lovely to look at.",
			ingredients,
			Workstation.FORGE,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		furniture.add(new ObjectPage(
			Craftable.ORNAMENTAL_ARMOUR,
			"Armour designed for decoration, not defence.",
			ingredients,
			Workstation.FORGE,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		furniture.add(new ObjectPage(
			Craftable.ARMOURERS_SIGN,
			"A sign that shows a shop sells weapons.",
			ingredients,
			Workstation.FORGE,
			ObjectType.furniture,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ARMOURERS_SIGN, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.HELAS_HAMMER_SIGN,
			"A big, wooden board with a huge hammer carved into it.",
			ingredients,
			Workstation.FORGE,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CLAY, 5));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		furniture.add(new ObjectPage(
			Craftable.CROCKERY,
			"Glazed tableware made from kiln-fired clay.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.furniture,
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SEARING_STEAK, 1));
		ingredients.add(new Ingredient(Ingredient.CROCKERY, 1));
		furniture.add(new ObjectPage(
			Craftable.MEAT_FEAST,
			"A serving of finely sliced steak with all the trimmings.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.furniture,
			effect: "Cannot be eaten.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HEARTY_CREAM_CAKE, 1));
		ingredients.add(new Ingredient(Ingredient.CROCKERY, 1));
		furniture.add(new ObjectPage(
			Craftable.TEA_SERVICE,
			"A delicate and dainty table setting ideal for afternoon tea.",
			ingredients,
			Workstation.BRICK,
			ObjectType.furniture,
			effect: "Cannot be eaten.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SILVER, 5));
		furniture.add(new ObjectPage(
			Craftable.LYRE_SLIME,
			"An eccentric instrument that brings back memories of a bygone age. [Unlocked by completing a challenge.]",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			effect: "Press [action button] after placing to activate.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		craftingStation.add(new ObjectPage(
			Craftable.MINERS_REFINER,
			"Prized by prospectors for its shaping, sorting and sifting capabilities.",
			ingredients,
			Workstation.MINER,
			ObjectType.crafting_station,
			effect: "Can be used to build tools and weapons.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 8));
		ingredients.add(new Ingredient(Ingredient.LAVA, 3));
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		craftingStation.add(new ObjectPage(
			Craftable.WELDERS_WORKBENCH,
			"A technical table designed for assembling simple machines.",
			ingredients,
			Workstation.MINER,
			ObjectType.crafting_station,
			effect: "Can be used to build basic mechanical items.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		ingredients.add(new Ingredient(Ingredient.SANDGRASS, 3));
		ingredients.add(new Ingredient(Ingredient.BONFIRE, 1));
		craftingStation.add(new ObjectPage(
			Craftable.COOKFIRE,
			"A simple stand built above a bonfire, used for making mouth-watering meals.",
			ingredients,
			Workstation.MINER,
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
			Workstation.MINER,
			ObjectType.crafting_station,
			effect: "Light source. Can be used to cook food.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 8));
		ingredients.add(new Ingredient(Ingredient.COPPER, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 3));
		craftingStation.add(new ObjectPage(
			Craftable.FORGE,
			"A sturdy stone smithy hot enough to melt almost anything.",
			ingredients,
			Workstation.MINER,
			ObjectType.crafting_station,
			effect: "Can be used to build metallic items and weapons.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		weaponTool.add(new ObjectPage(
			Craftable.SHOVEL,
			"A simple spade with a pointed blade.",
			ingredients,
			Workstation.MINER,
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
			Workstation.MINER,
			ObjectType.weapon_tool,
			effect: "Attack +5.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		weaponTool.add(new ObjectPage(
			Craftable.STONE_SWORD,
			"A sword of honed stone with a wooden pommel.",
			ingredients,
			Workstation.MINER,
			ObjectType.weapon_tool,
			effect: "Attack +11.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		weaponTool.add(new ObjectPage(
			Craftable.COPPER_SWORD,
			"A simple sword with a blade of beaten copper.",
			ingredients,
			Workstation.FORGE,
			ObjectType.weapon_tool,
			effect: "Attack +16.",
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
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT , 1));
		weaponTool.add(new ObjectPage(
			Craftable.AURORA_BLADE,
			"Made from a mysterious metal that shines like the sun.",
			ingredients,
			Workstation.WELDER,
			ObjectType.weapon_tool,
			effect: "Attack +40. Enchanted with magic.",
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
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 1));
		weaponTool.add(new ObjectPage(
			Craftable.HELAS_HAMMER,
			"A steel sledgehammer so heavy that only the strongest soldiers can hold it.",
			ingredients,
			Workstation.WELDER,
			ObjectType.weapon_tool,
			effect: "Attack +43. Can break very hard blocks. Enchanted with magic.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 1));
		armour.add(new ObjectPage(
			Craftable.RAGGED_RAGS,
			"A torn and tattered tunic that provides paltry protection.",
			ingredients,
			Workstation.MINER,
			ObjectType.armour,
			effect: "Defence +1.",
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
			Workstation.MINER,
			ObjectType.armour,
			effect: "Defence +5. Slightly increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FUR, 3));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.LEATHER_ARMOUR,
			"A sturdy, studded suit of hardened hide.",
			ingredients,
			Workstation.MINER,
			ObjectType.armour,
			effect: "Defence +9.",
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
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.FACE_GUARD_FRAGMENT, 2));
		ingredients.add(new Ingredient(Ingredient.SCORPION_HORN, 2));
		ingredients.add(new Ingredient(Ingredient.FUR, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.SPIKED_ARMOUR,
			"Barbarous barbed armour adorned with thorns.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Defence +21. Reflects 50% of damage taken back towards enemies.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.POWIE_YOWIE_FUR, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.MAGIC_ARMOUR,
			"Gaudy green armour made from a magical metal.",
			ingredients,
			Workstation.WELDER,
			ObjectType.armour,
			effect: "Defence +25. Reduces damage taken from indirect attacks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FUR, 2));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		armour.add(new ObjectPage(
			Craftable.LEATHER_SHIELD,
			"A basic buckler hardened with hide.",
			ingredients,
			Workstation.MINER,
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
		ingredients.add(new Ingredient(Ingredient.MAGIC_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		armour.add(new ObjectPage(
			Craftable.MAGIC_SHIELD,
			"A light and luminous shield made from a magical metal.",
			ingredients,
			Workstation.WELDER,
			ObjectType.armour,
			effect: "Defence +10. Reduces damage taken from indirect attacks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CELESTIAL_SKEIN, 3));
		ingredients.add(new Ingredient(Ingredient.POWIE_YOWIE_FUR, 5));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.FLOWING_DRESS,
			"A beautiful blue robe that flows like water.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Defence +26. Reduces damage taken from lava.",
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
								highlightColor: Colors.blueAccent,
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