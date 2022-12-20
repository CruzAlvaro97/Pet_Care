import 'dart:io';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/providers/storage_list_images_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/home_page/home_page.dart';
import 'package:pet_society/src/views/widget/button_widget/custom_button_widget.dart';
import 'package:pet_society/src/views/widget/modal/modal_alert_widget.dart';
import 'package:provider/provider.dart';

class PrevisualizacionPostPage extends StatefulWidget {
  final List<String> imagenes;
  final String nombreMascota;
  final String descripcion;
  final String especie;
  final String raza;
  final String idRaza;
  final String sexo;
  final String edad;
  final String peso;
  final String tamano;
  final Map estado;
  final List caracteristicas;

  const PrevisualizacionPostPage({
    super.key,
    required this.imagenes,
    required this.nombreMascota,
    required this.descripcion,
    required this.especie,
    required this.raza,
    required this.sexo,
    required this.edad,
    required this.peso,
    required this.tamano,
    required this.estado,
    required this.caracteristicas,
    required this.idRaza,
  });

  @override
  State<PrevisualizacionPostPage> createState() =>
      _PrevisualizacionPostPageState();
}

class _PrevisualizacionPostPageState extends State<PrevisualizacionPostPage> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final storageListImageProvider =
        Provider.of<StorageListImagesProvider>(context);

    Future.delayed(
      Duration.zero,
      () => showDialog(
        context: context,
        builder: (ctx) => ModalAlertWidget(
          icon: const Icon(
            Icons.warning_rounded,
            color: Colors.yellow,
            size: 80.0,
          ),
          title: 'ADVERTENCIA',
          message:
              'Esta sólo es una presentación de como se reflejará tu post dentro de la aplicación. Si deseas cambiar algunos datos retrocede y culmina.',
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(
                '¡ENTENDIDO!',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: CustomColor.white2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Previsualización post - Adopción',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.only(right: 10.0),
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 82),
          child: Column(
            children: [
              //_FotoSlider(),
              const SizedBox(height: 10.0),
              Container(
                height: 280,
                child: ListView.builder(
                  itemCount: widget.imagenes.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20.0),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      //height: 280,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        // image: DecorationImage(
                        //   image: NetworkImage(widget.imagenes[index]),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.file(
                          File(widget.imagenes[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.nombreMascota,
                      style: CustomTextStyle.headline,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      icon: (favorite)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 28,
                            )
                          : Icon(
                              Icons.favorite_border_outlined,
                              size: 28,
                            ),
                    )
                  ],
                ),
              ),
              _Autor(
                autorNombre: 'user.name',
                autorApellido: 'user.last',
              ),
              _DescripcionMascota(descripcion: widget.descripcion),
              _CaracteriscaSlider(caracteristicas: widget.caracteristicas),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    _ExpansionDatos(
                      especie: widget.especie,
                      raza: widget.raza,
                      sexo: widget.sexo,
                      edad: widget.edad,
                      peso: widget.peso,
                      tamano: widget.tamano,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _ExpansionEntregaron(estado: widget.estado),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        key: Key('ruta'),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: CustomButtonWidget(
          colorButton: CustomColor.primary,
          onPressed: () {
            storageListImageProvider.saveListImageInDB(
              widget.nombreMascota, //nombre
              widget.sexo, //genero
              widget.edad, //edad
              widget.tamano, //tamaño
              widget.peso, //peso
              widget.descripcion, //descripcion
              widget.estado, //estado map
              widget.caracteristicas, //caracteristicas lista
              widget.raza, //raza
            );

            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const HomePage(),
                ));
          },
          text: 'Confirmar publicación',
          textStyle: CustomTextStyle.text2.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class _ExpansionEntregaron extends StatelessWidget {
  final Map estado;

  const _ExpansionEntregaron({super.key, required this.estado});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0.0, 4.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            Image.asset('assets/images/IconleadTile.png'),
            SizedBox(
              width: 17,
            ),
            Text('Me entregan',
                style: CustomTextStyle.text2.copyWith(
                  color: CustomColor.primary,
                )),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ListView.builder(
              itemCount: estado.keys.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String key = estado.keys.toList()[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        key[0].toUpperCase() + key.substring(1),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: estado[key]
                              ? CustomColor.success
                              : CustomColor.error,
                        ),
                      ),
                      Text(
                        estado[key] ? 'Sí' : 'No',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: estado[key]
                              ? CustomColor.success
                              : CustomColor.error,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class _ExpansionDatos extends StatelessWidget {
  final String especie;
  final String raza;
  final String sexo;
  final String edad;
  final String peso;
  final String tamano;

  const _ExpansionDatos({
    super.key,
    required this.especie,
    required this.raza,
    required this.edad,
    required this.peso,
    required this.tamano,
    required this.sexo,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0.0, 4.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: ExpansionTile(
          title: Row(
            children: [
              Image.asset('assets/images/IconleadTile.png'),
              const SizedBox(
                width: 17,
              ),
              Text('Mis datos',
                  style: CustomTextStyle.text2.copyWith(
                    color: CustomColor.primary,
                  )),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Especie',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Raza',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Edad',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Sexo',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Peso',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Tamaño',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        especie,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        raza,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        edad,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        sexo,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        peso,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        tamano,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _CaracteriscaSlider extends StatelessWidget {
  final List caracteristicas;

  const _CaracteriscaSlider({super.key, required this.caracteristicas});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: ListView.builder(
        itemCount: caracteristicas.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 20.0, right: 15),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.only(right: 5),
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: CustomColor.primary),
            child: Center(
              child: Text(caracteristicas[index],
                  style: CustomTextStyle.helperText2.copyWith(
                    color: CustomColor.white,
                  )),
            ),
          );
        },
      ),
    );
  }
}

class _DescripcionMascota extends StatelessWidget {
  final String descripcion;

  const _DescripcionMascota({super.key, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ExpandableText(
        descripcion,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        expandText: 'Ver más',
        collapseText: 'Ocultar',
        expandOnTextTap: true,
        collapseOnTextTap: true,
        maxLines: 2,
        linkColor: Colors.grey,
      ),
    );
  }
}

class _Autor extends StatelessWidget {
  final String autorNombre;
  final String autorApellido;

  const _Autor(
      {super.key, required this.autorNombre, required this.autorApellido});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            autorNombre,
            style: CustomTextStyle.paragraph.copyWith(color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                autorApellido,
                style: CustomTextStyle.paragraph.copyWith(color: Colors.grey),
              ),
              const SizedBox(width: 5),
              Image.asset('assets/images/Vectorverified.png')
            ],
          ),
        ],
      ),
    );
  }
}

class _FotoSlider extends StatelessWidget {
  const _FotoSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2022/05/23/14/48/dog-7216354__340.jpg',
                  width: 335,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2022/05/23/14/48/dog-7216354__340.jpg',
                  width: 335,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2022/05/23/14/48/dog-7216354__340.jpg',
                  width: 335,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
