import 'package:dinedash/services/directus_service.dart';
import 'package:dinedash/widgets/store_card.dart';
import 'package:flutter/material.dart';

import '../models/stores.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  StoresScreenState createState() => StoresScreenState();
}

class StoresScreenState extends State<StoresScreen> {
  late Future<List<Store>> _futureStores;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _futureStores = DirectusService().getStores();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search by name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Store>>(
                  future: _futureStores,
                  builder: (context, AsyncSnapshot<List<Store>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final stores = snapshot.data!;
                      final List<Store> filteredStores = _searchQuery.isEmpty
                          ? stores
                          : stores
                              .where(
                                  (store) => store.name.toLowerCase().contains(
                                        _searchQuery.toLowerCase(),
                                      ))
                              .toList();
                      return SizedBox(
                        width: 500,
                        child: ListView.builder(
                            itemCount: filteredStores.length,
                            itemBuilder: (context, index) {
                              Store store = filteredStores[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: StoreCard(
                                  imageUrl:
                                      "http://192.168.1.111:8055/assets/${store.background}",
                                  avatarUrl:
                                      "http://192.168.1.111:8055/assets/${store.logo}",
                                  bigText: store.name,
                                  smallText:
                                      "${store.streetName ?? ""}, ${store.suburb ?? ""}",
                                ),
                              );
                            }),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
