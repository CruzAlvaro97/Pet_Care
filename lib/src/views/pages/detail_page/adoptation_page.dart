import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/button_widget/custom_button_widget.dart';

class AdoptationPage extends StatefulWidget {
  const AdoptationPage({super.key});

  @override
  State<AdoptationPage> createState() => _AdoptationPageState();
}

class _AdoptationPageState extends State<AdoptationPage> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: CustomColor.white2,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Caso de adopción'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 82),
          child: Column(
            children: [
              _FotoSlider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Simon',
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
              _Autor(),
              _DescripcionMascota(),
              _CaracteriscaSlider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    _ExpansionDatos(),
                    SizedBox(
                      height: 15,
                    ),
                    _ExpansionEntregaron()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: CustomButtonWidget(
          colorButton: CustomColor.primary,
          onPressed: () {},
          text: 'Solicitar adopción',
          textStyle: CustomTextStyle.text2.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class _ExpansionEntregaron extends StatelessWidget {
  const _ExpansionEntregaron({
    Key? key,
  }) : super(key: key);

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
              Text('Me entregaron',
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
                        'Vacunado',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Desparasitado',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Sano',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Esterelizado',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Otras opciones',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Si',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.success),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Si',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.success),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Si',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.success),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'No',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.error),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'No',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.error),
                      ),
                      SizedBox(
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

class _ExpansionDatos extends StatelessWidget {
  const _ExpansionDatos({
    Key? key,
  }) : super(key: key);

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
              Text('Datos',
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
                        'Nacimiento',
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
                        'Perro',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Mestizo',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '04/12/20',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Macho',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '24Kg',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Mediano',
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
  const _CaracteriscaSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 5,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColor.primary),
              child: Center(
                child: Text('Cariñoso',
                    style: CustomTextStyle.helperText2.copyWith(
                      color: CustomColor.white,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColor.primary),
              child: Center(
                child: Text('Bueno con otros perros',
                    style: CustomTextStyle.helperText2.copyWith(
                      color: CustomColor.white,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColor.primary),
              child: Center(
                child: Text('Me gusta salir a pasear',
                    style: CustomTextStyle.helperText2.copyWith(
                      color: CustomColor.white,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColor.primary),
              child: Center(
                child: Text('Jugueton',
                    style: CustomTextStyle.helperText2.copyWith(
                      color: CustomColor.white,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DescripcionMascota extends StatelessWidget {
  const _DescripcionMascota({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ExpandableText(
        'Se da en adopción a Simón, es un perro mestizo pastor alemán, tiene 2 años y fue rescatado. Tiene caracter muy dosil y es amigable con todos los perros.',
        textAlign: TextAlign.justify,
        style: CustomTextStyle.text,
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
  const _Autor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Publicado por: Asociación Huellitas Chimbote',
            style: CustomTextStyle.paragraph.copyWith(color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                '@huellitas.chimbote ',
                style: CustomTextStyle.paragraph.copyWith(color: Colors.grey),
              ),
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
