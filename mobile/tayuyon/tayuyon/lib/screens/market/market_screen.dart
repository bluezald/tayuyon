import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models.dart';

const String fruitsImageUrl =
    'https://www.snexplores.org/wp-content/uploads/2022/10/1440_SS_fruit_feat-1030x580.jpg';
const String vegetablesImageUrl =
    'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg';
const String meatImageUrl =
    'https://facts.net/wp-content/uploads/2022/06/different-types-of-meat.jpg';

Cart cart = Cart();

class SimpleEcommerce extends StatelessWidget {
  const SimpleEcommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Builder(
        builder: (context) => const MarketScreen(),
      ),
    );
  }
}

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late String searchString;
  @override
  void initState() {
    searchString = '';
    super.initState();
  }

  void setSearchString(String value) => setState(() {
        searchString = value;
      });

  @override
  Widget build(BuildContext context) {
    var listViewPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    List<Widget> searchResultTiles = [];
    if (searchString.isNotEmpty) {
      searchResultTiles = products
          .where(
              (p) => p.name.toLowerCase().contains(searchString.toLowerCase()))
          .map(
            (p) => ProductTile(product: p),
          )
          .toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onChanged: setSearchString,
        ),
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: searchString.isNotEmpty
          ? GridView.count(
              padding: listViewPadding,
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: .78,
              children: searchResultTiles,
            )
          : ListView(
              padding: listViewPadding,
              children: [
                Text(
                  'Shop by Category',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: fruitsImageUrl,
                  category: fruitsProductCategory,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: vegetablesImageUrl,
                  category: vegetablesProductCategory,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: meatImageUrl,
                  category: meatProductCategory,
                ),
              ],
            ),
    );
  }
}

class CartAppBarAction extends StatefulWidget {
  const CartAppBarAction({Key? key}) : super(key: key);

  @override
  State<CartAppBarAction> createState() => _CartAppBarActionState();
}

class _CartAppBarActionState extends State<CartAppBarAction> {
  // TODO: Setup cart to listen for changes based on your own state management. Could use riverpod, provider, bloc, etc..
  @override
  void initState() {
    cart.addListener(blankSetState);
    super.initState();
  }

  @override
  void dispose() {
    cart.removeListener(blankSetState);
    super.dispose();
  }

  void blankSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
          ),
          if (cart.itemsInCart.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        cart.itemsInCart.length.toString(),
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      onPressed: () => _pushScreen(
        context: context,
        screen: const CartScreen(),
      ),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;

  @override
  void initState() {
    selectedImageUrl = product.imageUrls.first;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imagePreviews = product.imageUrls
        .map(
          (url) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => setSelectedImageUrl(url),
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: selectedImageUrl == url
                      ? Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.75)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  url,
                ),
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            color: kGreyBackground,
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    selectedImageUrl!,
                    fit: BoxFit.cover,
                    color: kGreyBackground,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagePreviews,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${product.cost}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description ??
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Spacer(),
                  Center(
                    child: CallToActionButton(
                      onPressed: () => cart.add(
                        OrderItem(
                          product: product,
                          selectedSize: selectedSize,
                        ),
                      ),
                      labelText: 'Add to Cart',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  const CallToActionButton(
      {required this.onPressed,
      required this.labelText,
      this.minSize = const Size(266, 45),
      Key? key})
      : super(key: key);
  final Function onPressed;
  final String labelText;
  final Size minSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        minimumSize: minSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, Key? key}) : super(key: key);
  final ProductCategory category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

enum Filters { popular, recent, sale }

class _CategoryScreenState extends State<CategoryScreen> {
  ProductCategory get category => widget.category;
  Filters filterValue = Filters.popular;
  String? selection;
  late List<Product> _products;

  @override
  void initState() {
    selection = category.selections.first;
    _products = products.where((p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductRow> productRows = category.selections
        .map((s) => ProductRow(
              productType: s,
              products: _products.toList(),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 18),
        itemCount: productRows.length,
        itemBuilder: (_, index) => productRows[index],
        separatorBuilder: (_, index) => const SizedBox(
          height: 18,
        ),
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  const ProductRow(
      {required this.products, required this.productType, Key? key})
      : super(key: key);
  final String productType;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    List<ProductTile> productTiles =
        products.map((p) => ProductTile(product: p)).toList();

    return productTiles.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Text(
                  productType,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 205,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: productTiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => productTiles[index],
                  separatorBuilder: (_, index) => const SizedBox(
                    width: 24,
                  ),
                ),
              ),
            ],
          );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        _pushScreen(
          context: context,
          screen: ProductScreen(product: product),
        );
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Text(
              '\$${product.cost.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: kGreyBackground,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls.first,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator()),
          color: kGreyBackground,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    cart.addListener(updateState);
  }

  @override
  void dispose() {
    cart.removeListener(updateState);
    super.dispose();
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    List<Widget> orderItemRows = cart.itemsInCart
        .map(
          (item) => Row(
            children: [
              SizedBox(
                width: 125,
                child: ProductImage(
                  product: item.product,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${item.product.cost}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => cart.remove(item),
                color: Colors.red,
              )
            ],
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Column(
          children: [
            const Text('Cart'),
            Text(
              '${cart.itemsInCart.length} items',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          if (orderItemRows.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: orderItemRows.length,
                itemBuilder: (_, index) => orderItemRows[index],
                separatorBuilder: (_, index) => const SizedBox(
                  height: 16,
                ),
              ),
            )
          else
            const Expanded(
              child: Center(
                child: Text('Your cart is empty'),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '\$${cart.totalCost.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                CallToActionButton(
                  onPressed: () {},
                  labelText: 'Check Out',
                  minSize: const Size(220, 45),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {required this.category,
      required this.imageUrl,
      this.imageAlignment = Alignment.center,
      Key? key})
      : super(key: key);
  final String imageUrl;
  final ProductCategory category;

  /// Which part of the image to prefer
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pushScreen(
        context: context,
        screen: CategoryScreen(
          category: category,
        ),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              color: kGreyBackground,
              colorBlendMode: BlendMode.darken,
              alignment: imageAlignment,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({required this.onChanged, Key? key}) : super(key: key);

  final Function(String) onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        controller: _textEditingController,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              kIsWeb ? const EdgeInsets.only(top: 10) : EdgeInsets.zero,
          prefixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: 'Search for a product',
          suffixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          suffixIcon: IconButton(
            constraints: const BoxConstraints(
              minHeight: 36,
              minWidth: 36,
            ),
            splashRadius: 24,
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              _textEditingController.clear();
              widget.onChanged(_textEditingController.text);
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }
}

void _pushScreen({required BuildContext context, required Widget screen}) {
  ThemeData themeData = Theme.of(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Theme(data: themeData, child: screen),
    ),
  );
}
