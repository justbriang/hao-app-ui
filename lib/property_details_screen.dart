import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hao_app/routing/app_routes.dart';
import 'package:hao_app/widgets/gradient_button.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({super.key});
  static MaterialPage page() {
    return MaterialPage(
      name: AppRoutes.propertyDetails,
      key: ValueKey(AppRoutes.propertyDetails),
      child: const PropertyDetailsScreen(),
    );
  }

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<String> filterButtons = [
    "3 Bedroom",
    "2 Bathroom",
    "1 Kitchen",
    "2 Balconies"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://images.pexels.com/photos/808465/pexels-photo-808465.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            imageBuilder: (context, imageProvider) => Container(
              width: size.width,
              height: size.height,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.black12, BlendMode.color)),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),

          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Text(
                          "Regency House",
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Westlands, Kenya",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(fontSize: 16),
                            ),
                            Text(
                              "\$550/m",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: filterButtons.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GradientButton(
                                title: filterButtons[index],
                                width: size.width * .3,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: GradientButton(
                          title: "Book Viewing",
                          height: 45,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   child: )
        ],
      ),
    );
  }
}
