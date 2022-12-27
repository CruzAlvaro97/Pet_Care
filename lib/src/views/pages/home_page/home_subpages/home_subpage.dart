// ignore_for_file: avoid_print
import 'package:card_swiper/card_swiper.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_society/providers/favorite_provider.dart';
import 'package:pet_society/src/models/pets_adoption_model.dart';
import 'package:pet_society/src/models/publication2_model.dart';
import 'package:pet_society/src/models/publication_model.dart';
import 'package:pet_society/src/preferences/formadoptation_preferences.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/create_publication_page/create_publication_page.dart';
import 'package:pet_society/src/views/pages/detail_page/adoptation_page.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages/en_adopcion_subpage.dart';
import 'package:pet_society/src/views/widget/decoration_widget/container_decoration_widget.dart';
import 'package:pet_society/src/views/widget/skeleton/card_post_skeleton_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSubPage extends StatefulWidget {
  const HomeSubPage({Key? key}) : super(key: key);

  @override
  State<HomeSubPage> createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage> {
  @override
  void initState() {
    super.initState();
    final publicacionProvider =
        Provider.of<PublicacionProvider>(context, listen: false);

    publicacionProvider.refreshList();

    Future<String?> getImageUrlFromPreferences() async {
      final _noPrefs = await SharedPreferences.getInstance();
      return _noPrefs.getString("fotoUsuario");
    }
  }

  @override
  Widget build(BuildContext context) {
    final publicacionProvider = Provider.of<PublicacionProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 400,
        leading: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(
            'PetCare',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notification_important_outlined,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => publicacionProvider.refreshList(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PhotoAndSearchInput(),
              const Divider(
                thickness: 0.8,
              ),
              const _AdContainer(),
              const _TitleCarrouselCards(
                titleCarrousel: 'Publicaciones recientes',
              ),
              SizedBox(
                child: publicacionProvider.isLoading
                    ? const CardPostSkeletonWidget()
                    : Column(
                        children: const [
                          _CarrouselPublication(itemCount: 3),
                          _TitleCarrouselCards(
                            titleCarrousel: 'Adopciones recientes',
                            isMoreText: false, //<- is true
                          ),
                          _CarrouselAdoptPets(),
                          SizedBox(height: 30.0),
                        ],
                      ),
              )
              //_CarrouselPublication2(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarrouselAdoptPets extends StatelessWidget {
  const _CarrouselAdoptPets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: petsAdoption.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        itemBuilder: (context, index) {
          final dataAdopt = petsAdoption[index];

          return Container(
            width: 160,
            height: 180,
            margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            decoration: containerDecoration().copyWith(color: Colors.white),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Image.network(
                    dataAdopt.photoPet,
                    height: 135,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      dataAdopt.namePet,
                      style: CustomTextStyle.text,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CarrouselPublication extends StatelessWidget {
  final int? itemCount;

  const _CarrouselPublication({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);
    final publicacionProvider = Provider.of<PublicacionProvider>(context);

    return ListView.builder(
      itemCount: publicacionProvider.listaPublicacionesAprobadas.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final dataPublicacion =
            publicacionProvider.listaPublicacionesAprobadas[index];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            bottom: 10.0,
            right: 20.0,
            left: 20.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: containerDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 55 / 2,
                    backgroundImage:
                        NetworkImage(dataPublicacion.usuario.fotoUsuario),

                    //'https://gmlqcelelvidskpttktm.supabase.co/storage/v1/object/public/imgs/IMG/${dataPublicacion.imagesPet[0]}'
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${dataPublicacion.usuario.nombreUsuario} ${dataPublicacion.usuario.apellidoUsuario}',
                              style: CustomTextStyle.text,
                            ),
                            Text(
                              '@${dataPublicacion.usuario.usernameUsuario}',
                              style: CustomTextStyle.helperText2
                                  .copyWith(color: CustomColor.grey),
                            ),
                            Text(
                              '${dataPublicacion.createdAt.hour.toString()}:${dataPublicacion.createdAt.minute.toString()}',
                              style: CustomTextStyle.helperText2
                                  .copyWith(color: CustomColor.grey),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ExpandableText(
                dataPublicacion.descriptionPost,
                textAlign: TextAlign.left,
                style: CustomTextStyle.paragraph,
                expandText: 'Ver más',
                collapseText: 'Ocultar',
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 2,
                linkColor: Colors.grey,
              ),
              const SizedBox(height: 10.0),
              Stack(
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      if (fav.selectedItem.contains(index)) {
                        fav.removeItem(index);
                        publications2
                            .where((x) => x.id == index + 1)
                            .first
                            .likes = publications2[index].likes - 1;
                      } else {
                        fav.addItem(index);
                        publications2
                            .where((x) => x.id == index + 1)
                            .first
                            .likes = publications2[index].likes + 1;
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: FadeInImage(
                          placeholder: const AssetImage(
                              'assets/images/picture-loading2.gif'),
                          image: NetworkImage(
                            'https://gmlqcelelvidskpttktm.supabase.co/storage/v1/object/public/imgs/IMG/${dataPublicacion.imagesPet[0]}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  //===likes y comentar
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 10.0,
                  //     vertical: 10.0,
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       IconButton(
                  //         onPressed: () {
                  //           if (fav.selectedItem.contains(index)) {
                  //             fav.removeItem(index);
                  //             publications2
                  //                 .where((x) => x.id == index + 1)
                  //                 .first
                  //                 .likes = publications2[index].likes - 1;
                  //           } else {
                  //             fav.addItem(index);
                  //             publications2
                  //                 .where((x) => x.id == index + 1)
                  //                 .first
                  //                 .likes = publications2[index].likes + 1;
                  //           }
                  //         },
                  //         icon: Icon(
                  //           fav.selectedItem.contains(index)
                  //               ? Icons.favorite_rounded
                  //               : Icons.favorite_border_rounded,
                  //           color: fav.selectedItem.contains(index)
                  //               ? Colors.red
                  //               : Colors.white,
                  //           size: 30,
                  //         ),
                  //         padding: EdgeInsets.zero,
                  //       ),
                  //       Text(
                  //         '00',
                  //         style: GoogleFonts.poppins(
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.white,
                  //           height: 1,
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 5.0,
                  //       ),
                  //       IconButton(
                  //         onPressed: () {},
                  //         icon: const Icon(
                  //           Icons.messenger_outline_rounded,
                  //           color: Colors.white,
                  //           size: 30,
                  //         ),
                  //         padding: EdgeInsets.zero,
                  //       ),
                  //       Text(
                  //         '00',
                  //         style: GoogleFonts.poppins(
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.white,
                  //           height: 1,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdoptationPage(
                        publication3:
                            publicacionProvider.listaPublicacion3[index],
                      ),
                    ),
                  );
                }),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: CustomColor.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Conoce más',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CarrouselPublication2 extends StatelessWidget {
  const _CarrouselPublication2({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context, listen: false);
    final publicacionProvider = Provider.of<PublicacionProvider>(context);

    return ListView.builder(
      itemCount: publicacionProvider.listaPublicacion3.length - 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final dataPublicacion =
            publicacionProvider.listaPublicacion3[index + 3];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            bottom: 10.0,
            right: 20.0,
            left: 20.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: containerDecoration(),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 55 / 2,
                    backgroundImage: NetworkImage(dataPublicacion.imagesPet[0]),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sin datos',
                              style: CustomTextStyle.text,
                            ),
                            Text(
                              'Sin datos',
                              style: CustomTextStyle.helperText2
                                  .copyWith(color: CustomColor.grey),
                            ),
                            Text(
                              dataPublicacion.createdAt.hour.toString(),
                              style: CustomTextStyle.helperText2
                                  .copyWith(color: CustomColor.grey),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ExpandableText(
                dataPublicacion.descriptionPost,
                textAlign: TextAlign.left,
                style: CustomTextStyle.paragraph,
                expandText: 'Ver más',
                collapseText: 'Ocultar',
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 2,
                linkColor: Colors.grey,
              ),
              const SizedBox(height: 10.0),
              Stack(
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      if (fav.selectedItem.contains(index + 3)) {
                        fav.removeItem(index + 3);
                        publications2
                            .where((x) => x.id == index + 4)
                            .first
                            .likes = publications2[index + 3].likes - 1;
                      } else {
                        fav.addItem(index + 3);
                        publications2
                            .where((x) => x.id == index + 4)
                            .first
                            .likes = publications2[index + 3].likes + 1;
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Image.network(
                          dataPublicacion.imagesPet[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (fav.selectedItem.contains(index + 3)) {
                              fav.removeItem(index + 3);
                              publications2
                                  .where((x) => x.id == index + 4)
                                  .first
                                  .likes = publications2[index + 3].likes - 1;
                            } else {
                              fav.addItem(index + 3);
                              publications2
                                  .where((x) => x.id == index + 4)
                                  .first
                                  .likes = publications2[index + 3].likes + 1;
                            }
                          },
                          icon: Icon(
                            fav.selectedItem.contains(index + 3)
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: fav.selectedItem.contains(index + 3)
                                ? Colors.red
                                : Colors.white,
                            size: 30,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          '00',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.messenger_outline_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          '00',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdoptationPage(
                        publication3:
                            publicacionProvider.listaPublicacion3[index],
                      ),
                    ),
                  );
                }),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: CustomColor.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Conoce más',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TitleCarrouselCards extends StatelessWidget {
  final String titleCarrousel;
  final bool? isMoreText;

  const _TitleCarrouselCards({
    super.key,
    required this.titleCarrousel,
    this.isMoreText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleCarrousel,
            style: CustomTextStyle.titleSlider,
          ),
          Visibility(
            visible: isMoreText!,
            child: TextButton(
              onPressed: () {
                print('Navegar sgte. pg.');
              },
              style: const ButtonStyle(),
              child: Text(
                'Ver mas',
                style: CustomTextStyle.seeMoreText.copyWith(
                  color: CustomColor.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AdContainer extends StatelessWidget {
  const _AdContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      //color: Colors.red,
      child: Swiper(
        itemCount: 5,
        viewportFraction: 1,
        itemHeight: 70,
        //scale: 0.9,
        // pagination: const SwiperPagination(
        //   margin: EdgeInsets.only(top: 50),
        //   //alignment: Alignment.bottomCenter,
        //   builder: DotSwiperPaginationBuilder(
        //     color: Colors.grey,
        //     activeColor: Colors.amber,
        //   ),
        // ),
        autoplay: true,
        control: const SwiperControl(
          color: Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 119,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  padding: const EdgeInsets.only(left: 30.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFE8CC68),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ANUNCIO',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'AQUÍ!!!',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color: CustomColor.primary,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset('assets/images/dog_ad.png'),
                ),
              ],
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height * 0.20,
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: containerDecoration().copyWith(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/vector-gratis/diseno-plantilla-veterinario-dibujado-mano_23-2149703612.jpg?w=2000"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PhotoAndSearchInput extends StatelessWidget {
  const _PhotoAndSearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60 / 2,
            foregroundColor: const Color(0xFF6e42ec),
            backgroundColor: const Color(0xFF6e42ec),
            backgroundImage: PreferencesUser.fotoUsuario.isEmpty
                ? const NetworkImage(
                    'https://i.ibb.co/1djwyMD/icono-petcare-background-purple.png',
                  )
                : NetworkImage(
                    PreferencesUser.fotoUsuario,
                  ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const CreatePublicationPage(),
                    ));
              },
              child: Container(
                height: 60,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20.0),
                decoration: containerDecoration(),
                child: Text(
                  '¿Deseas publicar?',
                  style: CustomTextStyle.helperText
                      .copyWith(color: CustomColor.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration customInputDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: GoogleFonts.poppins(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(20.0),
  );
}
