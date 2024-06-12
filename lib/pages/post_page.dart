import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/post.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? _selectedCategory;
  double _rating = 0;
  String currentLocation = '';

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.'
      );
    }

    Position position = await Geolocator.getCurrentPosition();
    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(position.latitude, position.longitude);
    geocoding.Placemark place = placemarks[0];
    setState(() {
      currentLocation = '${place.locality}, ${place.country}';
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Name:', style: TextStyle(fontSize: 16)),
            // Label for the name field
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter post name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Select Category:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedCategory,
              hint: const Text('Choose a category'),
              isExpanded: true,
              items: <String>['Restaurant', 'Entertainment', 'Attraction']
                  .map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Rating:', style: TextStyle(fontSize: 16)),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Description:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _createPost,
                child: const Text('Create Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createPost() {
    if (_selectedCategory != null && _rating != 0 &&
        _descriptionController.text.isNotEmpty &&
        _nameController.text.isNotEmpty) {
      Post newPost = Post(
          name: _nameController.text,
          category: _selectedCategory!,
          rating: _rating,
          description: _descriptionController.text,
          location: currentLocation
      );
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: const Text('Post Created'),
              content: Text(
                'Name: ${newPost.name}\nCategory: ${newPost
                    .category}\nRating: ${newPost
                    .rating}\nDescription: ${newPost
                    .description}\nLocation: ${newPost.location}',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } else {
      // Optionally handle the case where not all fields are filled
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: const Text('Error'),
              content: const Text('Please fill in all fields.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }
}