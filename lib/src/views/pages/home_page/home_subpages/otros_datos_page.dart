import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/models/publication3_model.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/detail_page/adoptation_page.dart';
import 'package:pet_society/src/views/widget/checkbox_tipo_publi_widget.dart/checkbox_tipo_publi_widget.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';
import 'package:provider/provider.dart';

class OtrosDatosPage extends StatefulWidget {
  const OtrosDatosPage({Key? key}) : super(key: key);

  @override
  State<OtrosDatosPage> createState() => _OtrosDatosPageState();
}

class _OtrosDatosPageState extends State<OtrosDatosPage> {
  @override
  void initState() {
    super.initState();

    final publicacionesProvider =
        Provider.of<PublicacionProvider>(context, listen: false);

    publicacionesProvider.filtrarListaPorUsuario(PreferencesUser.id);

    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    final publicacionesProvider = Provider.of<PublicacionProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.primary,
        title: Text(
          'Mis publicaciones',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Column(
        children: [
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
                  '*',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Mis solicitudes',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
              views: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total de publicaciones',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black,
                                  height: 1,
                                ),
                              ),
                              Text(
                                'Resutaldos: ${publicacionesProvider.listaMisPublicaciones.length}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              _CustomBottomSheet(context);
                            },
                            icon: const Icon(Icons.filter_list),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 20.0),
                          physics: const BouncingScrollPhysics(),
                          itemCount: publicacionesProvider
                              .listaMisPublicaciones.length,
                          itemBuilder: ((context, index) {
                            final dataPublicacion = publicacionesProvider
                                .listaMisPublicaciones[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => AdoptationPage(
                                        publication3: dataPublicacion),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                margin: const EdgeInsets.only(bottom: 10.0),
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration:
                                                containerDecoration().copyWith(
                                              color:
                                                  dataPublicacion.statusPub ==
                                                          'pendiente'
                                                      ? Colors.amber
                                                          .withOpacity(0.5)
                                                      : Colors.green
                                                          .withOpacity(0.5),
                                            ),
                                            child: Text(
                                              '${dataPublicacion.statusPub[0].toUpperCase()}${dataPublicacion.statusPub.substring(1)}',
                                              style: CustomTextStyle.helperText
                                                  .copyWith(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
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
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                TextSpan(
                                                    text:
                                                        '${dataPublicacion.namePet[0].toUpperCase()}${dataPublicacion.namePet.substring(1)}',
                                                    style: CustomTextStyle
                                                        .seeMoreText),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Especie: ',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                TextSpan(
                                                  text:
                                                      dataPublicacion.speciePet,
                                                  style: CustomTextStyle
                                                      .seeMoreText,
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
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                TextSpan(
                                                  text:
                                                      '${DateTime.now().difference(dataPublicacion.createdAt).inHours} horas',
                                                  style: CustomTextStyle
                                                      .seeMoreText,
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
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text('Todas mis solicitud enviadas'),
                ),
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

_CustomBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      // <-- for border radius
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 45,
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
              ),
            ),
          ),
          const CheckboxTipoPubliWidget(),
          const SizedBox(height: 15.0),
          const SizedBox(height: 15.0),
          const SizedBox(height: 12.0),
          CustomButtonWidget(
            colorButton: CustomColor.primary,
            text: 'Aplicar',
            textStyle: CustomTextStyle.text2.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    ),
  );
}
