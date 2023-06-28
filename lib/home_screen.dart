import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hao_app/routing/app_routes.dart';
import 'package:hao_app/routing/app_state_manager.dart';
import 'package:hao_app/widgets/gradient_button.dart';
import 'package:hao_app/widgets/horizontal_property_card.dart';
import 'package:hao_app/widgets/white_button.dart';
import 'package:hao_app/widgets/property_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static MaterialPage page() {
    return MaterialPage(
      name: AppRoutes.home,
      key: ValueKey(AppRoutes.home),
      child: const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filterButtons = ["Home", "Apartment", "Hotel", "Office", "Camp"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: theme.colorScheme.background),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Hi Brian",
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Tenant",
                              // style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                // colorFilter: const ColorFilter.mode(
                                //     Colors.transparent, BlendMode.color),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          labelText: "Search...",
                          suffixIcon: IconButton(
                              onPressed: () {
                                // Focus.of(context).dispose();
                              },
                              icon: const Icon(Icons.filter_list)),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(6),
                    scrollDirection: Axis.horizontal,
                    itemCount: filterButtons.length,
                    itemBuilder: (context, index) {
                      return (index == 0)
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GradientButton(
                                title: filterButtons[index],
                                width: size.width * .3,
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: WhiteButton(
                                title: filterButtons[index],
                                width: size.width * .3,
                              ),
                            );
                    },
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular",
                            style: theme.textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                     const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: const Text("See All")),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * .8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(6),
                        scrollDirection: Axis.horizontal,
                        itemCount: filterButtons.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Provider.of<AppStateManager>(context,
                                      listen: false)
                                  .setGoToPropertyDetailsScreen = true;
                            },
                            child: PropertyCard(
                              height: size.width * .6,
                              width: size.width * .6,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text(
                        "For You",
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HorizontalPropertyCard(),
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
