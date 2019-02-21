import 'package:flutter/material.dart';
import 'universalClasses.dart';
import 'package:dqbuilders_companion/crafting.dart';

class CantlinListPage extends StatefulWidget {
  @override
  _CantlinListPageState createState() => _CantlinListPageState();
}

class _CantlinListPageState extends State<CantlinListPage>
    with SingleTickerProviderStateMixin {
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
        backgroundColor: Colors.green,
        title: Text(
          "Cantlin",
          style: Theme.of(context).textTheme.title,
        ),
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
    ingredients.add(new Ingredient(Ingredient.TARNISHED_TOKEN, 1));
    ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 5));
    ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 3));
    ingredients.add(new Ingredient("Coal", 1));
    items.add(new ObjectPage(
      Craftable.ANCIENT_EMBLEM,
      "The long-lost mark of a hero of legend.",
      ingredients,
      Workstation.FURNACE,
      ObjectType.items,
      effect: "Brings back the light to the skies above Cantlin.",
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
    ingredients.add(new Ingredient(Ingredient.ROCKBOMB_SHARD, 3));
    ingredients.add(new Ingredient(Ingredient.IRON_INGOT, 1));
    ingredients.add(new Ingredient(Ingredient.CORD, 1));
    items.add(new ObjectPage(
      Craftable.WRECKING_BALL,
      "A fastly tied fan of fluttering feathers.",
      ingredients,
      Workstation.MASON,
      ObjectType.items,
      effect: "Explodes a short time after being placed.",
      score: 0,
    ));

    ingredients = new List();
    ingredients.add(new Ingredient(Ingredient.BLUE_TABLET_FRAGMENT, 1));
    ingredients.add(new Ingredient(Ingredient.EARTH, 3));
    ingredients.add(new Ingredient(Ingredient.BLUE_GOO, 1));
    items.add(new ObjectPage(
      Craftable.BLUE_TELEPORTAL,
      "An ancient artefact that can convey you to far-flung fields.",
      ingredients,
      Workstation.MASON,
      ObjectType.items,
      effect: "Once placed, can be used to travel to and from another island.",
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
    ingredients.add(new Ingredient(Ingredient.MEAT, 1));
    ingredients.add(new Ingredient(Ingredient.COAL, 1));
    food.add(new ObjectPage(
      Craftable.BUNICORN_STEAK,
      "A rabbity rib-eye roasted right over the coals.",
      ingredients,
      Workstation.COOKFIRE,
      ObjectType.food,
      effect:
          "Fills hunger meter by 20% and increases attack power for a short time.",
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
      effect:
          "Fills hunger meter by 80% and increases attack power for a short time.",
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
      effect:
          "Completely fills hunger meter and increases attack power for a short time.",
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
      effect:
          "Fills hunger meter by 80% and increases defence for a short time.",
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
    ingredients.add(new Ingredient(Ingredient.ORICHALCUM, 5));
    ingredients.add(new Ingredient(Ingredient.GOLEMITE, 3));
    buildingMaterials.add(new ObjectPage(
      Craftable.CANTLIN_SHIELD,
      "A durable defensive wall that can block any enemy’s attack.",
      ingredients,
      Workstation.FURNACE,
      ObjectType.building_materials,
      effect: "Can be retrieved.",
      score: 500,
    ));

    ingredients = new List();
    ingredients.add(new Ingredient(Ingredient.WOOD, 5));
    ingredients.add(new Ingredient(Ingredient.STEEL_INGOT, 3));
    buildingMaterials.add(new ObjectPage(
      Craftable.BARRICADE,
      "A steel-bound stockade designed to defend against marauding monsters.",
      ingredients,
      Workstation.FURNACE,
      ObjectType.building_materials,
      score: 50,
    ));

    ingredients = new List();
    ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 3));
    buildingMaterials.add(new ObjectPage(
      Craftable.SPIKE_TRAP,
      "A handful of horribly sharp spikes that can be set on the ground.",
      ingredients,
      Workstation.FORGE,
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
      Workstation.MASON,
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
      Workstation.MASON,
      ObjectType.building_materials,
      effect: "Can be opened and closed.",
      score: 100,
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
    ingredients.add(new Ingredient(Ingredient.WOOD, 3));
    ingredients.add(new Ingredient(Ingredient.GLASS, 1));
    ingredients.add(new Ingredient(Ingredient.COPPER_INGOT, 1));
    furniture.add(new ObjectPage(
      Craftable.DRESSING_TABLE,
      "A dainty dresser with a mirror made to aid you in applying your make-up.",
      ingredients,
      Workstation.MASON,
      ObjectType.furniture,
      score: 150,
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
      effect:
          "When placed inside a room, can be used to assign it to a male resident.",
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
      effect:
          "When placed inside a room, can be used to assign it to a female resident.",
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
      Workstation.TREE,
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
    ingredients.add(new Ingredient(Ingredient.BROKEN_BRANCH, 3));
    weaponTool.add(new ObjectPage(
      Craftable.GIANT_MALLET,
      "A heavy hammer hewn from a large log.",
      ingredients,
      Workstation.MASON,
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
    _listRows.add(
        categoryHeader(ObjectType.building_materials, buildingMaterialsColor));
    if (_openBuildingMaterials) {
      addListCategory(_listRows, buildingMaterials, context);
    }
    _listRows.add(categoryHeader(ObjectType.furniture, furnitureColor));
    if (_openFurniture) {
      addListCategory(_listRows, furniture, context);
    }
    _listRows
        .add(categoryHeader(ObjectType.crafting_station, craftingStationColor));
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
          image: new DecorationImage(
              image: AssetImage("assets/gamePic.jpg"), fit: BoxFit.cover)),
      child: Container(
        color: Colors.white54,
        child: ListView.builder(
          itemBuilder: (context, i) {
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
        title: Text(
          title,
          style: header,
        ),
        trailing: new Icon(
          openDrawer ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 40.0,
        ),
        onTap: () {
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

  void addListCategory(List<Widget> widgetList, List<ObjectPage> objectList,
      BuildContext context) {
    for (ObjectPage o in objectList) {
    	if (o.objectName.toLowerCase().contains(_searchText)) {
			widgetList.add(Padding(
				padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
				child: Material(
					type: MaterialType.transparency,
					child: InkWell(
						highlightColor: Colors.green,
						onTap: () {
							Navigator.push(context, SlideAndFadeRoute(widget: o));
						},
						child: Container(
							margin: EdgeInsets.only(left: 10.0, right: 25.0),
							padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
							decoration: BoxDecoration(
								color: Colors.white,
								borderRadius: BorderRadius.all(Radius.circular(5.0)),
								border: Border.all(color: Colors.grey, width: 3.0)),
							child: Text(
								o.objectName,
								style: subheader,
							)),
					),
				),
			));
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
