import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/models/publication2_model.dart';
import 'package:pet_society/src/models/publication_model.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/button_widget/custom_button_widget.dart';

class AdoptationPage extends StatefulWidget {
  final Publication2 publication2;
  const AdoptationPage({super.key, required this.publication2});

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
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.publication2.isPublicationAdoption == true
              ? 'En adopción'
              : widget.publication2.isPublicationSupport == true
                  ? 'Apoyo'
                  : 'Se busca',
          style: const TextStyle(
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
                  itemCount: widget.publication2.photo.length,
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
                        image: DecorationImage(
                          image: NetworkImage(widget.publication2.photo),
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
                      widget.publication2.namePet,
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
                publication2: widget.publication2,
              ),
              _DescripcionMascota(publication2: widget.publication2),
              const _CaracteriscaSlider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    _ExpansionDatos(
                      publication2: widget.publication2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Visibility(
                        visible: widget.publication2.isPublicationAdoption ==
                                true
                            ? true
                            : widget.publication2.isPublicationSupport == true
                                ? false
                                : false,
                        child: _ExpansionEntregaron())
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
              Text('Me entregan',
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
  final Publication2 publication2;

  const _ExpansionDatos({super.key, required this.publication2});

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
                        publication2.speciesPet,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication2.breedPet,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${publication2.agePet} año(s)',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication2.sexPet,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${publication2.weigthPet} Kg',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication2.sizePet,
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
  final Publication2 publication2;

  const _DescripcionMascota({super.key, required this.publication2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ExpandableText(
        publication2.description,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
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
  final Publication2 publication2;

  const _Autor({super.key, required this.publication2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Publicado por: ${publication2.nameUser} ${publication2.lastnameUser}',
            style: CustomTextStyle.paragraph.copyWith(color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                publication2.usernameUser,
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
