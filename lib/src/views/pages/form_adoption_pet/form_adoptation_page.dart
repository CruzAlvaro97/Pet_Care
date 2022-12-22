// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:another_stepper/another_stepper.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:list_picker/list_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_society/src/models/especie_model.dart';
import 'package:pet_society/src/models/raza_model.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/providers/especie_provider.dart';
import 'package:pet_society/src/providers/raza_provider.dart';
import 'package:pet_society/src/providers/storage_list_images_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/form_adoption_pet/prev/previsualizacion_post_page.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';
import 'package:provider/provider.dart';

class FormAdoptationPage extends StatefulWidget {
  final String tipoPost;

  const FormAdoptationPage({super.key, required this.tipoPost});

  @override
  State<FormAdoptationPage> createState() => _FormAdoptationPageState();
}

class _FormAdoptationPageState extends State<FormAdoptationPage> {
  Map<String, bool> estado_mascota_map = Map.fromIterable(
      ['vacunado', 'desparasitado', 'sano', 'esterilizado', 'otras'],
      value: (item) => false);

  List<String> selectedCaracteristicas = [];

  List<String> caracteristicas = [
    'Obediente',
    'Juega con otras mascotas',
    'Bueno con niños',
    'Cariñoso',
    'Bueno con gatos',
    'Amigable con extraños'
  ];
  List<bool> values = [false, false, false, false, false, false];

  bool statusVacunado = false;
  bool statusDesparasitado = false;
  bool statusSano = false;
  bool statusEsterelizado = false;
  bool statusOtrasOperaciones = false;

