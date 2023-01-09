import 'package:flutter/material.dart';
import 'package:plant_dictionary/constants.dart';
import 'package:plant_dictionary/models/plant.dart';
import 'package:plant_dictionary/screens/add_plants.dart';
import 'widgets/plant_widget.dart';

class AddPage extends StatefulWidget {
  final List<Plant> addedPlants;
  const AddPage({Key? key, required this.addedPlants}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedPlants.isEmpty?
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CreatePost()));},
              icon: const Icon( // <-- Icon
                Icons.add,
                size: 50.0,
              ),
              style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.all(Colors.lightGreen),
              ),
              label: const Text('Create Post',
              style: TextStyle( fontSize: 30),), // <-- Text
            ),
            const SizedBox(
              height: 50,
            ),
           SizedBox(
              height: 300,
              child: Image.asset('assets/images/watering.gif'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'You do not have any Plants :(',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.addedPlants.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                        index: index, plantList: widget.addedPlants);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}