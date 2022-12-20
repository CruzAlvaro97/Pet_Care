import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase/supabase.dart';
import 'package:http/http.dart' as http;

class StorageListImagesProvider with ChangeNotifier {
  File? image;
  File? image2;

  List<XFile>? listImage = [];

  List<String> listNameImages = [];
  List<String> listPathImages = [];

  String? nameImage;

  String urlBase = 'https://fslzamfhjgiawfieozfn.supabase.co/rest/v1/producto';
  String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzbHphbWZoamdpYXdmaWVvemZuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMjYxMjksImV4cCI6MTk4NjYwMjEyOX0.bEvYpTInVtzpwoRAJD70Rr-Ylc2Fcy_lptbcYvUkRwY';
  String authorization =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzbHphbWZoamdpYXdmaWVvemZuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMjYxMjksImV4cCI6MTk4NjYwMjEyOX0.bEvYpTInVtzpwoRAJD70Rr-Ylc2Fcy_lptbcYvUkRwY';

  //Supabase
  final SupabaseClient client = SupabaseClient(
    'https://fslzamfhjgiawfieozfn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzbHphbWZoamdpYXdmaWVvemZuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMjYxMjksImV4cCI6MTk4NjYwMjEyOX0.bEvYpTInVtzpwoRAJD70Rr-Ylc2Fcy_lptbcYvUkRwY',
  );

  //=======================================================================
  //API

  Future<String> saveImageInDB() async {
    final url = Uri.parse(urlBase);
    String msg;

    Map<String, String> headers = {
      'apiKey': apiKey,
      'Authorization': authorization,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    };

    final body = jsonEncode({
      "nombre": "Grupo 1",
      "descripcion": "Prueba demo",
      "precio": 2.3,
      "sub_categoria_id": 1,
      "img": nameImage,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode != 201) {
      msg = 'No se guardó correctamente';
      return msg;
    } else {
      msg = 'Se guardó correctamente ';
      insertImageStorage();
    }

    notifyListeners();
    return msg;
  }

  //=======================================================================

  //=======================================================================
  //API2

  Future<String> saveListImageInDB() async {
    final url = Uri.parse(urlBase);
    String msg;

    //Convertir a json lista de nombre
    String jsonData = jsonEncode(listNameImages);

    Map<String, String> headers = {
      'apiKey': apiKey,
      'Authorization': authorization,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    };

    final body = jsonEncode({
      "nombre": "Prueba3",
      "descripcion": "Prueba demo 3",
      "precio": 2.3,
      "sub_categoria_id": 2,
      "img": 'other_img 3',
      "lista_img": listNameImages,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode != 201) {
      msg = 'No se guardó correctamente';
      return msg;
    } else {
      msg = 'Se guardó correctamente ';
      insertListImageStorage();
    }

    notifyListeners();
    return msg;
  }

  //=======================================================================

  //Subir imagen
  Future insertImageStorage() async {
    final file = File(image!.path);

    final ruta0 =
        '/data/user/0/com.example.image_picker_supabase/cache/$nameImage';
    final ruta1 = image!.path.replaceAll(
        '/data/user/0/com.example.image_picker_supabase/cache', 'IMG');
    final ruta2 = image!.path.replaceAll(
        '/data/user/0/com.example.image_picker_supabase/app_flutter', 'IMG');

    final newPath = (image!.path == ruta0) ? ruta1 : ruta2;

    final response = await client.storage.from('grupo1').upload(newPath, file);

    print(response);
    notifyListeners();
  }

  //Upload list images in storage
  Future insertListImageStorage() async {
    for (var i = 0; i < listNameImages.length; i++) {
      final file = File(listImage![i].path);
      final posicionPath = listPathImages[i];

      final ruta0 =
          '/data/user/0/com.example.image_picker_supabase/cache/${listNameImages[i]}';

      final ruta1 = posicionPath.replaceAll(
          '/data/user/0/com.example.image_picker_supabase/cache', 'IMG');

      final ruta2 = posicionPath.replaceAll(
          '/data/user/0/com.example.image_picker_supabase/app_flutter', 'IMG');

      final newPath = (posicionPath == ruta0) ? ruta1 : ruta2;

      final response =
          await client.storage.from('grupo1').upload(newPath, file);
    }

    // final ruta0 =
    //     '/data/user/0/com.example.image_picker_supabase/cache/$nameImage';
    // final ruta1 = image!.path.replaceAll(
    //     '/data/user/0/com.example.image_picker_supabase/cache', 'IMG');
    // final ruta2 = image!.path.replaceAll(
    //     '/data/user/0/com.example.image_picker_supabase/app_flutter', 'IMG');

    // final newPath = (image!.path == ruta0) ? ruta1 : ruta2;

    //final response = await client.storage.from('grupo1').upload(newPath, file);
    //activeClean();
    notifyListeners();
  }

  //List images picker
  Future activeGalleryAll() async {
    //final image = await ImagePicker().pickImage(source: ImageSource.camera);

    final selectedImage = await ImagePicker().pickMultiImage();

    if (selectedImage.isNotEmpty) {
      listImage!.addAll(selectedImage);
    }

    for (var i = 0; i < selectedImage.length; i++) {
      final imageTemp = File(selectedImage[i].path);
      nameImage = selectedImage[i].name;
      listNameImages.add(nameImage!);

      listPathImages.add(imageTemp.path);

      //print(listPathImages);
      //print('Ruta galeria => $imageTemp');
      image2 = imageTemp;
    }

    print(listNameImages);

    //if (image == null) return;

    //final imageTemp = File(image.path);

    //Nombre del archivo
    //nameImage = image.name;

    //print('Ruta camara: $imageTemp');
    // print(nameImage);

    //this.image = imageTemp;
    //insertListImageStorage();

    notifyListeners();
  }

  //Galeria
  Future activeGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imageTemp = File(image.path);

    //Nombre del archivo
    nameImage = image.name;

    this.image = imageTemp;

    print('Ruta galería: $imageTemp');
    print(nameImage);

    notifyListeners();
  }

  //
  activeClean() {
    listImage = null;
    listNameImages = [];
    listPathImages = [];
    notifyListeners();
  }

  //Delete image of the list
  deleteItemList(int value) {
    listImage!.removeAt(value);
    listNameImages.removeAt(value);
    listPathImages.removeAt(value);
    notifyListeners();
  }
}
