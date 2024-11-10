import 'package:flutter/material.dart';
import 'package:weatherlyapp/core/utils/app_images.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';
import 'package:weatherlyapp/Features/Home/Presentation/views/widgets/background_app.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Sample city list for recommendations. Replace this with an API call for dynamic data.
  final List<String> _cityList = [
    'Cairo',
    'New York',
    'Los Angeles',
    'London',
    'Paris',
    'Tokyo',
    'Sydney',
    'Berlin',
    'Rome',
    'Moscow',
    'Dubai',
    'Toronto',
    'Cape Town',
    'Madrid'
  ];

  final TextEditingController _controller = TextEditingController();
  List<String> _filteredCities = [];

  @override
  void initState() {
    super.initState();
    _filteredCities = _cityList; // Initially, show all cities.
  }

  // Filter the city list based on user input
  void _filterCities(String query) {
    final filtered = _cityList
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _filteredCities = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      image: Assets.imagesBackground,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Weather",
                  style: AppStyles.styleBold28.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _controller,
                  onChanged: _filterCities, // Filter cities as user types
                  onFieldSubmitted: (cityName) {
                    Navigator.pop(
                        context, cityName); // Pass city name back to HomeView
                  },
                  style: AppStyles.styleRegular20,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xffFFFFFF).withOpacity(0.4),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Search for a city",
                    hintStyle: AppStyles.styleRegular20,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Text(
                    "Papular Cities",
                    style: AppStyles.styleRegular13,
                  ),
                ),

                // Display filtered cities as suggestions
                Expanded(
                  child: _filteredCities.isEmpty
                      ? const Center(
                          child: Text(
                            "No cities found.",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _filteredCities.length,
                          itemBuilder: (context, index) {
                            final city = _filteredCities[index];
                            return ListTile(
                              title: Text(
                                city,
                                style: AppStyles.styleRegular20.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context,
                                    city); // Pass the selected city back to HomeView
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
