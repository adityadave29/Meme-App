import 'package:flutter/material.dart';
import 'package:meme_app/controller/fetchMeme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imageurl = "";
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    UpdateImage();
  }

  void UpdateImage() async {
    String getImage = await FetchMeme.fetchNewMeme();
    setState(() {
      imageurl = getImage;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Text(
              "MEMES",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            isLoading
                ? const SizedBox(
                    height: 400,
                    width: 320,
                    child: Center(
                        child: SizedBox(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator())))
                : Image.network(height: 420, width: 320, imageurl),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                UpdateImage();
              },
              style: const ButtonStyle(),
              child: const Text(
                "More Fun!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "Created by Dave",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Inspired by 'Code with Dhruv'",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
