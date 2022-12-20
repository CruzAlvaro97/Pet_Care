import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../providers/storage_list_images_provider.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    final storageListImageProvider =
        Provider.of<StorageListImagesProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),

          (storageListImageProvider.listPathImages.isEmpty)
              ? GestureDetector(
                  onTap: () {
                    storageListImageProvider.activeGalleryAll();
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.black26,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          child: Image.network(
                            'https://www.pngall.com/wp-content/uploads/2/Upload-PNG-Image-File.png',
                          ),
                        ),
                        const SizedBox(height: 7),
                        const Text(
                          'Buscar imagen en galería',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  shrinkWrap: true,
                  itemCount: 1 + storageListImageProvider.listImage!.length,
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: (() {
                          storageListImageProvider.activeGalleryAll();
                        }),
                        child: Container(
                          height: 300,
                          width: 300,
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                child: Image.network(
                                  'https://www.pngall.com/wp-content/uploads/2/Upload-PNG-Image-File.png',
                                ),
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'Agregas otra imagen',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onLongPress: () {
                        print('Se presiono el index: $index');
                        storageListImageProvider.deleteItemList(index - 1);
                      },
                      child: Stack(
                        children: [
                          //Tarjeta pet
                          Container(
                            height: 300,
                            width: 300,
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey[200],
                            ),
                            child: (storageListImageProvider.listImage != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.file(
                                      File(storageListImageProvider
                                          .listImage![index - 1].path),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.photo,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                          ),
                          //Boton eliminar
                          Positioned(
                            right: 10,
                            top: 20,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  storageListImageProvider
                                      .deleteItemList(index - 1);
                                  print('Se presiono el index: $index');
                                },
                                icon: const Icon(
                                  Icons.close_rounded,
                                ),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

          SizedBox(
            height: 10.0,
          ),

          Spacer(),

          ///======
          Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                color: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () {
                  storageListImageProvider.activeGalleryAll();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.photo_album),
                    SizedBox(width: 5),
                    Text('Galería'),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          ///======
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: () {
                //storageListImageProvider.insertListImageStorage();
                storageListImageProvider.saveListImageInDB();

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Se guardó correctamente las imágenes')));
                //storageListImageProvider.activeClean();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'GUARDAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
