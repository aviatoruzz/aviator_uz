import 'package:aviatoruz/core/constant/network_service_const.dart';
import 'package:aviatoruz/feature/meteologiya/view_model/add_topic_controller.dart';
import 'package:aviatoruz/feature/meteologiya/view_model/meteo_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ADDMavzu extends ConsumerWidget {
  const ADDMavzu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(addTopicController);
    var con = ref.read(addTopicController);
    ref.watch(meteoTopicProvider);
    var conMeteo = ref.read(meteoTopicProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFFFFFFF),
        title: const Text("Add a new topic"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    con.getImage(ImageSource.gallery);
                  } catch (e) {
                    debugPrint("Bomadi brat");
                  }
                },
                child: con.image == null
                    ? Image.asset(
                        "assets/images/add_image.png",
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Image.file(
                            con.image!,
                            width: double.maxFinite,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Topic name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: con.nameContrl,
                style: const TextStyle(
                  fontSize: 22,
                ),
                decoration: const InputDecoration(
                  label: Text("name"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    con.getImageSecond(ImageSource.gallery);
                  } catch (e) {
                    debugPrint("Bomadi brat");
                  }
                },
                child: con.imageSecond == null
                    ? Image.asset(
                        "assets/images/add_image.png",
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Image.file(
                            con.imageSecond!,
                            width: double.maxFinite,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Topic Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: double.maxFinite,
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: null,
                  controller: con.discCtrl,
                  decoration: const InputDecoration(
                      hintText: "Write a description",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: CupertinoButton(
                  color: Colors.blue,
                  child: const Text("Create"),
                  onPressed: () {
                    conMeteo
                        .uplodItes(
                      title: con.nameContrl.text,
                      imageUrls: con.imageUrls,
                      patternPath: "MeteoTopic",
                      imagePath: NetworkServiceConst.meteoTopicsImage,
                      imagePathSecond:
                          NetworkServiceConst.meteoTopicsImageDetail,
                      path: NetworkServiceConst.meteoTopicsName,
                      description: con.discCtrl.text,
                      imageFile: con.image!,
                      imageFileSecond: con.imageSecond!,
                    )
                        .then(
                      (value) {
                        Navigator.pop(context);
                        con.discCtrl.clear();
                        con.nameContrl.clear();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
