import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:pet_society/providers/detalle_adopcion_provider.dart';
import 'package:pet_society/src/models/publication2_model.dart';
import 'package:pet_society/src/models/publication3_model.dart';
import 'package:pet_society/src/models/publication_model.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/providers/token_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/button_widget/custom_button_widget.dart';
import 'package:provider/provider.dart';

class AdoptationPage extends StatefulWidget {
  final Publication3 publication3;
  const AdoptationPage({super.key, required this.publication3});

  @override
  State<AdoptationPage> createState() => _AdoptationPageState();
}

class _AdoptationPageState extends State<AdoptationPage> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    final detalleAdopcionProvider =
        Provider.of<DetalleAdopcionProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: CustomColor.white2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'En adopción',
          style: TextStyle(
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 82),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: PreferencesUser.id == 5 ? true : false,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Visualización',
                                style: CustomTextStyle.headline2.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                detalleAdopcionProvider.message,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          CupertinoSwitch(
                            value: widget.publication3.statusPub == 'pendiente'
                                ? false
                                : true,
                            onChanged: (value) {
                              final publicationProvider =
                                  Provider.of<PublicacionProvider>(context,
                                      listen: false);
                              String estadoPubli = '';
                              detalleAdopcionProvider.isVisibleSwitch();
                              if (value) {
                                widget.publication3.statusPub = 'aprobado';
                                estadoPubli = 'aprobado';
                                publicationProvider.eliminarItemPendiente(
                                    widget.publication3.id);
                                publicationProvider
                                    .agregarItemAprobado(widget.publication3);
                              } else {
                                widget.publication3.statusPub = 'pendiente';
                                estadoPubli = 'pendiente';
                                publicationProvider.eliminarItemAprobado(
                                    widget.publication3.id);
                                publicationProvider
                                    .agregarItemPendiente(widget.publication3);
                              }
                              print('value => $value');

                              detalleAdopcionProvider.updateStatusPublication(
                                widget.publication3.id,
                                estadoPubli,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.0,
                      color: Color.fromARGB(255, 197, 197, 197),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 280,
                child: ListView.builder(
                  itemCount: widget.publication3.imagesPet.length,
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
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
                          placeholder: const AssetImage(
                              'assets/images/picture-loading2.gif'),
                          image: NetworkImage(
                              'https://gmlqcelelvidskpttktm.supabase.co/storage/v1/object/public/imgs/IMG/${widget.publication3.imagesPet[index]}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.publication3.namePet[0].toUpperCase()}${widget.publication3.namePet.substring(1)}',
                      style: CustomTextStyle.headline,
                    ),
                    // IconButton(
                    //   padding: EdgeInsets.all(0),
                    //   onPressed: () {
                    //     setState(() {
                    //       favorite = !favorite;
                    //     });
                    //   },
                    //   icon: (favorite)
                    //       ? Icon(
                    //           Icons.favorite,
                    //           color: Colors.red,
                    //           size: 28,
                    //         )
                    //       : Icon(
                    //           Icons.favorite_border_outlined,
                    //           size: 28,
                    //         ),
                    // )
                  ],
                ),
              ),
              _Autor(
                //publication2: widget.publication2,
                publication3: widget.publication3,
              ),
              _DescripcionMascota(publication3: widget.publication3),
              _CaracteriscaSlider(publication3: widget.publication3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    _ExpansionDatos(
                      publication3: widget.publication3,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _ExpansionEntregaron(
                      publication3: widget.publication3,
                    )
                    // Visibility(
                    //     visible: widget.publication2.isPublicationAdoption ==
                    //             true
                    //         ? true
                    //         : widget.publication2.isPublicationSupport == true
                    //             ? false
                    //             : false,
                    //     child: _ExpansionEntregaron())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: PreferencesUser.id == 5 ? false : true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: CustomButtonWidget(
            colorButton: CustomColor.primary,
            onPressed: () {
              final tokenProvider =
                  Provider.of<TokenProvider>(context, listen: false);

              tokenProvider.pushNotificationsSpecificDevice(
                token: widget.publication3.usuario.token,
                title: '¡ATENCIÓN!',
                body:
                    '${PreferencesUser.nombreUsuario} está interesado en adoptar a ${widget.publication3.namePet[0].toUpperCase()}${widget.publication3.namePet.substring(1)}.',
              );
            },
            text: 'Solicitar adopción',
            textStyle: CustomTextStyle.text2.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _ExpansionEntregaron extends StatelessWidget {
  final Publication3 publication3;

  const _ExpansionEntregaron({super.key, required this.publication3});

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
              const SizedBox(width: 17),
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
                        'Otras operaciones',
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
                        publication3.statusPet.vacunado ? 'Sí' : 'No',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: publication3.statusPet.vacunado
                                ? CustomColor.success
                                : CustomColor.error),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication3.statusPet.desparasitado ? 'Sí' : 'No',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: publication3.statusPet.desparasitado
                                ? CustomColor.success
                                : CustomColor.error),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication3.statusPet.sano ? 'Sí' : 'No',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: publication3.statusPet.sano
                                ? CustomColor.success
                                : CustomColor.error),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication3.statusPet.esterilizado ? 'Sí' : 'No',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: publication3.statusPet.esterilizado
                                ? CustomColor.success
                                : CustomColor.error),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication3.statusPet.otras ? 'Sí' : 'No',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: publication3.statusPet.otras
                                ? CustomColor.success
                                : CustomColor.error),
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
  final Publication3 publication3;

  const _ExpansionDatos({super.key, required this.publication3});

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
                        publication3.speciePet,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication3.breedPet,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${publication3.agePet} año(s)',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication3.genderPet,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${publication3.weigthPet} Kg',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        publication3.sizePet,
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
  final Publication3 publication3;

  const _CaracteriscaSlider({super.key, required this.publication3});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: ListView.builder(
        itemCount: publication3.featuresPet.length,
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
              child: Text(publication3.featuresPet[index],
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
  final Publication3 publication3;

  const _DescripcionMascota({super.key, required this.publication3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ExpandableText(
        '${publication3.descriptionPost[0].toUpperCase()}${publication3.descriptionPost.substring(1)}',
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
  //final Publication2 publication2;
  final Publication3 publication3;

  const _Autor({super.key, required this.publication3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text('Token => ${publication3.usuario.token} '),
          Text(
            //'Publicado por: ${publication2.nameUser} ${publication2.lastnameUser}',
            '${publication3.usuario.nombreUsuario} ${publication3.usuario.apellidoUsuario}',
            style: CustomTextStyle.paragraph.copyWith(color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                '@${publication3.usuario.usernameUsuario}',
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
