import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/src/models/publication_model.dart';
import 'package:pet_society/src/utils/color/custom_color.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/decoration_widget/container_decoration_widget.dart';

class HomeSubPage extends StatelessWidget {
  const HomeSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _PhotoAndSearchInput(),
            Divider(
              thickness: 0.8,
            ),
            _AdContainer(),
            _TitleCarrouselCards(),
            _CarrouselPublication()
          ],
        ),
      ),
    );
  }
}

class _CarrouselPublication extends StatelessWidget {
  const _CarrouselPublication({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: publications.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final dataPost = publications[index];

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
                    backgroundImage: NetworkImage(dataPost.photoUser),
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
                              '${dataPost.nameUser} ${dataPost.lastnameUser}',
                              style: CustomTextStyle.text,
                            ),
                            Text(
                              dataPost.usernameUser,
                              style: CustomTextStyle.helperText2,
                            ),
                            Text(
                              'Hace 30 min.',
                              style: CustomTextStyle.helperText2,
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
                dataPost.description,
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
                  Container(
                    height: 250,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Image.network(
                        dataPost.photo,
                        fit: BoxFit.cover,
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          dataPost.likes.toString(),
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
                          dataPost.commentary.toString(),
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
              Container(
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
            ],
          ),
        );
      },
    );
  }
}

class _TitleCarrouselCards extends StatelessWidget {
  const _TitleCarrouselCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        'Publicaciones recientes',
        style: CustomTextStyle.titleSlider,
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 119,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.only(left: 20.0),
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
          const CircleAvatar(
            radius: 60 / 2,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1566753323558-f4e0952af115?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1021&q=80'),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Container(
              height: 60,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0),
              decoration: containerDecoration(),
              child: Text(
                '¿Deseas publicar?',
                style: CustomTextStyle.helperText,
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