import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/decoration_widget/container_decoration_widget.dart';
import 'package:provider/provider.dart';

class PanelSubPageAdmin extends StatelessWidget {
  const PanelSubPageAdmin({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estadísticas de adopciones',
              style: CustomTextStyle.titleSlider,
            ),
            Container(
              decoration:
                  containerDecoration().copyWith(color: CustomColor.secondary),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.restart_alt),
                        Text(
                          publicacionProvider
                              .listaPublicacionesPendientes.length
                              .toString(),
                          style: CustomTextStyle.text,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.check),
                        Text(
                          publicacionProvider.listaPublicacionesAprobadas.length
                              .toString(),
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
  }
}