  bool isCheckedMale = false;
  bool isCheckedFemale = false;
  int currentIndex = 0;
  List<StepperData> stepperData = [
    StepperData(
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CustomColor.primary.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            '1',
            style: CustomTextStyle.text.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CustomColor.primary.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            '2',
            style: CustomTextStyle.text.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    StepperData(
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CustomColor.primary.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            '3',
            style: CustomTextStyle.text.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.tipoPost);

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
        actions: [
          // IconButton(
          //   onPressed: () {
          //     storageListImageProvider.insertListImageStorage();
          //   },
          //   icon: Icon(
          //     Icons.abc,
          //     color: Colors.black,
          //   ),
          // ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                              .copyWith(color: CustomColor.grey, fontSize: 18),
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
                          style: GoogleFonts.poppins(color: Colors.black),
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
                              .copyWith(color: CustomColor.grey, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 280,
                              child: TextFormField(
                                keyboardType: TextInputType.none,
                                controller: TextEditingController(
                                    text: serviceProvider2.especieSelected),
                                style: GoogleFonts.poppins(color: Colors.black),
                                autocorrect: false,
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
                              .copyWith(color: CustomColor.grey, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 280,
                              child: TextFormField(
                                style: GoogleFonts.poppins(color: Colors.black),
                                controller: TextEditingController(
                                    text: razaProvider2.razaSelected),
                                autocorrect: false,
                                keyboardType: TextInputType.none,
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
                                  'Por favor selecciona una raza'
                                ];
                                String? razaSele = await showPickerDialog(
                                  context: context,
                                  label: "Razas",
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

                                int idBreed = 0;

                                for (Raza raza in razaProvider2.listaRazas) {
                                  if (raza.nombre == razaSele) {
                                    idBreed = raza.id;
                                    Preferences.breed = idBreed;

                                    print(Preferences.breed);
                                  }
                                }
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
                              .copyWith(color: CustomColor.grey, fontSize: 18),
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
                                    Transform.scale(
                                      scale: 0.9,
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        value: isCheckedMale,
                                        activeColor: CustomColor.primary,
                                        checkColor: CustomColor.primary,
                                        onChanged: (value) {
                                          setState(() {
                                            isCheckedMale = !isCheckedMale;
                                            isCheckedFemale = false;
                                            Preferences.gender = 1;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      'Macho',
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 24),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: 0.9,
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        value: isCheckedFemale,
                                        activeColor: CustomColor.primary,
                                        checkColor: CustomColor.primary,
                                        onChanged: (value) {
                                          setState(() {
                                            isCheckedFemale = !isCheckedFemale;
                                            isCheckedMale = false;
                                            Preferences.gender = 2;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      'Hembra',
                                      style: GoogleFonts.poppins(),
                                    ),
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
                              .copyWith(color: CustomColor.grey, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: Preferences.age,
                          style: GoogleFonts.poppins(color: Colors.black),
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: formDecorationWidget(
                            hintText: 'Ingrese su edad',
                          ),
                          onChanged: (value) {
                            Preferences.age = value;
                            setState(() {
                              print(Preferences.age);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Tamaño',
                          style: CustomTextStyle.text2
                              .copyWith(color: CustomColor.grey, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: Preferences.size,
                          style: GoogleFonts.poppins(color: Colors.black),
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: formDecorationWidget(
                            hintText: 'Ejm: Mediano',
                          ),
                          onChanged: (value) {
                            Preferences.size = value;
                            setState(() {
                              print(Preferences.age);
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Peso',
                          style: CustomTextStyle.text2
                              .copyWith(color: CustomColor.grey, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: Preferences.weigth,
                          style: GoogleFonts.poppins(color: Colors.black),
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: formDecorationWidget(
                            hintText: 'Ingrese peso',
                          ),
                          onChanged: (value) {
                            Preferences.weigth = value;
                            setState(() {
                              print(Preferences.weigth);
                            });
                          },
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ))
                : (currentIndex == 1)
                    ? Container(
                        key: Key('2'),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Descripción del post',
                              style: CustomTextStyle.text2.copyWith(
                                  color: CustomColor.grey, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: Preferences.description,
                              onChanged: (value) {
                                Preferences.description = value;
                                setState(() {});
                              },
                              maxLines: null,
                              maxLength: 600,
                              style: GoogleFonts.poppins(color: Colors.black),
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: formDecorationWidget(
                                hintText: 'Ingrese la descripción del post',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '¿Cómo lo entregan a la mascota?',
                              style: CustomTextStyle.text2.copyWith(
                                  color: CustomColor.grey, fontSize: 18),
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
                                  estado_mascota_map['vacunado'] = value;
                                  print(estado_mascota_map);
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
                                  estado_mascota_map['desparasitado'] = value;
                                  print(estado_mascota_map);
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
                                  estado_mascota_map['sano'] = value;
                                  print(estado_mascota_map);
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
                                  estado_mascota_map['esterilizado'] = value;
                                  print(estado_mascota_map);
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
                                  estado_mascota_map['otras'] = value;
                                  print(estado_mascota_map);
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Características de la mascota',
                              style: CustomTextStyle.text2.copyWith(
                                  color: CustomColor.grey, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                              itemCount: caracteristicas.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  activeColor: CustomColor.primary,
                                  title: Text(
                                    caracteristicas[index],
                                    style: GoogleFonts.poppins(
                                      color: values[index]
                                          ? CustomColor.primary
                                          : Colors.black,
                                      fontWeight: values[index]
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  value: values[index],
                                  onChanged: (newValue) {
                                    setState(() {
                                      values[index] = newValue!;
                                      if (newValue) {
                                        selectedCaracteristicas
                                            .add(caracteristicas[index]);

                                        print(selectedCaracteristicas);
                                      } else {
                                        selectedCaracteristicas
                                            .remove(caracteristicas[index]);

                                        print(selectedCaracteristicas);
                                      }
                                    });
                                  },
                                );
                              },
                            )
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
                                      height: 150,
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                      decoration:
                                          containerDecoration().copyWith(
                                        border: Border.all(
                                          color: CustomColor.grey
                                              .withOpacity(0.15),
                                          width: 2,
                                        ),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Lottie.asset(
                                          'assets/images/upload.json',
                                          fit: BoxFit.cover,
                                        ),
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
                                            decoration:
                                                containerDecoration().copyWith(
                                              border: Border.all(
                                                color: CustomColor.grey
                                                    .withOpacity(0.15),
                                                width: 2,
                                              ),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                'assets/images/upload.json',
                                                fit: BoxFit.cover,
                                              ),
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
                                                      child: Container(
                                                        decoration:
                                                            containerDecoration(),
                                                        child: Image.file(
                                                          File(
                                                              storageListImageProvider
                                                                  .listImage![
                                                                      index - 1]
                                                                  .path),
                                                          fit: BoxFit.cover,
                                                        ),
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
                                    // storageListImageProvider
                                    //     .saveListImageInDB();

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
              child: // Login Button
                  CustomButtonWidget(
                text: 'Atrás',
                textStyle: CustomTextStyle.text2.copyWith(color: Colors.black),
                colorButton: CustomColor.white,
                onPressed: () {
                  //Navigator.pushNamed(context, MyRoutes.rHOME);
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
              child: // Login Button
                  CustomButtonWidget(
                text: currentIndex == 2 ? 'Previsualizar' : 'Siguiente',
                textStyle:
                    CustomTextStyle.text2.copyWith(color: CustomColor.white),
                colorButton: CustomColor.primary,
                onPressed: () {
                  //Navigator.pushNamed(context, MyRoutes.rHOME);
                  setState(() {
                    if (currentIndex == 2) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PrevisualizacionPostPage(
                              imagenes: storageListImageProvider.listPathImages,
                              nombreMascota: Preferences.name,
                              descripcion: Preferences.description,
                              especie: serviceProvider2.especieSelected,
                              raza: razaProvider2.razaSelected,
                              sexo:
                                  Preferences.gender == 1 ? 'Macho' : 'Hembra',
                              edad: Preferences.age,
                              peso: Preferences.weigth,
                              tamano: Preferences.size,
                              estado: estado_mascota_map,
                              caracteristicas: selectedCaracteristicas,
                              idRaza: Preferences.breed.toString(),
                              tipoPost: widget.tipoPost,
                              idUser: PreferencesUser.id,
                            ),
                          ));
                    }
                    if (currentIndex <= 1) {
                      currentIndex++;
                      print(
                        'Nombre mascota => ${Preferences.name} \nEspecie => ${serviceProvider2.especieSelected} \nRaza => ${razaProvider2.razaSelected} \nSexo => ${Preferences.gender} \nEdad => ${Preferences.age} \nDescripción => ${Preferences.description}',
                      );
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
