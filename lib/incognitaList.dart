import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'universalClasses.dart';
import 'package:dqbuilders_companion/crafting.dart';

class IncognitaListPage extends StatefulWidget {

	final Duration duration = Duration(milliseconds: 500);

	@override
	_IncognitaListPageState createState() => _IncognitaListPageState();
}

class _IncognitaListPageState extends State<IncognitaListPage> with TickerProviderStateMixin {

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
				backgroundColor: Colors.yellow.shade600,
				title: Text("Terra Incognita", style: Theme.of(context).textTheme.title,),
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
		List<ObjectPage> other = new List();
		List<ObjectPage> rooms = new List();

		List<Ingredient> ingredients = new List();
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
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		ingredients.add(new Ingredient(Ingredient.PLUMBERRY, 5));
		ingredients.add(new Ingredient(Ingredient.COAL, 5));
		items.add(new ObjectPage(
			Craftable.SPRINGTIDE_SPRINKLES,
			"Pretty powder that prepares parks for the picnic period.",
			ingredients,
			Workstation.MASON,
			ObjectType.items,
			effect: "Changes nearby trees into cherry blossom trees and earth floors into straw floor blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BONES, 1));
		ingredients.add(new Ingredient(Ingredient.WHITE_PETALS, 1));
		ingredients.add(new Ingredient(Ingredient.EARTH, 1));
		items.add(new ObjectPage(
			Craftable.FAERIE_FERTILISER,
			"Magical manure that speeds seedling\'s growth.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Use in Terra Incognita to make plants grow.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		ingredients.add(new Ingredient(Ingredient.PLUMBERRY, 5));
		ingredients.add(new Ingredient(Ingredient.COAL, 5));
		items.add(new ObjectPage(
			Craftable.CONFETTI,
			"Small squares of colourful crêpe paper.",
			ingredients,
			Workstation.MASON,
			ObjectType.items,
			effect: "Can be used repeatedly.",
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
			Workstation.HERBALIST,
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
		ingredients.add(new Ingredient(Ingredient.SIZZ_SHOT, 20));
		ingredients.add(new Ingredient(Ingredient.CRACK_SHOT, 20));
		items.add(new ObjectPage(
			Craftable.KABOOM_SHOT,
			"A bombastic bullet imbued with explosive might.",
			ingredients,
			Workstation.WELDER,
			ObjectType.items,
			effect: "Inflicts damage on enemies.",
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
		ingredients.add(new Ingredient(Ingredient.SUGARCANE, 1));
		items.add(new ObjectPage(
			Craftable.SUGARCANE_SEEDLING,
			"The sweet little seedling of a sugarcane plant.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.items,
			effect: "Plant in water to grow sugarcane plants.",
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
		ingredients.add(new Ingredient(Ingredient.MARSHROOMS, 1));
		food.add(new ObjectPage(
			Craftable.SHROOMS_ON_A_STICK,
			"A scrumptious skewer of barbequed marshrooms.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 20%",
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
		ingredients.add(new Ingredient(Ingredient.FROG, 1));
		food.add(new ObjectPage(
			Craftable.FRIED_FROG_MEAT,
			"Sweet and smoky frog\'s thighs frazzled over a fire.",
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
		ingredients.add(new Ingredient(Ingredient.MEDICINAL_LEAF, 1));
		ingredients.add(new Ingredient(Ingredient.PLUMBERRY, 1));
		food.add(new ObjectPage(
			Craftable.FRUIT_SALAD,
			"A piquant plate of fresh fruit and veg.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.food,
			effect: "Fills hunger meter by 20% and restores 10 HP.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHEAT, 10));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.BREAD,
			"A loaf of leavened bread baked until brown.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 15%.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BREAD, 1));
		ingredients.add(new Ingredient(Ingredient.BUNICORN_STEAK, 1));
		food.add(new ObjectPage(
			Craftable.BUNNY_BURGER,
			"A succulent steak sandwiched between two bits of bread.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 80% and increases attack power for a short time.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BREAD, 1));
		ingredients.add(new Ingredient(Ingredient.BUNICORN_STEAK, 1));
		ingredients.add(new Ingredient(Ingredient.BOILED_BUTTERBEANS, 1));
		food.add(new ObjectPage(
			Craftable.BEANY_BUNNY_BURGER,
			"An energizing bunny burger that’ll make you feel full of beans.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Completely fills hunger meter and increases attack power for a short time.",
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
		ingredients.add(new Ingredient(Ingredient.BUTTERBEANS, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.BUTTERMILK,
			"A creamy concoction brewed from butterbeans.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 10% and restores 10 HP.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MARSHROOMS, 1));
		ingredients.add(new Ingredient(Ingredient.BUTTERMILK, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		food.add(new ObjectPage(
			Craftable.CREAM_OF_MARSHROOM_SOUP,
			"A chunky chowder made from minced marshrooms.",
			ingredients,
			Workstation.BRICK,
			ObjectType.food,
			effect: "Fills hunger meter by 80% and increases defence for a short time.",
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
			Workstation.MASON,
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
		ingredients.add(new Ingredient(Ingredient.PALM_LUMBER, 1));
		materials.add(new ObjectPage(
			Craftable.WOOD,
			"A perfectly planed plank of stripped and sawn lumber.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.materials,
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
			Workstation.MASON,
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
		ingredients.add(new Ingredient(Ingredient.GRASSY_LEAVES, 3));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAW_DOOR,
			"A primitive door made of sticks and stew.",
			ingredients,
			Workstation.MASON,
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
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CELL_DOOR,
			"A steely dungeon door with unbreakable bars.",
			ingredients,
			Workstation.WELDER,
			ObjectType.building_materials,
			effect: "Can be opened and closed.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.GRASSY_LEAVES, 5));
		ingredients.add(new Ingredient(Ingredient.CORD, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAW_FLOOR,
			"Dried grass tied together to create a cushiony floor covering.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 5,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STRAW_FLOOR, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STRAW_FLOORING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			effect: "Changes nearby earth floors into straw floor blocks.",
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
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 5));
		ingredients.add(new Ingredient(Ingredient.GOLEMITE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.CANTLIN_SHIELD,
			"A durable defensive wall that can block any enemy’s attack.",
			ingredients,
			Workstation.MACHINIST,
			ObjectType.building_materials,
			effect: "Can be retrieved by pressing the action button.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BARRICADE,
			"A steel-bound stockade designed to defend against marauding monsters.",
			ingredients,
			Workstation.MACHINIST,
			ObjectType.building_materials,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.SPIKE_TRAP,
			"A handful of horribly sharp spikes that can be set on the ground.",
			ingredients,
			Workstation.MACHINIST,
			ObjectType.building_materials,
			effect: "Deals damage to enemies who walk over it.",
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.LADDER,
			"A set of vertical steps pieced together from planks.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			effect: "Can be climbed when placed on walls.",
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
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.STONE_WINDOW,
			"A sturdy stone window that only lets in a little light.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.PORCHED_WINDOW,
			"A small wooden window with an overhangig lintel.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.ARCHED_WINDOW,
			"A small wooden window with an curvilinear lintel.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 150,
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
			"A block of massy masonry made of intricately interlocked rocks. Brilliant for building stout stone walls.",
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
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.BUTTRESS,
			"A stone support used to shore up brick bulwarks.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 50,
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
		ingredients.add(new Ingredient(Ingredient.WOODEN_FLOOR, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.WOODEN_FLOORING,
			"A covering that adds class to any earthen floor.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			effect: "Changes nearby earth floors into wooden floor blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		buildingMaterials.add(new ObjectPage(
			Craftable.HARDWOOD_TILE,
			"A classy cube wrought from rich, refined wood.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 10,
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
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CASTLE_CRENELLATION,
			"The classy capital of a castle wall, made from perfectly polished and uniformly arranged segments of stone.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.CASTLE_BATTLEMENT,
			"Perfectly polished and uniformly arranged segments of stone designed to crown a castle wall.",
			ingredients,
			Workstation.FORGE,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.MINI_MERLON,
			"A frustum-shaped segment of stone designed to trim the top of a tower.",
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
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.TIMBERED_FOUNDATION,
			"A stylish brick block with handsome hardwood highlights designed to underpin a cottage wall.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.TIMBERED_WALL,
			"A stylish brick block with handsome hardwood highlights designed to build a cottage wall.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.TIMBERED_CAPITAL,
			"A stylish brick block with handsome hardwood highlights designed to top off a cottage wall.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.TIMBERED_WALL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.TIMBERED_CLADDING,
			"A covering that adds class to any earthen wall.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			effect: "Changes nearby earth walls into timbered wall blocks.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.HARDWOOD_PEDESTAL,
			"A weighty wooden block that serves as a firm foundation for a tasteful timber pillar.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.HARDWOOD_COLUMN,
			"A wooden block that stacks to form the chic shafts of tasteful timber pillars.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.HARDWOOD_CAPITAL,
			"A well-crafted wooden block to cap off a tasteful timber pillar with class.",
			ingredients,
			Workstation.MINER,
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
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.RIDGE_TILING,
			"A curved cap to crown the ridges of roofs.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.TILED_WINDOW,
			"A stylish skylight that makes an attractive addition to pitched roofs.",
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
		ingredients.add(new Ingredient(Ingredient.LAVA, 5));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.HOT_WATER_CRYSTAL,
			"A bizarre block from which steaming spring water streams.",
			ingredients,
			Workstation.MINER,
			ObjectType.building_materials,
			effect: "Acts as a source of hot water when placed below ground level",
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WATER, 10));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.WATER_CRYSTAL,
			"A curious cube from which water freely flows.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.building_materials,
			effect: "Acts as a source of water when placed below ground level",
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.SHARING_STONE,
			"Anything built behind this magical monument can be called forth by faraway friends.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		buildingMaterials.add(new ObjectPage(
			Craftable.SUMMONING_STONE,
			"A magical monument that summons structures from a faraway place.",
			ingredients,
			Workstation.MASON,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BLACK_BLOCK,
			"A chunk of chalk dyed a bold black.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.GREY_BLOCK,
			"A chunk of chalk dyed a grim grey.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.WHITE_BLOCK,
			"A chunk of chalk dyed a wintry white.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BURGUNDY_BLOCK,
			"A chunk of chalk dyed a noble burgundy.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.RED_BLOCK,
			"A chunk of chalk dyed a rich red.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.PURPLE_BLOCK,
			"A chunk of chalk dyed a princely purple.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.PINK_BLOCK,
			"A chunk of chalk dyed a pretty pink.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.GREEN_BLOCK,
			"A chunk of chalk dyed a grassy green.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.LIME_GREEN_BLOCK,
			"A chunk of chalk dyed a luminous lime-green.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.ORANGE_BLOCK,
			"A chunk of chalk dyed a ardent orange.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.YELLOW_BLOCK,
			"A chunk of chalk dyed a mellow yellow.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.NAVY_BLOCK,
			"A chunk of chalk dyed a midnight navy.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BLUE_BLOCK,
			"A chunk of chalk dyed a bright blue.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BEIGE_BLOCK,
			"A chunk of chalk dyed a boring beige.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.CYAN_BLOCK,
			"A chunk of chalk dyed a striking cyan.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.SILVER_BLOCK,
			"A chunk of chalk dyed a stylish silver.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.GOLD_BLOCK,
			"A chunk of chalk dyed a gorgeous gold.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.EYEWALL,
			"A strange and unsettling eyeball-based block.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.SLIMY_BLOCK,
			"A slimy block that oozes with charachter.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.TIME_HONOURED_TURF,
			"A block of granular green grass evocative of ancient Alefgard.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.EIGHT_BIT_BRICK,
			"A block of bitty brick that brings back bygone memories.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.OLDE_WORLDE_WALL,
			"An old-fashioned wall from an old-fashioned world.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.RETRO_ROOF,
			"A faintly familiar roof tile.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.CLASSIC_COUNTER,
			"A boxy bar behind which many a merchant has plied his or her trade.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.TRADITIONAL_TRAP_TILE,
			"Electrified flooring that\'s sure to give you a shock.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.DATED_DESERT,
			"Sand with square spots, once seen in the Damdara desert.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.OLD_SCHOOL_OCEAN,
			"Bright blue water with white waves, once seen between Tantegel and the Dragonlord\'s domain.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		buildingMaterials.add(new ObjectPage(
			Craftable.BYGONE_BOG,
			"A piece of pixelated, poisonous peat that\'s harmful to your health.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.building_materials,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 1));
		furniture.add(new ObjectPage(
			Craftable.CHIMNEY,
			"A functional flue designed to expel smoke.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 0,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE_WALL, 1));
		furniture.add(new ObjectPage(
			Craftable.WELL,
			"A deep, dark hole from which water can be drawn.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
		furniture.add(new ObjectPage(
			Craftable.SIGNPOST,
			"A simple sign made of wood.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be used to write messages on",
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 1));
		furniture.add(new ObjectPage(
			Craftable.DRAGONLORDS_STANDARD,
			"A horned banner bearing the Dragonlord\'s sickening sigil.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.VILE_TILE,
			"An engraved tile bearing a depiction of a deadly demon.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.furniture,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		furniture.add(new ObjectPage(
			Craftable.DRACONIC_COLUMN,
			"An imposing pillar capped with a cruel countenance.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		furniture.add(new ObjectPage(
			Craftable.VILE_VISAGE,
			"A carving of the fearsome face of a foul fiend.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.EVIL_IDOL,
			"A sinister statuethat spits great gouts of fire at passers-by.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.furniture,
			effect: "Breathes fire at anyone who passes in front of it.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.EARTH, 1));
		furniture.add(new ObjectPage(
			Craftable.BEASTLY_BURROW,
			"The dreadful den of a creeping, crawling monster.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.furniture,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.HELLIPORTAL,
			"A horrible hole believed to be a back passage to a damned dominion.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.furniture,
			score: 300,
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
		ingredients.add(new Ingredient(Ingredient.GRASSY_LEAVES, 3));
		furniture.add(new ObjectPage(
			Craftable.STRAW_MATTRESS,
			"Basic bedding made from dried weeds woven together.",
			ingredients,
			Workstation.MASON,
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
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.POWIE_YOWIE_FUR, 1));
		furniture.add(new ObjectPage(
			Craftable.KING_SIZED_BED,
			"A bed of princely proportions, with plenty of space to roll around in.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
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
		ingredients.add(new Ingredient(Ingredient.BRICK_WALL, 5));
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 3));
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		furniture.add(new ObjectPage(
			Craftable.COLOSSAL_CLOSET,
			"A sturdy stone stash expansive enough to accomodate a whole person.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be used to store items.",
			score: 1000,
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
		ingredients.add(new Ingredient(Ingredient.STONE, 2));
		furniture.add(new ObjectPage(
			Craftable.STONE_TABLE,
			"A slab of stone shaped and smoothed into a cylinder.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		ingredients.add(new Ingredient(Ingredient.FUR, 1));
		furniture.add(new ObjectPage(
			Craftable.STONE_STOOL,
			"A smooth stone seat that’s upholstered with hide.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 100,
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
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		furniture.add(new ObjectPage(
			Craftable.BIG_TABLE,
			"The finest timber carefully carved into a long, low table.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 5));
		ingredients.add(new Ingredient(Ingredient.GOLD, 2));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		furniture.add(new ObjectPage(
			Craftable.ROUND_TABLE,
			"A circular stone table that\'s well suited to the chivalrous.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 750,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		furniture.add(new ObjectPage(
			Craftable.EXTRAVAGANT_TABLE,
			"A lot of lumber is required to build this titanic table.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 750,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		furniture.add(new ObjectPage(
			Craftable.WOODEN_STOOL,
			"A simple stool crafted from carefully whittled wood.",
			ingredients,
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 120,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.COTTON, 5));
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 2));
		ingredients.add(new Ingredient(Ingredient.BIGONIA_LEAF, 2));
		furniture.add(new ObjectPage(
			Craftable.COMFY_SOFA,
			"A soft settee to relax and recline on.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 500,
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
			Workstation.CARPENTER,
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
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SHOT_SILK, 3));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 3));
		ingredients.add(new Ingredient(Ingredient.GOLD, 3));
		ingredients.add(new Ingredient(Ingredient.DRAGON_BONES, 1));
		furniture.add(new ObjectPage(
			Craftable.DRAGONLORDS_THRONE,
			"The sinister seat of the dreadful Dragonlord.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Can be sat on.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 2));
		furniture.add(new ObjectPage(
			Craftable.GRAVESTONE,
			"A simple stone symbol for a soul now at rest.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 50,
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
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		furniture.add(new ObjectPage(
			Craftable.PRETTY_PILLAR,
			"A beautiful block of rock with a stylish sphere atop it.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 100,
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
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		ingredients.add(new Ingredient(Ingredient.EARTH, 1));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
		furniture.add(new ObjectPage(
			Craftable.PLANT_POT,
			"A big pot for planting pot plants.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 300,
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
		ingredients.add(new Ingredient(Ingredient.STONE, 3));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		furniture.add(new ObjectPage(
			Craftable.FOUNTAIN,
			"Water sprays playfully from this pretty pump.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			effect: "Place in water to activate.",
			score: 500,
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
			Workstation.MACHINIST,
			ObjectType.furniture,
			score: 100,
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
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.DRESSING_TABLE,
			"A dainty dresser with a mirror made to aid you in applying you make-up.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 150,
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
		furniture.add(new ObjectPage(
			Craftable.CRATE,
			"A cube-shaped container made from wooden planks.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		furniture.add(new ObjectPage(
			Craftable.TREASURE_CHEST,
			"These comely coffers often proffer treasure.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.WARDROBE,
			"Furniture used to store clothes without folding them.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.SPRING, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		furniture.add(new ObjectPage(
			Craftable.GRANDFATHER_CLOCK,
			"A sizeable timepiece that\'s too tall for the shelf.",
			ingredients,
			Workstation.WELDER,
			ObjectType.furniture,
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.CHEST_OF_DRAWERS,
			"A set of small drawers suited for storing small things.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 3));
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.ARMOIRE,
			"A stony storage closet for keeping clothes in.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 200,
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
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.ORNAMENTAL_SWORDS,
			"These swords might be crummy in combat, but they’re lovely to look at.",
			ingredients,
			Workstation.MACHINIST,
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
			Workstation.MACHINIST,
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
			Workstation.MACHINIST,
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
			Workstation.MACHINIST,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 1));
		furniture.add(new ObjectPage(
			Craftable.CLOVER_CARVING,
			"A quaint stone quatrefoil designed to decorate a castle wall.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 150,
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
		ingredients.add(new Ingredient(Ingredient.FREEZIA_FLOWER, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.WOOD, 1));
		furniture.add(new ObjectPage(
			Craftable.PORTRAIT_OF_LADY,
			"An impressionistic image of a formidable figure.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		furniture.add(new ObjectPage(
			Craftable.CHAINS,
			"A pair of unescapable iron manacles designed to handcuff hostages to the wall.",
			ingredients,
			Workstation.WELDER,
			ObjectType.furniture,
			score: 150,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FREEZIA_FLOWER, 1));
		furniture.add(new ObjectPage(
			Craftable.NOTE,
			"Pieces of paper perfect for jotting down ingenious ideas, or shopping lists.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 10,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BOOK, 1));
		ingredients.add(new Ingredient(Ingredient.CHIMAERA_FEATHER, 1));
		ingredients.add(new Ingredient(Ingredient.BOTTLES, 1));
		furniture.add(new ObjectPage(
			Craftable.STATIONERY,
			"A pen and paper used for drafting documents or writing reports.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FREEZIA_FLOWER, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 1));
		furniture.add(new ObjectPage(
			Craftable.TREASURES_N_TRAPDOORS,
			"Nobody knows whose turn it is, or who\'s winning or losing.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WHOPPING_NEEDLE, 1));
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.STUFFED_HAMMERHOOD,
			"A cute and cuddly recreation of a cute and cuddly creature.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 500,
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
		ingredients.add(new Ingredient(Ingredient.WHOPPING_NEEDLE, 1));
		ingredients.add(new Ingredient(Ingredient.POWIE_YOWIE_FUR, 3));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		furniture.add(new ObjectPage(
			Craftable.POWIE_YOWIE_RUG,
			"A soft and fluffy floor covering in the shape of a massive monster.",
			ingredients,
			Workstation.MINER,
			ObjectType.furniture,
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 1));
		furniture.add(new ObjectPage(
			Craftable.ITEM_DISPLAY_STAND,
			"A simple stand designed for displaying tools and other items.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be used to display items.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.EQUIPMENT_DISPLAY_STAND,
			"A simple stand designed for displaying weapons and armour.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be used to display equipment.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 4));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.WOOD, 2));
		furniture.add(new ObjectPage(
			Craftable.STOVE,
			"A basic burner designed to warm and light rooms, not to warm light meals.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Light source.",
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 4));
		furniture.add(new ObjectPage(
			Craftable.SINK,
			"A big basin where you can wash your dirty dishes in warm water.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 4));
		ingredients.add(new Ingredient(Ingredient.HOT_WATER_CRYSTAL, 1));
		furniture.add(new ObjectPage(
			Craftable.BATHTUB,
			"An extraordinary apparatus that turns your skin all wrinkly.",
			ingredients,
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Can be used to take baths.",
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
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		furniture.add(new ObjectPage(
			Craftable.WATER_JUG,
			"A pitcher for pouring and storing drinks.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.furniture,
			score: 300,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.GLASS, 1));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
		furniture.add(new ObjectPage(
			Craftable.BOTTLES,
			"Glass receptacles used for storing liquids and ships.",
			ingredients,
			Workstation.MACHINIST,
			ObjectType.furniture,
			score: 150,
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
		ingredients.add(new Ingredient(Ingredient.FRUIT_SALAD, 1));
		ingredients.add(new Ingredient(Ingredient.CROCKERY, 1));
		furniture.add(new ObjectPage(
			Craftable.SALAD_PLATE,
			"A serving of salad that’s as hearty as it is healthy.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.furniture,
			effect: "Cannot be eaten.",
			score: 200,
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
		ingredients.add(new Ingredient(Ingredient.SAILORS_STEW, 1));
		ingredients.add(new Ingredient(Ingredient.CROCKERY, 1));
		furniture.add(new ObjectPage(
			Craftable.FISH_DISH,
			"A flavoursome feast featuring the finest fish in the salty sea.",
			ingredients,
			Workstation.COOKFIRE,
			ObjectType.furniture,
			effect: "Cannot be eaten.",
			score: 300,
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
			Workstation.MASON,
			ObjectType.furniture,
			effect: "Press [action button] after placing to activate.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		furniture.add(new ObjectPage(
			Craftable.OBJECT_SPRITE,
			"A spritely object sprite that\'s bound to bring back memories.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 5));
		furniture.add(new ObjectPage(
			Craftable.CHARACTER_SPRITE,
			"A spritely character sprite that\'s sure to bring back memories.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 10));
		furniture.add(new ObjectPage(
			Craftable.SAVIOUR_SPRITE,
			"A stirring scene of a knight in shining armour and his lady love that\'s bound to bring back memories.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 3));
		furniture.add(new ObjectPage(
			Craftable.FLAT_OBJECT_SPRITE,
			"A spritely flat object sprite that\'s bound to bring back memories.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 5));
		furniture.add(new ObjectPage(
			Craftable.FLAT_CHARACTER_SPRITE,
			"A spritely flat character sprite that\'s sure to bring back memories.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.furniture,
			score: 50,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 10));
		furniture.add(new ObjectPage(
			Craftable.FLAT_SAVIOUR_SPRITE,
			"A stirring flat scene of a knight in shining armour and his lady love that\'s bound to bring back memories.",
			ingredients,
			Workstation.DQ_GAME_PAK,
			ObjectType.furniture,
			score: 100,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 5));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		furniture.add(new ObjectPage(
			Craftable.HEALIX_THE_HERO,
			"A statue of a heroic healslime from a faraway world.",
			ingredients,
			Workstation.MACHINIST,
			ObjectType.furniture,
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.STONE, 8));
		craftingStation.add(new ObjectPage(
			Craftable.MASONS_WORKSTATION,
			"A smoothed slab of stone inscribed with lines for accurate crafting.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Can be used to build simple items and weapons.",
			score: 100,
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
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		craftingStation.add(new ObjectPage(
			Craftable.MINERS_REFINER,
			"Prized by prospectors for its shaping, sorting and sifting capabilities.",
			ingredients,
			Workstation.CARPENTER,
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
		ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 5));
		ingredients.add(new Ingredient(Ingredient.GRASSY_LEAVES, 3));
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
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
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
		ingredients.add(new Ingredient(Ingredient.STONE, 8));
		ingredients.add(new Ingredient(Ingredient.COPPER, 3));
		ingredients.add(new Ingredient(Ingredient.COAL, 3));
		craftingStation.add(new ObjectPage(
			Craftable.FORGE,
			"A sturdy stone smithy hot enough to melt almost anything.",
			ingredients,
			Workstation.MASON,
			ObjectType.crafting_station,
			effect: "Can be used to build metallic items and weapons.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FORGE, 1));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 5));
		ingredients.add(new Ingredient(Ingredient.COAL, 1));
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
		ingredients.add(new Ingredient(Ingredient.WOOD, 10));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 5));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 5));
		ingredients.add(new Ingredient(Ingredient.CORD, 5));
		craftingStation.add(new ObjectPage(
			Craftable.BUILDERS_WORKBENCH,
			"A wide-ranging workstation with all the tools a Builder could need.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Can be used to build complex furniture.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 10));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 5));
		ingredients.add(new Ingredient(Ingredient.THERMOBATTERY, 5));
		ingredients.add(new Ingredient(Ingredient.WOOD, 5));
		craftingStation.add(new ObjectPage(
			Craftable.MACHINISTS_WORKBENCH,
			"An amazing arrangement of automatic apparatuses.",
			ingredients,
			Workstation.MINER,
			ObjectType.crafting_station,
			effect: "Can be used to build mechanical and magical items.",
			score: 500,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.EARTH, 8));
		ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 3));
		ingredients.add(new Ingredient(Ingredient.ORANGE_OIL, 3));
		ingredients.add(new Ingredient(Ingredient.MONSTER_EGG, 1));
		ingredients.add(new Ingredient(Ingredient.BONES, 1));
		craftingStation.add(new ObjectPage(
			Craftable.FORBIDDEN_ALTAR,
			"Evil energy emanates from the infernal vessel in its centre.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			effect: "Can be used to build demonic items.",
			score: 200,
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.PIXEL, 30));
		craftingStation.add(new ObjectPage(
			Craftable.DQ_GAME_PAK,
			"A curious cartridge that can conjour strange sprites from the other.",
			ingredients,
			Workstation.CARPENTER,
			ObjectType.crafting_station,
			score: 500,
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
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 2));
		ingredients.add(new Ingredient(Ingredient.ROCKBOMB_SHARD, 5));
		ingredients.add(new Ingredient(Ingredient.COAL, 5));
		weaponTool.add(new ObjectPage(
			Craftable.FIRE_BLADE,
			"A sword forged in the shape of a raging inferno.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.weapon_tool,
			effect: "Attack +39. Enchanted with fire magic.",
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
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM , 3));
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT , 2));
		ingredients.add(new Ingredient(Ingredient.GOLD , 1));
		ingredients.add(new Ingredient(Ingredient.SILVERY_SLUDGE , 1));
		ingredients.add(new Ingredient(Ingredient.HOLY_WATER , 1));
		weaponTool.add(new ObjectPage(
			Craftable.ERDRICKS_SWORD,
			"The fabled blade of a legendary hero.",
			ingredients,
			Workstation.DIVINER,
			ObjectType.weapon_tool,
			effect: "Attack +55. Does not degrade with use.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM , 2));
		ingredients.add(new Ingredient(Ingredient.SILVERY_SLUDGE , 1));
		ingredients.add(new Ingredient(Ingredient.SEPTIC_SHRUB , 1));
		ingredients.add(new Ingredient(Ingredient.DRAGON_BONES , 1));
		weaponTool.add(new ObjectPage(
			Craftable.SWORD_OF_RUIN,
			"An unwieldy weapon with a strange and sinister shape.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.weapon_tool,
			effect: "Attack +50. It emits an ominous aura...",
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
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 2));
		ingredients.add(new Ingredient(Ingredient.SCORPION_HORN, 3));
		weaponTool.add(new ObjectPage(
			Craftable.WAR_HAMMER,
			"A steel sledgehammer so heavy that only the strongest soldiers can hold it.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.weapon_tool,
			effect: "Attack +37. Can break very hard blocks.",
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
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 3));
		ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		weaponTool.add(new ObjectPage(
			Craftable.HAMMER_OF_BUILDER,
			"The ultimate hammer, forged from the finest materials.",
			ingredients,
			Workstation.WELDER,
			ObjectType.weapon_tool,
			effect: "Attack +53. Can break very hard blocks. Does not degrade with use.",
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
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 2));
		ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 1));
		weaponTool.add(new ObjectPage(
			Craftable.BATTLEAXE,
			"A stout and steely weapon of war.",
			ingredients,
			Workstation.SEWING,
			ObjectType.weapon_tool,
			effect: "Attack +38. Can break very hard blocks.",
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
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.GUARDS_GARB,
			"The unmistakable uniform of an Alefgardian guardsmen.",
			ingredients,
			Workstation.MASON,
			ObjectType.armour,
			effect: "Defence +5. Slightly increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.VILLAGERS_VESTURE,
			"Classy clobber preferred by trendy townspeople.",
			ingredients,
			Workstation.MASON,
			ObjectType.armour,
			effect: "Defence +5. Slightly increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.COARSE_CLOTH, 3));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.TRADERS_TUNIC,
			"Lightweight leisure wear that won\'t weigh a travelling trader down.",
			ingredients,
			Workstation.MASON,
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
		ingredients.add(new Ingredient(Ingredient.FUR, 3));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.LEATHER_ARMOUR,
			"A sturdy, studded suit of hardened hide.",
			ingredients,
			Workstation.MASON,
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
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 2));
		ingredients.add(new Ingredient(Ingredient.SILVERY_SLUDGE, 1));
		ingredients.add(new Ingredient(Ingredient.SEPTIC_SHRUB, 1));
		ingredients.add(new Ingredient(Ingredient.BONES, 3));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 1));
		armour.add(new ObjectPage(
			Craftable.WAILERS_MAIL,
			"Abominable armour built from the bones of the damned.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.armour,
			effect: "Defence +30. It emits an ominous aura...",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 1));
		ingredients.add(new Ingredient(Ingredient.SILVERY_SLUDGE, 1));
		ingredients.add(new Ingredient(Ingredient.SEPTIC_SHRUB, 1));
		ingredients.add(new Ingredient(Ingredient.HUGE_HORN, 2));
		armour.add(new ObjectPage(
			Craftable.THANATOS_SHIELD,
			"A bejewelled buckler buffed to a silvery sheen.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.armour,
			effect: "Defence +16. Emits an ominous aura...",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 1));
		ingredients.add(new Ingredient(Ingredient.MAGIC_DYE, 1));
		ingredients.add(new Ingredient(Ingredient.CORD, 1));
		armour.add(new ObjectPage(
			Craftable.SCANDALOUS_SWIMSUIT,
			"Racy red swimwear for those who like to show some skin.",
			ingredients,
			Workstation.MASON,
			ObjectType.armour,
			effect: "Defence +1.",
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
		ingredients.add(new Ingredient(Ingredient.LIQUID_SILVER, 3));
		ingredients.add(new Ingredient(Ingredient.DEFUDDLE_DROPS, 3));
		ingredients.add(new Ingredient(Ingredient.PURE_WATER, 1));
		armour.add(new ObjectPage(
			Craftable.RING_OF_CLARITY,
			"A ring with a calming blue hue that keeps its bearer composed.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.armour,
			effect: "Protects against confusion.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RUSTY_NUGGETS, 5));
		ingredients.add(new Ingredient(Ingredient.FIBROUS_FABRIC, 2));
		ingredients.add(new Ingredient(Ingredient.RUBY, 2));
		ingredients.add(new Ingredient(Ingredient.ZENITHIUM, 2));
		ingredients.add(new Ingredient(Ingredient.FRESH_FISH_FEAST, 1));
		armour.add(new ObjectPage(
			Craftable.GOURMANDS_GIRDLE,
			"A big, buckled belt that keeps you feeling full.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.armour,
			effect: "Prevents the hunger meter from decreasing.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.RUBY, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		armour.add(new ObjectPage(
			Craftable.STRENGTH_RING,
			"A big, bold ring that boosts its wearer\'s brawn.",
			ingredients,
			Workstation.HERBALIST,
			ObjectType.armour,
			effect: "Attack +5.",
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

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 10));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 5));
		armour.add(new ObjectPage(
			Craftable.FEATHERFALL_FOOTWEAR,
			"Superbly sturdy shoes constructed from orichalcum.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Protects against falling damage.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.GOLD, 10));
		ingredients.add(new Ingredient(Ingredient.SILVER, 5));
		armour.add(new ObjectPage(
			Craftable.METEORITE_BRACER,
			"An armlet imbued with all the energy of a shooting star.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Increases movement speed.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.SILVER, 10));
		ingredients.add(new Ingredient(Ingredient.RUBY, 1));
		armour.add(new ObjectPage(
			Craftable.RING_OF_CRITICALITY,
			"A ring that brings out the best in its bearer.",
			ingredients,
			Workstation.FURNACE,
			ObjectType.armour,
			effect: "Increases critical hit rate.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.CHIMAERA_FEATHER, 20));
		ingredients.add(new Ingredient(Ingredient.POWIE_YOWIE_FUR, 5));
		ingredients.add(new Ingredient(Ingredient.FINEST_FUR, 5));
		armour.add(new ObjectPage(
			Craftable.TALARIA,
			"Strange sandals that make you feel as light as a feather.",
			ingredients,
			Workstation.SEWING,
			ObjectType.armour,
			effect: "Allows you to double jump.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.SLIMY_TUSSLE_TICKET,
			"Summons a mob of monsters from Cantlin.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: slimes, drackies, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.FLATTENED_TUSSLE_TICKET,
			"Summons a mob of monsters from Cantlin.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: hammerhoods, scorpions, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.POISONOUS_TUSSLE_TICKET,
			"Summons a mob of monsters from Rimuldar.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: drohl dronnes, killerpillars, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.ROUGHED_UP_TUSSLE_TICKET,
			"Summons a mob of monsters from Rimuldar.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: bewarewolves, bodkin archers, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.TORRID_TUSSLE_TICKET,
			"Summons a mob of monsters from Kol and Galenholm.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: bunicorns, dancing flames, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.MAGICAL_TUSSLE_TICKET,
			"Summons a mob of monsters from Kol and Galenholm.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: hocus chimaeras, frostburns, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.BLOODY_TUSSLE_TICKET,
			"Summons a mob of monsters from Tantegel.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: dark skeletons, bloody hands, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
		other.add(new ObjectPage(
			Craftable.DEMONIC_TUSSLE_TICKET,
			"Summons a mob of monsters from Tantegel.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: easy. Monsters: skeleton scrappers, lunaticks, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SLIMY_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.SKELETAL_TROUBLE_TICKET,
			"Summons a mob of monsters from Cantlin.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: skeleton soldiers, iron scorpions, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.FLATTENED_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.FEATHERY_TROUBLE_TICKET,
			"Summons a mob of monsters from Cantlin.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: king slimes, cosmic chimaeras, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.POISONOUS_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.PRICKLY_TROUBLE_TICKET,
			"Summons a mob of monsters from Rimuldar.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: illerpillars, treefaces, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.ROUGHED_UP_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.ROTTEN_TROUBLE_TICKET,
			"Summons a mob of monsters from Rimuldar.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: walking corpses, bodkin fletchers, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.TORRID_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.TRICKY_TROUBLE_TICKET,
			"Summons a mob of monsters from Kol and Galenholm.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: legerdemen, muddy hands, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.MAGICAL_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.METALLIC_TROUBLE_TICKET,
			"Summons a mob of monsters from Kol and Galenholm.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: hunter mechs, hawk men, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.BLOODY_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.BALEFUL_TROUBLE_TICKET,
			"Summons a mob of monsters from Tantegel.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: knights abhorrent, drackymas, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.DEMONIC_TUSSLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SILVER, 1));
		other.add(new ObjectPage(
			Craftable.DEADLY_TROUBLE_TICKET,
			"Summons a mob of monsters from Tantegel.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: normal. Monsters: death scorpions, raving lunaticks, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.SKELETAL_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.STONY_TRAUMA_TICKET,
			"Summons a mob of monsters from Cantlin.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: golems, rockbombs, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.FEATHERY_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.FRIGHTENING_TRAUMA_TICKET,
			"Summons a mob of monsters from Cantlin.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: fightgeists, green dragons, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.PRICKLY_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.PIERCING_TRAUMA_TICKET,
			"Summons a mob of monsters from Rimuldar.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: scarewolves, bodkin bowyers, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.ROTTEN_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.RESPLENDENT_TRAUMA_TICKET,
			"Summons a mob of monsters from Rimuldar.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: gold golems, tearwolves, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.TRICKY_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.TOWERING_TRAUMA_TICKET,
			"Summons a mob of monsters from Kol and Galenholm.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: boss trolls, magmalices, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.METALLIC_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.MECHANICAL_TRAUMA_TICKET,
			"Summons a mob of monsters from Kol and Galenholm.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: killing machines, firn friends, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.BALEFUL_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.BURNING_TRAUMA_TICKET,
			"Summons a mob of monsters from Tantegel.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: blue dragons, cosmic chimaeras, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.DEADLY_TROUBLE_TICKET, 1));
		ingredients.add(new Ingredient(Ingredient.GOLD, 1));
		other.add(new ObjectPage(
			Craftable.DREADFUL_TRAUMA_TICKET,
			"Summons a mob of monsters from Tantegel.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Difficulty: hard. Monsters: dread dragons, vis majers, etc.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		other.add(new ObjectPage(
			Craftable.ALL_KNIGHTER_TICKET,
			"Summons a squadron of spiteful knights.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Win the battle to earn a mage blueprint.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		other.add(new ObjectPage(
			Craftable.FULL_METAL_TICKET,
			"Summons a mob of mechanical monstrosities.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Win the battle to earn a sage blueprint.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		other.add(new ObjectPage(
			Craftable.GOLD_RUSH_TICKET,
			"Summons a bullion bully and its skeletal servants.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Win the battle to earn a priest blueprint.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		other.add(new ObjectPage(
			Craftable.FURRY_FURY_TICKET,
			"Summons a hirsute hellhound and a gang of ghosts.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Win the battle to earn a martial artist blueprint.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		other.add(new ObjectPage(
			Craftable.MAGER_LEAGUE_TICKET,
			"Summons a horde of hocus pocus horrors.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Win the battle to earn a warrior blueprint.",
		));

		ingredients = new List();
		ingredients.add(new Ingredient(Ingredient.BLANK_TICKET, 1));
		other.add(new ObjectPage(
			Craftable.BLACKENED_BLOOZE_TICKET,
			"Summons a scaly jailor and its bouncing buddies.",
			ingredients,
			Workstation.FORBIDDEN,
			ObjectType.other,
			effect: "Win the battle to earn a hero blueprint.",
		));

		List<Widget> _listRows = new List();
		_listRows.add(categoryHeader(ObjectType.items));
		if (_openItems) {
			addListCategory(_listRows, items);
		}
		_listRows.add(categoryHeader(ObjectType.food));
		if (_openFood) {
			addListCategory(_listRows, food);
		}
		_listRows.add(categoryHeader(ObjectType.light_source,));
		if (_openLightSource) {
			addListCategory(_listRows, lightSource);
		}
		_listRows.add(categoryHeader(ObjectType.materials));
		if (_openMaterials) {
			addListCategory(_listRows, materials);
		}
		_listRows.add(categoryHeader(ObjectType.building_materials));
		if (_openBuildingMaterials) {
			addListCategory(_listRows, buildingMaterials);
		}
		_listRows.add(categoryHeader(ObjectType.furniture));
		if (_openFurniture) {
			addListCategory(_listRows, furniture);
		}
		_listRows.add(categoryHeader(ObjectType.crafting_station));
		if (_openCraftingStation) {
			addListCategory(_listRows, craftingStation);
		}
		_listRows.add(categoryHeader(ObjectType.weapon_tool));
		if (_openWeaponTool) {
			addListCategory(_listRows, weaponTool);
		}
		_listRows.add(categoryHeader(ObjectType.armour));
		if (_openArmour) {
			addListCategory(_listRows, armour);
		}
		_listRows.add(categoryHeader(ObjectType.other));
		if (_openOther) {
			addListCategory(_listRows, other);
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

	Widget categoryHeader(ObjectType type) {
		String title;
		bool openDrawer;
		Color color;
		switch (type) {
			case ObjectType.items:
				title = "Items";
				openDrawer = _openItems;
				color = itemColor;
				break;
			case ObjectType.food:
				title = "Food";
				openDrawer = _openFood;
				color = foodColor;
				break;
			case ObjectType.light_source:
				title = "Light Source";
				openDrawer = _openLightSource;
				color = lightSourceColor;
				break;
			case ObjectType.materials:
				title = "Materials";
				openDrawer = _openMaterials;
				color = materialsColor;
				break;
			case ObjectType.building_materials:
				title = "Building Materials";
				openDrawer = _openBuildingMaterials;
				color = buildingMaterialsColor;
				break;
			case ObjectType.furniture:
				title = "Furniture";
				openDrawer = _openFurniture;
				color = furnitureColor;
				break;
			case ObjectType.crafting_station:
				title = "Crafting Station";
				openDrawer = _openCraftingStation;
				color = craftingStationColor;
				break;
			case ObjectType.weapon_tool:
				title = "Weapons/Tools";
				openDrawer = _openWeaponTool;
				color = weaponToolColor;
				break;
			case ObjectType.armour:
				title = "Armour";
				openDrawer = _openArmour;
				color = armourColor;
				break;
			case ObjectType.other:
				title = "Other";
				openDrawer = _openOther;
				color = otherColor;
				break;
			case ObjectType.room:
				title = "Room Recipe";
				openDrawer = _openRoom;
				color = roomColor;
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

	void addListCategory(List<Widget> widgetList, List<ObjectPage> objectList) {
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