import 'package:flutter/material.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';

import 'package:url_launcher/url_launcher.dart';

class LugaresTuristicosScreen extends StatelessWidget {
  const LugaresTuristicosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
          const backgroundImage(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: const Text(
                  'LUGARES TURISTICOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Contenido
              Expanded(
                child: ListView.builder(
                    itemCount: turisticosList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    SecondPage(turismoLugar: index)));
                          },
                          child: GameCard(
                            title: turisticosList[index]['name'],
                          ));
                    }),
              ),
              // Footer Buttons
              const FooterButtons(),
            ],
          )
        ],
      ),
    );
  }
}

/* SECOND PAGE */
class SecondPage extends StatelessWidget {
  final int turismoLugar;
  const SecondPage({required this.turismoLugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        const backgroundImage(),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 70),
                child: Text(
                  turisticosList[turismoLugar]['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // IMAGEN
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 300,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(turisticosList[turismoLugar]['imagenUrl']),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(turisticosList[turismoLugar]['descripcion'],
                      style: const TextStyle(color: Colors.white, fontSize: 17)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(0, 245, 246, 245))
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse( turisticosList[turismoLugar]['ubicacion']));
                    },
                    child: const Text(
                      'UBICACION',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const FooterButtons()
            ],
          )
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  // final String pantalla;
  GameCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      color: const Color(0xff000643),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // pantalla == 'RESTAURANTES'
            //     ? Text(descripcion, style: TextStyle(
            //       color: Colors.white, fontSize: 20
            //     ),)
            //     : Text('')
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> turisticosList = [
  {
    "name": "Balneario de Capachos",
    "imagenUrl": "https://i.postimg.cc/nLk1P8FY/temp-Imagen-QMy-SP.avif",
    "descripcion":
        "El balneario se encuentra al este de la ciudad en la localidad de Capachos, a tan solo 12 kilómetros de distancia. Es conocido por sus famosas aguas termo medicinales que llegan a temperaturas de hasta más de sesenta grados centígrados. Capachos ofrece momentos de relajación gracias a las cálidas aguas de sus pozas individuales y familiares.",
    "ubicacion": "https://maps.app.goo.gl/bp3RNSyiMPnccUAA7"
  },
  {
    "name": "Monumento Casco del Minero",
    "imagenUrl":
        "https://i.postimg.cc/W1080Fxy/temp-Imagem-Gbdw-P.avif",
    "descripcion":
        "Este curioso monumento se construyó en honor a la labor y esfuerzo de los mineros de Oruro, se trata de un casco metálico de grandes proporciones con la imagen de la patrona de los mineros.",
    "ubicacion": "https://maps.app.goo.gl/wgFd1JDchLGrzCuc7"
  },
  {
    "name": "Faro de La Conchupata",
    "imagenUrl":
        "https://i.postimg.cc/TYLCYH0f/temp-Image-Vp-LOPT.avif",
    "descripcion":
        "Tuvo un papel muy importante en la historia de Oruro a mitad del siglo XIX. El peculiar mirador es icono de la ciudad por ser el primer lugar en donde se izó la actual bandera boliviana y por ser fiel vigilante de la ciudad. Se dice que desde aquí se alertaba a los pobladores cuando se acercaban tropas y motines que pretendían apoderarse de sus tierras.",
    "ubicacion": "https://maps.app.goo.gl/q5DY4DxzfxAS8AdE9"
  },
  {
    "name": "Parque Ecologico Pisko Ujyana",
    "imagenUrl":
        "https://i.postimg.cc/76ZNvBbv/temp-Imagey-Spj-XZ.avif",
    "descripcion":
        "El parque Ecológico de Oruro es uno de los más hermosos de esta ciudad. Disponible para todos los visitantes orureños y no orureños, este parque ofrece un paisaje distinto al resto de la ciudad, y del departamento, en el Parque Ecológico P´esco Ujyana tenemos un pedacito de paraíso en una de las ciudades más cercanas al cielo.",
    "ubicacion": "https://maps.app.goo.gl/Y8HhQMCnL87JcBZD7"
  },
  {
    "name": "Museo antropológico Eduardo López Rivas",
    "imagenUrl":
        "https://i.postimg.cc/xC6tqwBT/temp-Image-KJ36sq.avif",
    "descripcion":
        "Este museo municipal se encuentra ubicado en la Av. España, fue fundado en 1959 con el propósito de difundir las costumbres y riqueza cultural de Oruro. Las piezas que exhibe el museo se encuentran dividas en cinco categorías; arqueología, antropología, folclore, etnografía y etnomusicología. Cada espacio está adaptado para que los visitantes vivan una experiencia educativa en un ambiente de paz y tranquilidad, en el museo se puede encontrar mucha información de las Culturas precolombinas, observar esculturas en piedra de antiguas deidades, instrumentos musicales andinos y hasta los tradicionales trajes típicos de Oruro.",
    "ubicacion": "https://maps.app.goo.gl/5k8G14LF4hNUzLJy5"
  },
  {
    "name": "Museo Simon I. Patiño",
    "imagenUrl":
        "https://i.postimg.cc/C1hchhPQ/temp-Imageb4-NEo-W.avif",
    "descripcion":
        "Esta gran edificación perteneció al empresario minero Simón Iturri Patiño uno de los hombres más ricos del mundo en 1940, a quien se le conocía también como el “Rey del Estaño” o “Barón del Estaño». La mansión fue constituida con materiales importados y de finos acabados, presenta un estilo neoclásico y valiosos objetos en su interior. Su sorprendente pinacoteca, salón de baile, mueblería, capilla y farmacia privada son solo una pequeña muestra de la enorme inversión destinada a la creación de esta magnífica  residencia, sin duda una belleza arquitectónica de Oruro.",
    "ubicacion": "https://maps.app.goo.gl/bavcAbvEzTqjBk2S8"
  },
  {
    "name": "Balneario de Obrajes",
    "imagenUrl":
        "https://i.postimg.cc/2yJG74zs/temp-Image-Gl-Thb-X.avif",
    "descripcion":
        "Este atractivo turístico se encuentra al noroeste de Oruro a unos 25 kilómetros de distancia aproximadamente. Es popular por sus aguas termales de propiedades medicinales y de relajamiento, el balneario está rodeado de senderos y montañas, además de hoteles y restaurantes que ofrecen lo mejor de la gastronomía local. Buses cada día hasta las 4 de la tarde de la calle Caro esquina 6 de Agosto.",
    "ubicacion": "https://maps.app.goo.gl/VUtNocDBGhsH7E8J9"
  },
  {
    "name": "Plaza Sebastian Pagador",
    "imagenUrl":
        "https://i.postimg.cc/vB2tGW64/temp-Imagex-PJp7-H.avif",
    "descripcion":
        "Un lugar bastante tranquilo y te permite descansar en tu trajín diario. Perfecto para tomarse fotos y descansar con el relajante panorama de las aguas danzantes.",
    "ubicacion": "https://maps.app.goo.gl/X79ryaYp2PDZyHEa8"
  },
  {
    "name": "Parque de La Union Nacional",
    "imagenUrl": "https://i.postimg.cc/GhWzBJgY/temp-Image-D4-Dbmt.avif",
    "descripcion":
        "Este pintoresco parque es un lugar bastante concurrido por la población de Oruro, sirve de punto de encuentro para desfiles, marchas, aniversarios o actividades relacionadas a las festividades de la ciudad. Presenta áreas verdes, banquetas y en su centro una imagen del escudo Nacional; es un lugar acogedor propicio para descansar en solitario o ir a socializar con amigos.",
    "ubicacion": "https://maps.app.goo.gl/keQDWTZHzVE6xrWV7"
  },
  {
    "name": "Plaza 10 de Febrero",
    "imagenUrl":
        "https://i.postimg.cc/gjr4hMPy/temp-Imagej-J3-U0y.avif",
    "descripcion":
        "La plaza 10 de febrero conocida también como Plaza Mayor o Plaza de armas representa el centro de Oruro, es un lugar donde se gestaron muchos acontecimientos históricos como revoluciones y golpes de estado. En la plaza encontramos una fuente, áreas verdes, esculturas de animales hechas en bronce y zonas de parqueo; es el lugar perfecto para reposar después de un ajetreado día, dar un paseo y pasar un rato agradable.",
    "ubicacion": "https://maps.app.goo.gl/T43qpHSSJRzm8ntWA"
  },
  {
    "name": "Museo del Socavón",
    "imagenUrl": "https://i.postimg.cc/cJZmh1SL/temp-Image8x6-OAR.avif",
    "descripcion":
        "El Museo del Minero, es un novedoso espacio que se encuentra ubicado en el subsuelo del cerro Pie de Gallo, exactamente en el Santuario de la mamita Candila, la Virgen del Socavón, donde se puede conocer como se realizaba la faena dentro de una mina de plata. La bocamina es una prolongada gradería donde se puede acceder a este maravilloso museo, el cual está dividido en cinco interesantes sectores, entre los más interesantes se exhiben, el Tío de la Mina (una estatua con la figura de un rostro diabólico), la representación de Nina Nina, quien también tiene una leyenda romántica, por cierto.",
    "ubicacion": "https://maps.app.goo.gl/iDKUaA5TQ4wenkqr5"
  },
  {
    "name": "Monumento a la Virgen",
    "imagenUrl": "https://i.postimg.cc/rpCh20J4/temp-Imagej-Ah-Yv-I.avif",
    "descripcion":
        "Monumento a La Virgen del Socavón… Acceso en teleférico los días miércoles, sábado y domingo",
    "ubicacion": "https://maps.app.goo.gl/W7FHBnrNdkCspCSw5"
  },
  {
    "name": "Zoologico Municipal Andino",
    "imagenUrl":
        "https://i.postimg.cc/9XNL2jGL/temp-Image-PEMg-P4.avif",
    "descripcion":
        "Este centro protector de especies silvestres del altiplano boliviano fue creado en 1960, siendo el primer Zoológico del país. Es un espacio que conecta la naturaleza, la recreación y el aprendizaje, se ubica entre las calles Tomas Frías y Capitán Barriga, sirve de hábitat de 80 especies de animales de la región andina y posee un acuario con más de un millar de especies de peces. El zoológico se encarga de concientizar la conservación de la fauna andina y el uso de los recursos naturales, así como asegurarse del cuidado y bienestar de los animales que alberga.",
    "ubicacion": "https://maps.app.goo.gl/6FHchRAzepgJLcZe8"
  }
];
