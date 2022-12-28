import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/models/publication3_model.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/utils/color/custom_color.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/detail_page/adoptation_page.dart';
import 'package:pet_society/src/views/widget/decoration_widget/container_decoration_widget.dart';
import 'package:provider/provider.dart';

class EnAdopcionSubPageAdmin extends StatelessWidget {
  const EnAdopcionSubPageAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final publicationProvider = Provider.of<PublicacionProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: kToolbarHeight,
            color: CustomColor.primary,
          ),
          Expanded(
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                indicatorColor: Colors.white,
                //indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelPadding: EdgeInsets.zero,
                background: Container(
                  color: CustomColor.primary,
                ),
              ),
              tabs: [
                Text(
                  'Pendientes',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Aprobados',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
              views: [
                CardsPublicationStatus(
                    publicacionesPendientes:
                        publicationProvider.listaPublicacionesPendientes),
                CardsPublicationStatus(
                    publicacionesPendientes:
                        publicationProvider.listaPublicacionesAprobadas),
              ],
              // ignore: avoid_print
              onChange: (index) => print(index),
            ),
          ),
        ],
      ),
    );
  }
}

class CardsPublicationStatus extends StatelessWidget {
  const CardsPublicationStatus({
    Key? key,
    //required this.publicationProvider,
    required this.publicacionesPendientes,
  }) : super(key: key);

  //final PublicacionProvider publicationProvider;

  final List<Publication3> publicacionesPendientes;

  @override
  Widget build(BuildContext context) {
    final publicationProvider = Provider.of<PublicacionProvider>(context);
    return RefreshIndicator(
      onRefresh: publicationProvider.refreshList,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
        physics: const BouncingScrollPhysics(),
        itemCount: publicacionesPendientes.length,
        itemBuilder: ((context, index) {
          final dataPublicacion = publicacionesPendientes[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      AdoptationPage(publication3: dataPublicacion),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              margin:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              decoration: containerDecoration(),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    child: Image.network(
                      'https://gmlqcelelvidskpttktm.supabase.co/storage/v1/object/public/imgs/IMG/${dataPublicacion.imagesPet[0]}',
                      width: 140,
                      height: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 10, vertical: 5),
                        //   decoration: containerDecoration().copyWith(
                        //       color: dataPublicacion.statusPub == 'pendiente'
                        //           ? Colors.amber.withOpacity(0.5)
                        //           : Colors.green.withOpacity(0.5)),
                        //   child: Text(
                        //     '${dataPublicacion.statusPub[0].toUpperCase()}${dataPublicacion.statusPub.substring(1)}',
                        //     style: CustomTextStyle.helperText.copyWith(
                        //       fontSize: 10,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 5.0),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Mascota: ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                text:
                                    '${dataPublicacion.namePet[0].toUpperCase()}${dataPublicacion.namePet.substring(1)}',
                                style: CustomTextStyle.text,
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'De: ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                text: dataPublicacion.usuario.usernameUsuario,
                                style: CustomTextStyle.text,
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Hace: ',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                text:
                                    '${DateTime.now().difference(dataPublicacion.createdAt).inHours} horas',
                                style: CustomTextStyle.text,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
