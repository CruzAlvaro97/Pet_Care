import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/providers/publicacion_provider.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:provider/provider.dart';

class CheckboxTipoPubliWidget extends StatefulWidget {
  const CheckboxTipoPubliWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxTipoPubliWidget> createState() =>
      _CheckboxTipoPubliWidgetState();
}

class _CheckboxTipoPubliWidgetState extends State<CheckboxTipoPubliWidget> {
  bool statusCheckedPerro = false;
  bool statusAdidasOriginals = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            title: Text(
              'Perro',
              style: GoogleFonts.poppins(
                color: statusCheckedPerro ? CustomColor.primary : Colors.black,
                fontWeight:
                    statusCheckedPerro ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            checkColor: Colors.white,
            activeColor: CustomColor.primary,
            value: statusCheckedPerro,
            onChanged: (value) {
              setState(() {
                statusCheckedPerro = !statusCheckedPerro;
                final publicacionProvider =
                    Provider.of<PublicacionProvider>(context, listen: false);

                publicacionProvider.filtrarListaPorEspecie('Perro');
              });
            },
          ),
        ],
      ),
    );
  }
}
