import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mysports/authentication/data.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:mysports/authentication/userdetails.dart';
import 'package:mysports/models/ModelProvider.dart';
import 'package:mysports/widgets/sliderimages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _owner_add_details extends StatefulWidget {
  @override
  State<_owner_add_details> createState() => _owner_add_detailsState();
}

class _owner_add_detailsState extends State<_owner_add_details> {
  List<File> images = [];
  bool press = false;
  bool cir = false;
  bool press_but = false;
  LocationData? livelocation;
  LatLng? latLng_loacation;
  List<String> imageurls = [];
  String? address;
  List<bool> selected_sports = [
    true,
    false,
    false,
    false,
    false,
  ];

  pickupimages() async {
    try {
      var files = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );
      if (files != null && files.files.isNotEmpty) {
        for (int i = 0; i < files.files.length; i++) {
          images.add(File(files.files[i].path!));
        }
      }
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> add_images() async {
    for (int i = 0; i < images.length; i++) {
      try {
        final uploadResult = await Amplify.Storage.uploadFile(
          local: images[i],
          key: "myboxcricket/${details.name!}/${i.toString()}",
        );
        final downlod_link = await Amplify.Storage.getUrl(
            key: "myboxcricket/${details.name!}/${i.toString()}");
        imageurls.add(downlod_link.url);
      } on StorageException catch (e) {
        safePrint('Error uploading file: ${e.message}');
        rethrow;
      }
      return true;
    }
    return false;
  }

    bool chek_select() {
      bool a = false;
      for (int i = 0; i < 5; i++) {
        if (selected_sports[i]) {
          a = true;
        }
      }
      return a;
    }

    gohome() async {
      setState(() {
        press_but = true;
      });
      bool a = await add_images();
      if (chek_select() && (a && livelocation != null)) {

      
        // // ignore: use_build_context_synchronously
        // FocusScope.of(context).unfocus();
        // try {
        //   String uid = FirebaseAuth.instance.currentUser!.uid;
        //   await FirebaseFirestore.instance
        //       .collection("user_data")
        //       .doc(uid)
        //       .update(
        //         account(
        //           email: account.email_,
        //           num: account.num_,
        //           fname: account.fname_,
        //           lname: account.lname_,
        //           pass: account.pass_,
        //           user: false,
        //           l_1: latLng_loacation!.latitude.toString(),
        //           l_2: latLng_loacation!.longitude.toString(),
        //           list: account.images,
        //           mysportdata: selected_sports,
        //         ).toJson(),
        //       )
        //       .then((value) => {});
        //   account.mysportdata_ = selected_sports;
        //   SharedPreferences add = await SharedPreferences.getInstance();
        //   for (int i = 0; i < 5; i++) {
        //     add.setBool(account.sports_data![i]['name'], selected_sports[i]);
        //     if (selected_sports[i]) {
        //       await FirebaseFirestore.instance
        //           .collection(account.sports_data![i]['name'])
        //           .doc(uid)
        //           .set(
        //             data_(
        //               uid: uid,
        //               location_1: latLng_loacation!.latitude.toString(),
        //               location_2: latLng_loacation!.longitude.toString(),
        //               images: account.images,
        //             ).toJson(),
        //           )
        //           .then((value) => {});
        //     }
        //   }
        //   // for (int i = 0; i < 6; i++) {
        //   //   if (vehicle[i][1] != 0) {
        //   //     String x = "v_" + (i + 1).toString();
        //   //     await FirebaseFirestore.instance
        //   //         .collection(x)
        //   //         .doc(uid)
        //   //         .set(vehicle_data(
        //   //                 uid: uid,
        //   //                 location_1: latLng_loacation!.latitude.toString(),
        //   //                 location_2: latLng_loacation!.longitude.toString(),
        //   //                 num: int.parse(vehicle[i][1]))
        //   //             .toJson())
        //   //         .then((value) => {});
        //   //   }
        //   // }
        //   // ignore: use_build_context_synchronously
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => const g_home()));
        // } on FirebaseAuthException {
        //   setState(() {
        //     press_but = false;
        //   });
        // } catch (e) {
        //   setState(() {
        //     press_but = false;
        //   });
        //   Fluttertoast.showToast(
        //       msg: "Something Wrong,please try after some time");
        // }
      }
    }

    Future getlocation() async {
      Location location = Location();
      await location
          .getLocation()
          .then((location) => {livelocation = location});
      latLng_loacation =
          LatLng(livelocation!.latitude!, livelocation!.longitude!);
      address = await data.get_address(latLng_loacation!);
      setState(() {
        press = true;
        cir = false;
      });
    }

    @override
    void initState() {
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "Enter your details",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    images.isNotEmpty
                        ? sliderimages(
                            images: images,
                          )
                        : GestureDetector(
                            onTap: (() {
                              pickupimages();
                            }),
                            child: DottedBorder(
                              color: Theme.of(context).primaryColor,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              strokeCap: StrokeCap.round,
                              dashPattern: const [10, 4],
                              child: SizedBox(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_open,
                                      size: 35,
                                    ),
                                    // widget.update
                                    //     ? Text(
                                    //         "Add more Product Images",
                                    //         style: TextStyle(
                                    //           fontSize: 15,
                                    //           fontWeight: FontWeight.w500,
                                    //           color:
                                    //               Theme.of(context).primaryColor,
                                    //         ),
                                    //       )
                                    //     :
                                    Text(
                                      "Select Product Images",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Select Sports",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.sports_data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: InkWell(
                              onTap: () {
                                selected_sports[index] =
                                    !selected_sports[index];
                                setState(() {});
                              },
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: selected_sports[index] ? 3 : 0,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: Image.asset(
                                        data.sports_data[index]['image']),
                                    title: Text(
                                      data.sports_data[index]['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    // subtitle: Text(
                                    //   account.data_vehicle![index]['desc'],
                                    //   style: const TextStyle(
                                    //     color: Colors.black,
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    // widget.update
                    //     ? Container()
                    //     :
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Parking Place Location",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            press == false
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        getlocation();
                                        cir = true;
                                      });
                                    },
                                    child: const Text(
                                        "Tap to add your live Location"),
                                  )
                                : Text(address!),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    press_but
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ))
                        : Center(
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  gohome();
                                },
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    // widget.update ? 'Update' :
                                    'Add Details',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: cir == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ))
                  : Container(),
            )
          ],
        ),
      );
    }
  }
}
