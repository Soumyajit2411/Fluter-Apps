import 'package:flutter/material.dart';
import 'buttom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.time, {Key? key}) : super(key: key);
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    const List<String> aquarius = [
      'Aquarius',
      'Aquarius, (Latin: “Water Bearer”) in astronomy, zodiacal constellation lying in the southern sky between Capricornus and Pisces, at about 22 hours right ascension and 10° south declination. It lacks striking features, the brightest star, Sadalmelik (Arabic for “the lucky stars of the king”), being of magnitude 3.0.',
    ];
    const List<String> capricorn = [
      'Capricorn',
      'Capricornus, (Latin: “Goat-horned”) , also called Capricorn and the Goat, in astronomy, zodiacal constellation lying in the southern sky between Aquarius and Sagittarius, at about 21 hours right ascension and 20° south declination. Its stars are faint; Deneb Algedi (Arabic for “kid’s tail”) is the brightest star, with a magnitude of 2.9.',
    ];
    const List<String> pisces = [
      'Picis',
      'Pisces, (Latin: “Fishes”) in astronomy, zodiacal constellation in the northern sky between Aries and Aquarius, at about 1 hour right ascension and 15° north declination. The vernal equinox, the point where the Sun’s annual apparent path takes it north of the celestial equator and from which celestial longitude and right ascension are measured, lies in Pisces. ',
    ];
    const List<String> aries = [
      'Aries',
      'Aries contains no very bright stars; the brightest star, Hamal (Arabic for “sheep”), has a magnitude of 2.0. The first point of Aries, or vernal equinox, is an intersection of the celestial equator with the apparent annual pathway of the Sun and the point in the sky from which celestial longitude and right ascension are measured.',
    ];
    const List<String> taurus = [
      'Taurus',
      'Taurus, (Latin: “Bull”) in astronomy, zodiacal constellation lying in the northern sky between Aries and Gemini, at about 4 hours 20 minutes right ascension and 16° north declination. The constellation’s brightest star, Aldebaran (Arabic for “the follower”; also called Alpha Tauri), is the 14th brightest star in the sky, with a magnitude of 0.85. ',
    ];
    const List<String> gemini = [
      'Gemini',
      'Gemini, (Latin: “Twins”) in astronomy, zodiacal constellation lying in the northern sky between Cancer and Taurus, at about 7 hours right ascension and 22° north declination. Its brightest stars are Castor and Pollux (Alpha and Beta Geminorum); Pollux is the brighter of the two, with a magnitude of 1.15 . ',
    ];
    const List<String> cancer = [
      'Cancer',
      'Cancer, (Latin: “Crab”) in astronomy, zodiacal constellation lying in the northern sky between Leo and Gemini, at about 8 hours 25 minutes right ascension and 20° north declination. It contains the well-known star cluster called Praesepe, or the Beehive. ',
    ];
    const List<String> leo = [
      'Leo',
      'Leo, (Latin: “Lion”) in astronomy, zodiacal constellation lying in the northern sky between Cancer and Virgo, at about 10 hours 30 minutes right ascension and 15° north declination. Regulus (Latin for “little king”; also called Alpha Leonis), the brightest star, is of magnitude 1.35. ',
    ];
    const List<String> virgo = [
      'Virgo',
      'Virgo, (Latin: “Virgin”) in astronomy, zodiacal constellation lying in the southern sky between Leo and Libra, at about 13 hours right ascension and 2° south declination. The constellation’s brightest star, Spica (Latin for “head of grain,” also called Alpha Virginis), is the 15th brightest star in the sky, with a magnitude of 1.04. ',
    ];
    const List<String> libra = [
      'Libra',
      'Libra, (Latin: “Balance”) in astronomy, zodiacal constellation in the southern sky lying between Scorpius and Virgo, at about 15 hours 30 minutes right ascension and 15° south declination. Its stars are faint; the brightest star, Zubeneschamali (Arabic for “northern claw,” as it was earlier regarded as part of Scorpius; also called Beta Librae .',
    ];
    const List<String> scorpio = [
      'Scorpio',
      'Scorpius, (Latin: “Scorpion”) also called Scorpio, in astronomy, zodiacal constellation lying in the southern sky between Libra and Sagittarius, at about 16 hours 30 minutes right ascension and 30° south declination. Its brightest star, Antares (Alpha Scorpii), the 15th brightest star in the sky, has a magnitude of 1.1. ',
    ];
    const List<String> sagittarius = [
      'Sagittarius',
      'Sagittarius, (Latin: “Archer”) in astronomy, zodiacal constellation in the southern sky lying between Capricornus and Scorpius, at about 19 hours right ascension and 25° south declination. The centre of the Milky Way Galaxy lies in the radio source Sagittarius A*. ',
    ];

    List<String>? getZodicaSign(DateTime date) {
      var days = date.day;
      var months = date.month;
      if (months == 1) {
        if (days >= 21) {
          return aquarius;
        } else {
          return capricorn;
        }
      } else if (months == 2) {
        if (days >= 20) {
          return pisces;
        } else {
          return aquarius;
        }
      } else if (months == 3) {
        if (days >= 21) {
          return aries;
        } else {
          return pisces;
        }
      } else if (months == 4) {
        if (days >= 21) {
          return taurus;
        } else {
          return aries;
        }
      } else if (months == 5) {
        if (days >= 22) {
          return gemini;
        } else {
          return taurus;
        }
      } else if (months == 6) {
        if (days >= 22) {
          return cancer;
        } else {
          return gemini;
        }
      } else if (months == 7) {
        if (days >= 23) {
          return leo;
        } else {
          return cancer;
        }
      } else if (months == 8) {
        if (days >= 23) {
          return virgo;
        } else {
          return leo;
        }
      } else if (months == 9) {
        if (days >= 24) {
          return libra;
        } else {
          return virgo;
        }
      } else if (months == 10) {
        if (days >= 24) {
          return scorpio;
        } else {
          return libra;
        }
      } else if (months == 11) {
        if (days >= 23) {
          return sagittarius;
        } else {
          return scorpio;
        }
      } else if (months == 12) {
        if (days >= 22) {
          return capricorn;
        } else {
          return sagittarius;
        }
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOROSCOPE'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              getZodicaSign(time)![0],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     height: 20,
          //     padding: const EdgeInsets.all(15),
          //     margin: const EdgeInsets.all(25),
          //     alignment: Alignment.topCenter,
          //     child: Text(
          //       getZodicaSign(time)![0],
          //       style: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 50,
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(25),
              alignment: Alignment.topCenter,
              child: Text(
                getZodicaSign(time)![1],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Buttombutton(
            () {
              Navigator.pop(context);
            },
            'See Another',
          ),
        ],
      ),
    );
  }
}
