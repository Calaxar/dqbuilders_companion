import 'package:flutter/material.dart';
import 'universalClasses.dart';
import 'package:dqbuilders_companion/crafting.dart';

class RimuldarListPage extends StatefulWidget {
	@override
	_RimuldarListPageState createState() => _RimuldarListPageState();
}

class _RimuldarListPageState extends State<RimuldarListPage> with SingleTickerProviderStateMixin {
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
				backgroundColor: Colors.purple,
				title: Text("Rimuldar", style: Theme.of(context).textTheme.title,),
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
		ingredients.add(new Ingredient(Ingredient.STORM_STONE, 1));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 3));
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		items.add(new ObjectPage(
			Craftable.STAFF_OF_RAIN,
			"A sacred sceptre that calls down the blessed rains.",
			ingredients,
			Workstation.TRANSMUTATION,
			ObjectType.items,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HOLYHOCK, 5));
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		items.add(new ObjectPage(
			Craftable.DIVINE_DRAUGHT,
			"A consecrated concoction that can cure the incurable.",
			ingredients,
			Workstation.TRANSMUTATION,
			ObjectType.items,
			effect: "To be used when required.",
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
			Workstation.CARPENTER,
			ObjectType.items,
			effect: "Restores 30 HP.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MEDICINAL_LEAF, 1));
		ingredients.add(new Ingredient(Ingredient.STICKY_LIQUID, 1));
		ingredients.add(new Ingredient(Ingredient.PINK_PETALS, 1));
		items.add(new ObjectPage(
			Craftable.ANTIDOTAL_HERB,
			"A curative compound of antivenemous vegetation.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Cures the effects of poison.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CONFUSING_CLAW, 1));
		ingredients.add(new Ingredient(Ingredient.FROGSTOOL, 1));
		ingredients.add(new Ingredient(Ingredient.YELLOW_PETALS, 1));
		items.add(new ObjectPage(
			Craftable.DEFUDDLE_DROPS,
			"Pale little pills of mind-blowing bitterness.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Cures the effects of confusion.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PARALYSTINGER, 1));
		ingredients.add(new Ingredient(Ingredient.COD, 1));
		ingredients.add(new Ingredient(Ingredient.WHITE_PETALS, 1));
		items.add(new ObjectPage(
			Craftable.TINGLE_TABLET,
			"A big, black bolus that brings numb limbs back to life.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Cures the effects of paralysis.",
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
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.items,
			effect: "Allows you to fish in water. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 4));
		items.add(new ObjectPage(
			Craftable.RAKE,
			"A long, strong pole finished with a fan of pointed prongs.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.items,
			effect: "Tills earth blocks. Can be used repeatedly.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PUMICE_PIECES, 1));
		items.add(new ObjectPage(
			Craftable.THROWING_STONE,
			"A smooth stone suitable for slinging at faraway foes.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.items,
			effect: "Inflicts damage.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		items.add(new ObjectPage(
			Craftable.DIVINE_DAGGER,
			"A silver throwing knife suffused with saintly sorcery.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.items,
			effect: "Inflicts damage. Inflicts paralysis on undead monsters.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 1));
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		items.add(new ObjectPage(
			Craftable.KEY,
			"A shiny silver key perfect for picking a padlock.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.items,
			effect: "Allows you to open locked doors.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHEAT, 1));
		items.add(new ObjectPage(
			Craftable.WHEAT_SEED,
			"The tiny, golden seed from which great sheaves of grain are grown.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Plant in tilled earth to grow wheat.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HEARTFRUIT, 1));
		items.add(new ObjectPage(
			Craftable.HEARTFRUIT_SEED,
			"The heart-shaped seed of a heart-shaped fruit.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Plant in water to grow heartfruit plants.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BUTTERBEANS, 1));
		items.add(new ObjectPage(
			Craftable.BUTTERBEAN_SPROUT,
			"The soft and slippery sprout of a big, green bean.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Plant in tilled earth to grow butterbean plants.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.POTATO, 1));
		items.add(new ObjectPage(
			Craftable.POTATO_SPROUT,
			"The sprouting root of a sprouting root crop.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Plant in tilled earth to grow potato plants.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HOLYHOCK, 1));
		items.add(new ObjectPage(
			Craftable.HOLYHOCK_SEED,
			"The shining seed of a blessed blossom.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Plant in tilled earth to grow a holyhock flower.",
			score: 30,
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
		ingredients.add(new Ingredient(Ingredient.WHEAT, 3));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		food.add(new ObjectPage(
			Craftable.PORRIDGE,
			"A brimming bowl of gooey gruel.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 15%",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BUTTERBEANS, 3));
		food.add(new ObjectPage(
			Craftable.BOILED_BUTTERBEANS,
			"A simple snack of green beans boiled in the pod.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 10%",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHEAT, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.BAGUETTE,
			"A long loaf with a crispy crust and a soft, fluffy centre.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 50%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.POTATO, 5));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.FRIES,
			"A long loaf with a crispy crust and a soft, fluffy centre.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 25%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.POTATO, 1));
		ingredients.add(new Ingredient(Ingredient.MEDICINAL_LEAF, 1));
		food.add(new ObjectPage(
			Craftable.POTATO_SALAD,
			"A long loaf with a crispy crust and a soft, fluffy centre.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 30% and restores 20 HP.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.POTATO, 2));
		ingredients.add(new Ingredient(Ingredient.BUTTERBEANS, 2));
		ingredients.add(new Ingredient(Ingredient.WHEAT, 2));
		ingredients.add(new Ingredient(Ingredient.HEARTFRUIT, 1));
		ingredients.add(new Ingredient(Ingredient.COOKED_CRAB_CLAW, 1));
		ingredients.add(new Ingredient(Ingredient.MEDICINAL_LEAF, 1));
		food.add(new ObjectPage(
			Craftable.SUPER_SALAD,
			"A slap-up salad made from everything under the sun.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 80% and restores 50 HP.",
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
		ingredients.add(new Ingredient(Ingredient.CRAB_CLAW, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.COOKED_CRAB_CLAW,
			"A parboiled pincer cracked open for easy eating.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 40%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SALMON, 1));
		ingredients.add(new Ingredient(Ingredient.CRAB_CLAW, 1));
		ingredients.add(new Ingredient(Ingredient.WHEAT, 1));
		ingredients.add(new Ingredient(Ingredient.HEARTFRUIT, 1));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.BOUILLABAISSE,
			"A thick and hearty seafood bisque.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Completely fills hunger meter and increases defence for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RED_SNAPPER, 1));
		ingredients.add(new Ingredient(Ingredient.TUNA, 1));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.SAILORS_STEW,
			"A hearty hotpot that\'s full of fishy goodness.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Completely fills hunger meter and increases defence for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SARDINE, 1));
		ingredients.add(new Ingredient(Ingredient.SALMON, 1));
		ingredients.add(new Ingredient(Ingredient.RED_SNAPPER, 1));
		ingredients.add(new Ingredient(Ingredient.TUNA, 1));
		food.add(new ObjectPage(
			Craftable.FRESH_FISH_FEAST,
			"A sumptuous selection of sliced seafood, served raw.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Completely fills hunger meter and increases attack power for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SALMON, 1));
		ingredients.add(new Ingredient(Ingredient.BIGONIA_LEAF, 1));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		food.add(new ObjectPage(
			Craftable.SAUTEED_SALMON,
			"A salmon steak served on a bed of bigonia leaves.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 50% and increases defence for a short time.",
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
			Workstation.CARPENTER,
			ObjectType.light_source,
			effect: "Light source.",
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		ingredients.add(new Ingredient(Ingredient.SILVERY_SLUDGE, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		lightSource.add(new ObjectPage(
			Craftable.NAUGHTY_NIGHT_LIGHT,
			"A light-hearted lamp imbued with an alluring ambience.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.light_source,
			effect: "Light source. Heats things up when placed in a room.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PALM_LUMBER, 1));
		materials.add(new ObjectPage(
			Craftable.WOOD,
			"A perfectly planed plank of stripped and sawn lumber.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IVY, 3));
		materials.add(new ObjectPage(
			Craftable.CORD,
			"A coil of cord constructed from tightly twined vine.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FIBROUS_FROND, 2));
		materials.add(new ObjectPage(
			Craftable.FIBROUS_FABRIC,
			"A coarse cloth woven from fern fibre.",
			ingredients,
			Workstation.SEWING,
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
		ingredients.add(new Ingredient(Ingredient.SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.STICKY_LIQUID, 1));
		materials.add(new ObjectPage(
			Craftable.LIQUID_SILVER,
			"An argent alloy that can be cast to make metal objects.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.materials,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STRONG_STALKS, 3));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAW_DOOR,
			"A primitive door made of sticks and stew.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.WOODEN_DOOR,
			"A durable door made from wooden planks reinforced with iron.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		buildingMaterials.add(new ObjectPage(
			Craftable.FENCING,
			"A stockade of stakes designed to keep beasts at bay.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		buildingMaterials.add(new ObjectPage(
			Craftable.WOODEN_WALL,
			"A block of perfectly planed wooden planks.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOODEN_WALL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.WOODEN_CLADDING,
			"A covering that adds class to any earthen wall.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into wooden wall blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		buildingMaterials.add(new ObjectPage(
			Craftable.WOODEN_FLOOR,
			"Planed and polished lumber formed into flush-fitting floorboards.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.ROOF_TILING,
			"A sheet of slate tiles used to build flat roofs.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.PITCHED_TILING,
			"A sheet of tilted tiles used to build pitched roofs.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.OUTER_CORNER_TILING,
			"A convex sheet of tiles used to build the outer edges of pitched roofs.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.INNER_CORNER_TILING,
			"A concave sheet of tiles used to build the outer edges of pitched roofs.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		ingredients.add(new Ingredient(Ingredient.CORD, 3));
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		furniture.add(new ObjectPage(
			Craftable.BALLISTA,
			"A colossal crossbow that fires with such force that it needs to be fixed to the floor.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be fired after placing by pressing the action button.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STRONG_STALKS, 3));
		furniture.add(new ObjectPage(
			Craftable.STRAW_MATTRESS,
			"Basic bedding made from dried weeds woven together.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be slept on.",
			score: 30,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		ingredients.add(new Ingredient(Ingredient.COTTON, 1));
		furniture.add(new ObjectPage(
			Craftable.SIMPLE_BED,
			"A wooden frame with a comfy cotton mattress on top.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be slept on.",
			score: 80,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		furniture.add(new ObjectPage(
			Craftable.CHEST,
			"Branches bundled together to form a stout strongbox.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		furniture.add(new ObjectPage(
			Craftable.SMALL_TABLE,
			"The finest timber carefully carved into a small, square table.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.COTTON, 1));
		furniture.add(new ObjectPage(
			Craftable.COMFY_STOOL,
			"A chair crowned with a cosy cushion, perfect for a painful posterior.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.WOODEN_MEMORIAL,
			"A modest monument memorialising a life lived and lost.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.WASHTUB,
			"A watertight wooden tub used to scoop up water.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PINK_PETALS, 3));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		furniture.add(new ObjectPage(
			Craftable.POT_PLANT,
			"An attractive arrangement of pretty, pink flowers.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 100,
		));


		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 5));
		ingredients.add(new Ingredient(Ingredient.PUMICE_PIECES, 5));
		ingredients.add(new Ingredient(Ingredient.COTTON, 3));
		ingredients.add(new Ingredient(Ingredient.BIGONIA_LEAF, 2));
		furniture.add(new ObjectPage(
			Craftable.FILTER_FOUNTAIN,
			"A percolating pump that purifies polluted water.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Place in water to activate.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		furniture.add(new ObjectPage(
			Craftable.INN_SIGN,
			"A sign that shows guests are welcome to stay the night.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "When placed inside a room, can be used to assign it to a female resident.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SLIME_SKIN, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.SLIME_BALLOONS,
			"A bunch of buoyant balloons shaped like lovely little slimes.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 500,
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
		ingredients.add(new Ingredient(Ingredient.BREAD, 2));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		furniture.add(new ObjectPage(
			Craftable.BREADBASKET,
			"Fresh-baked baguettes with an appetizing aroma in a rustic arrangement.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.furniture,
			effect: "Cannot be eaten.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SILVER, 5));
		furniture.add(new ObjectPage(
			Craftable.LYRE_SLIME,
			"An eccentric instrument that brings back memories of a bygone age. [Unlocked by completing a challenge.]",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Press [action button] after placing to activate.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 8));
		craftingStation.add(new ObjectPage(
			Craftable.CARPENTERS_WORKSTATION,
			"A wooden workbench with a frame fashioned from planks.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Can be used to build various items and weapons.",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.EARTH, 8));
		ingredients.add(new Ingredient(Ingredient.CLAY, 5));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		craftingStation.add(new ObjectPage(
			Craftable.HERBALISTS_CAULDRON,
			"A bubbling basin used to brew medicines.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Can be used to craft medicines and other items.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		ingredients.add(new Ingredient(Ingredient.COTTON, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 3));
		craftingStation.add(new ObjectPage(
			Craftable.SEWING_STATION,
			"A device that can turn all manner of materials into all manner of materials.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Can be used to craft clothes and other cloth items.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		ingredients.add(new Ingredient(Ingredient.STRONG_STALKS, 3));
		ingredients.add(new Ingredient(Ingredient.BONFIRE, 1));
		craftingStation.add(new ObjectPage(
			Craftable.COOKFIRE,
			"A simple stand built above a bonfire, used for making mouth-watering meals.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Light source. Can be used to cook food.",
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COOKFIRE, 1));
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 5));
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		craftingStation.add(new ObjectPage(
			Craftable.BRICK_BARBECUE,
			"The brick barrier focuses the flame to create an ideal toasting temperature.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Light source. Can be used to cook food.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.HERBALISTS_CAULDRON, 1));
		ingredients.add(new Ingredient(Ingredient.STONE, 5));
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		craftingStation.add(new ObjectPage(
			Craftable.TRANSMUTATION_TABLE,
			"A peculiar platform used in the arcane art of alchemy.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Can be used to craft medicines.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		weaponTool.add(new ObjectPage(
			Craftable.SHOVEL,
			"A simple spade with a pointed blade.",
			ingredients,
			Workstation.SEWING,
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
			Workstation.CARPENTER,
			ObjectType.weapon_tool,
			effect: "Attack +5.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		weaponTool.add(new ObjectPage(
			Craftable.IRON_BROADSWORD,
			"A strong sword forged from iron.",
			ingredients,
			Workstation.SEWING,
			ObjectType.weapon_tool,
			effect: "Attack +26.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 1));
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		weaponTool.add(new ObjectPage(
			Craftable.FALCON_BLADE,
			"A feather-light falchion that strikes like a swooping hawk.",
			ingredients,
			Workstation.SEWING,
			ObjectType.weapon_tool,
			effect: "Attack +25. Strikes twice with each attack.",
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
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		weaponTool.add(new ObjectPage(
			Craftable.STONE_AXE,
			"A crude cleaver with a stone-hewn head.",
			ingredients,
			Workstation.SEWING,
			ObjectType.weapon_tool,
			effect: "Attack +14. Can break hard blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		weaponTool.add(new ObjectPage(
			Craftable.IRON_AXE,
			"A heavy metal hatchet with a wooden handle.",
			ingredients,
			Workstation.SEWING,
			ObjectType.weapon_tool,
			effect: "Attack +30. Can break very hard blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 1));
		armour.add(new ObjectPage(
			Craftable.RAGGED_RAGS,
			"A torn and tattered tunic that provides paltry protection.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.armour,
			effect: "Defence +5. Slightly increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FIBROUS_FABRIC, 1));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.TRAINING_TOGS,
			"A uniform of flexible fabric that makes a movement a breeze.",
			ingredients,
			Workstation.SEWING,
			ObjectType.armour,
			effect: "Defence +12. Slightly increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FIBROUS_FABRIC, 1));
		ingredients.add(new Ingredient(Ingredient.COTTON, 2));
		ingredients.add(new Ingredient(Ingredient.SAPPHIRE, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.CLOAK_OF_EVASION,
			"Artful attire that lends its wearer a certain speediness.",
			ingredients,
			Workstation.SEWING,
			ObjectType.armour,
			effect: "Defence +20. Slightly increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.BEWAREWOLF_PELT, 2));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.CHAINMAIL,
			"A cushioned coat made from interlocking loops of silver.",
			ingredients,
			Workstation.SEWING,
			ObjectType.armour,
			effect: "Defence +16.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FUR, 2));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		armour.add(new ObjectPage(
			Craftable.LEATHER_SHIELD,
			"A basic buckler hardened with hide.",
			ingredients,
			Workstation.SEWING,
			ObjectType.armour,
			effect: "Defence +2.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 10));
		ingredients.add(new Ingredient(Ingredient.SAPPHIRE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		armour.add(new ObjectPage(
			Craftable.SILVER_SHIELD,
			"A bejewelled buckler buffed to a silvery sheen.",
			ingredients,
			Workstation.SEWING,
			ObjectType.armour,
			effect: "Defence +13.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.GOLD, 2));
		ingredients.add(new Ingredient(Ingredient.ANTIDOTAL_HERB, 3));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		armour.add(new ObjectPage(
			Craftable.RING_OF_IMMUNITY,
			"A ring imbued with a bane-busting blessing.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.armour,
			effect: "Protects against poison.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.TINGLE_TABLET, 3));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		armour.add(new ObjectPage(
			Craftable.FULL_MOON_RING,
			"A celestial sphere embedded in a bright band.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.armour,
			effect: "Protects against paralysis.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SILVER, 10));
		ingredients.add(new Ingredient(Ingredient.GOLD, 3));
		ingredients.add(new Ingredient(Ingredient.DEFUDDLE_DROPS, 1));
		ingredients.add(new Ingredient(Ingredient.TINGLE_TABLET, 1));
		ingredients.add(new Ingredient(Ingredient.ANTIDOTAL_HERB, 1));
		armour.add(new ObjectPage(
			Craftable.CATHOLICON_RING,
			"An almighty accessory that guards against all ills.",
			ingredients,
			Workstation.TRANSMUTATION,
			ObjectType.armour,
			effect: "Protects against all status ailments.",
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
								highlightColor: Colors.purple,
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