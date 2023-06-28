import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// TODO: Replace 
class HorizontalPropertyCard extends StatelessWidget {
  const HorizontalPropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl:
            'https://images.pexels.com/photos/808465/pexels-photo-808465.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        imageBuilder: (context, imageProvider) => Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black12, BlendMode.color)),
          ),
        ),
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
      title: Text(
        "Regency House",
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [Text("Kilimani"), Text("\$400/m")],
      ),
    );
  }
}
