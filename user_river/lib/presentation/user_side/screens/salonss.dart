import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:zemnanit/presentation/user_side/common_widgets/appbar.dart';
import 'package:zemnanit/presentation/user_side/common_widgets/bottomnav.dart';
import 'login_user.dart';
import 'appointments.dart';
import 'booking.dart';
import 'home.dart';
// import 'home_bf_login.dart' as home;

void main() {
  runApp(ProviderScope(child: ZemnanitApp()));
}

class ZemnanitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salon List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => Home(
              email: '',
            ),
        '/salons': (context) => SalonListScreen(),
        '/appointments': (context) => MyAppointments(),
        '/logout': (context) => Login(),
        '/book': (context) => ZemnanitDrop(),
      },
      home: SalonListScreen(),
    );
  }
}

class SalonListScreen extends ConsumerStatefulWidget {
  const SalonListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SalonListScreen> createState() => SalonListScreenState();
}

class SalonListScreenState extends ConsumerState<SalonListScreen> {
  bool _isLoading = false;
  List salons = [];
  List filteredSalons = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchSalons();
    searchController.addListener(filterSalons);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchSalons() async {
    setState(() {
      _isLoading = true;
    });

    final url = 'http://localhost:3000/salons'; // Replace with your backend URL
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          salons = json.decode(response.body);
          filteredSalons = salons;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load salons')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void filterSalons() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredSalons = salons.where((salon) {
        final salonName = salon['name'].toLowerCase();
        final salonLocation = salon['location'].toLowerCase();
        return salonName.contains(query) || salonLocation.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: MyBottomNavigationBar(),
      backgroundColor: Color(0xFFF1CFC3),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Salons',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, // Adjust the number of items in each row for larger containers
                      childAspectRatio:
                          0.8, // Adjust the aspect ratio to fit your design
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                    ),
                    itemCount: filteredSalons.length,
                    itemBuilder: (context, index) {
                      var salon = filteredSalons[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              15), // Adjusted border radius
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.1), // Shadow color
                              blurRadius: 4, // Shadow blur radius
                              offset: Offset(0, 2), // Shadow offset
                            ),
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Adjusted border radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Adjusted border radius
                                  child: Image.network(
                                    salon[
                                        'picturePath'], // Assuming 'picturePath' is the URL to the salon picture
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  salon['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      salon['location'],
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/book', // Navigate using named route
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                        255, 176, 55, 11), // Background color
                                    textStyle: TextStyle(
                                        color: Colors.white), // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Border radius
                                    ),
                                  ),
                                  child: Text(
                                    'Book Here',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
