// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:another_stepper/another_stepper.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:list_picker/list_picker.dart';
import 'package:pet_society/src/models/especie_model.dart';
import 'package:pet_society/src/models/raza_model.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/providers/especie_provider.dart';
import 'package:pet_society/src/providers/raza_provider.dart';
import 'package:pet_society/src/providers/storage_list_images_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';
import 'package:provider/provider.dart';

class FormAdoptationPage extends StatefulWidget {
  const FormAdoptationPage({super.key});

  @override
  State<FormAdoptationPage> createState() => _FormAdoptationPageState();
}

class _FormAdoptationPageState extends State<FormAdoptationPage> {
  bool statusVacunado = false;
  bool statusDesparasitado = false;
  bool statusSano = false;
  bool statusEsterelizado = false;
  bool statusOtrasOperaciones = false;
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controllerEdad;
  late TextEditingController _controllerNombre;
  late TextEditingController _controllerDesc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: '');
    _controller2 = TextEditingController(text: '');
    _controllerDesc = TextEditingController(text: '');
    _controllerEdad = TextEditingController(text: '');
    _controllerNombre = TextEditingController(text: '');
  }

  bool isChecked = false;
  int currentIndex = 0;
  List<StepperData> stepperData = [
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: CustomColor.primary.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
          child: Text(
        '1',
        style: CustomTextStyle.text,
      )),
    )),
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: CustomColor.primary.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
          child: Text(
        '2',
        style: CustomTextStyle.text,
      )),
    )),
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: CustomColor.primary.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
          child: Text(
        '3',
        style: CustomTextStyle.text,
      )),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    final storageListImageProvider =
        Provider.of<StorageListImagesProvider>(context);
    final controller = GroupButtonController();
    final serviceProvider2 = Provider.of<EspecieProvider>(context);
    final razaProvider2 = Provider.of<RazaProvider>(context);
    return Scaffold(
      backgroundColor: CustomColor.white2,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Crear publicación - Adopción",
          style: CustomTextStyle.text2.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.horizontal,
                gap: 30,
                iconWidth: 40,
                iconHeight: 40,
                activeBarColor: CustomColor.primary.withOpacity(0.3),
                inActiveBarColor: Colors.grey,
                activeIndex: currentIndex,
                barThickness: 4,
              ),
            ),
            (currentIndex == 0)
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nombre',
                          style: CustomTextStyle.text2
                              .copyWith(color: CustomColor.grey, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: Preferences.name,
                          onChanged: (value) {
                            Preferences.name = value;
                            setState(() {
                              print(Preferences.name);
                            });
                          },
                          style: TextStyle(color: Colors.black),
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          decoration: formDecorationWidget(
                            hintText: 'Ingrese un nombre',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Especie',
                          style: CustomTextStyle.text2
                              .copyWith(color: CustomColor.grey, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: TextEditingController(
                                    text: serviceProvider2.especieSelected),
                                style: TextStyle(color: Colors.black),
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                                decoration: formDecorationWidget(
                                  hintText: 'Selecciona una especie',
                                ),
                              ),
                            ),
                            MaterialButton(
                              minWidth: 50,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: CustomColor.primary,
                              onPressed: () async {
                                final especieService =
                                    Provider.of<EspecieProvider>(context,
                                        listen: false);

                                // String? fruit = await showPickerDialog(
                                //   context: context,
                                //   label: "Fruit",
                                //   items: const ["Apple", "Banana", "Orange", "Pineapple"],
                                // );

                                String? especieSele = await showPickerDialog(
                                  context: context,
                                  label: "Especies",
                                  items: especieService.listaEspecies
                                      .map((especie) => especie.nombre)
                                      .toList(),
                                );
                                if (especieSele == null) {
                                  especieService.cambiarSeleccion = '';
                                }
                                try {
                                  especieService.cambiarSeleccion =
                                      especieSele!;
                                } catch (e) {}

                                int idEspecie = 0;

                                for (Especie especie
                                    in especieService.listaEspecies) {
                                  if (especie.nombre == especieSele) {
                                    idEspecie = especie.id;
                                    print(idEspecie);
                                  }
                                }

                                final razaService = Provider.of<RazaProvider>(
                                    context,
                                    listen: false);

                                List<Raza> razasFiltradas = razaService
                                    .listaRazas
                                    .where(
                                        (raza) => raza.especieId == idEspecie)
                                    .toSet()
                                    .toList();
                                razaService.cambiarSeleccion = '---';
                                razaService.cambiarListaRazas = razasFiltradas;
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Raza',
                          style: CustomTextStyle.text2
                              .copyWith(color: CustomColor.grey, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: TextEditingController(
                                    text: razaProvider2.razaSelected),
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                                decoration: formDecorationWidget(
                                  hintText: 'Selecciona una raza',
                                ),
                              ),
                            ),
                            MaterialButton(
                              minWidth: 50,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: CustomColor.primary,
                              onPressed: () async {
                                final razaService = Provider.of<RazaProvider>(
                                    context,
                                    listen: false);
                                List<String> listaVacia = [
                                  'Por favor selecciona una especie'
                                ];
                                String? razaSele = await showPickerDialog(
                                  context: context,
                                  label: "Especies",
                                  items: razaService.listaRazasFiltradas.isEmpty
                                      ? listaVacia
                                      : razaService.listaRazasFiltradas
                                          .map((raza) => raza.nombre)
                                          .toList(),
                                );
                                try {
                                  razaService.cambiarSeleccion =
                                      razaSele! == null ? 'No hay' : razaSele;
                                } catch (e) {}
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Sexo:',
                          style: CustomTextStyle.text2
                              .copyWith(color: CustomColor.grey, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      value: isChecked,
                                      activeColor: CustomColor.primary,
                                      checkColor: CustomColor.primary,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                      },
                                    ),
                                    Text('Masculino'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 24),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      value: isChecked,
                                      activeColor: CustomColor.primary,
                                      checkColor: CustomColor.primary,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                      },
                                    ),
                                    Text('Femenino'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Edad',
                          style: CustomTextStyle.text2
                              .copyWith(color: CustomColor.grey, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: TextEditingController(text: ''),
                          style: TextStyle(color: Colors.black),
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: formDecorationWidget(
                            hintText: 'Ingrese su edad',
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ))
                : (currentIndex == 1)
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Descripción del post',
                              style: CustomTextStyle.text2.copyWith(
                                  color: CustomColor.grey, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: TextEditingController(text: ''),
                              maxLines: null,
                              maxLength: 600,
                              style: TextStyle(color: Colors.black),
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: formDecorationWidget(
                                hintText: 'Ingrese un nombre',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '¿Cómo lo entregan a la mascota?',
                              style: CustomTextStyle.text2.copyWith(
                                  color: CustomColor.grey, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CheckboxListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              title: Text(
                                'Vacunado',
                                style: GoogleFonts.poppins(
                                  color: statusVacunado
                                      ? CustomColor.primary
                                      : Colors.black,
                                  fontWeight: statusVacunado
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              checkColor: Colors.white,
                              activeColor: CustomColor.primary,
                              value: statusVacunado,
                              onChanged: (value) {
                                setState(() {
                                  statusVacunado = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              title: Text(
                                'Desparasitado',
                                style: GoogleFonts.poppins(
                                  color: statusDesparasitado
                                      ? CustomColor.primary
                                      : Colors.black,
                                  fontWeight: statusDesparasitado
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              checkColor: Colors.white,
                              activeColor: CustomColor.primary,
                              value: statusDesparasitado,
                              onChanged: (value) {
                                setState(() {
                                  statusDesparasitado = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              value: statusSano,
                              title: Text(
                                'Sano',
                                style: GoogleFonts.poppins(
                                  color: statusSano
                                      ? CustomColor.primary
                                      : Colors.black,
                                  fontWeight: statusSano
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              checkColor: Colors.white,
                              activeColor: CustomColor.primary,
                              onChanged: (value) {
                                setState(() {
                                  statusSano = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              value: statusEsterelizado,
                              title: Text(
                                'Esterilizado',
                                style: GoogleFonts.poppins(
                                  color: statusEsterelizado
                                      ? CustomColor.primary
                                      : Colors.black,
                                  fontWeight: statusEsterelizado
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              checkColor: Colors.white,
                              activeColor: CustomColor.primary,
                              onChanged: (value) {
                                setState(() {
                                  statusEsterelizado = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              value: statusOtrasOperaciones,
                              title: Text(
                                'Otras operaciones',
                                style: GoogleFonts.poppins(
                                  color: statusOtrasOperaciones
                                      ? CustomColor.primary
                                      : Colors.black,
                                  fontWeight: statusOtrasOperaciones
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              checkColor: Colors.white,
                              activeColor: CustomColor.primary,
                              onChanged: (value) {
                                setState(() {
                                  statusOtrasOperaciones = value!;
                                });
                              },
                            ),
                          ],
                        ))
                    : Container(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),

                            (storageListImageProvider.listPathImages.isEmpty)
                                ? GestureDetector(
                                    onTap: () {
                                      storageListImageProvider
                                          .activeGalleryAll();
                                    },
                                    child: Container(
                                      height: 100,
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 1,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: 1 +
                                        storageListImageProvider
                                            .listImage!.length,
                                    physics: BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    itemBuilder: (context, index) {
                                      if (index == 0) {
                                        return GestureDetector(
                                          onTap: (() {
                                            storageListImageProvider
                                                .activeGalleryAll();
                                          }),
                                          child: Container(
                                            height: 300,
                                            width: 300,
                                            margin: const EdgeInsets.only(
                                                top: 10.0, bottom: 10.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: Colors.grey[200],
                                              border: Border.all(
                                                color: Colors.black26,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      return GestureDetector(
                                        onLongPress: () {
                                          print('Se presiono el index: $index');
                                          storageListImageProvider
                                              .deleteItemList(index - 1);
                                        },
                                        child: Stack(
                                          children: [
                                            //Tarjeta pet
                                            Container(
                                              height: 300,
                                              width: 300,
                                              margin: const EdgeInsets.only(
                                                  top: 10.0, bottom: 10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                color: Colors.grey[200],
                                              ),
                                              child: (storageListImageProvider
                                                          .listImage !=
                                                      null)
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.file(
                                                        File(
                                                            storageListImageProvider
                                                                .listImage![
                                                                    index - 1]
                                                                .path),
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
                                                        .deleteItemList(
                                                            index - 1);
                                                    print(
                                                        'Se presiono el index: $index');
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

                            ///======
                            Visibility(
                              visible: false,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  color: Colors.purple,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
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
                            Visibility(
                              visible: false,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  color: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  onPressed: () {
                                    //storageListImageProvider.insertListImageStorage();
                                    storageListImageProvider
                                        .saveListImageInDB();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Se guardó correctamente las imágenes')));
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
                            ),

                            SizedBox(height: 20),
                          ],
                        ),
                      )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(
                height: 60,
                minWidth: 150,
                elevation: 0.5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Atrás',
                  style: CustomTextStyle.text.copyWith(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    if (currentIndex >= 1) {
                      currentIndex--;
                    }
                    return;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: MaterialButton(
                height: 60,
                minWidth: 150,
                elevation: 0.5,
                color: CustomColor.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Siguiente',
                  style: CustomTextStyle.text.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    if (currentIndex <= 1) {
                      currentIndex++;
                    }
                    return;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
