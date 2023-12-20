import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project/provider/favourite_provider.dart';
import 'package:state_management_project/screen/favourite/myfavourite_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFavouriteScreen(),
                ),
              );
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.favouirteItems.contains(index)) {
                        value.removeItems(index);
                      } else {
                        value.addItems(index);
                      }
                    },
                    title: Text('Item $index'),
                    trailing: Icon(value.favouirteItems.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
