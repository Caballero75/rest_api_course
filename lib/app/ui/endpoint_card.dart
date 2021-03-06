import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/api.dart';

class EndpointCardData {
  final String title;
  final String assetName;
  final Color color;

  EndpointCardData(this.title, this.assetName, this.color);
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({
    Key key,
    this.endpoint,
    this.value,
  }) : super(key: key);

  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndpointCardData> _cardsData = {
    Endpoint.cases: EndpointCardData(
      'Cases',
      "assets/count.png",
      Color(0xFFFFF492),
    ),
    Endpoint.casesSuspected: EndpointCardData(
      'Suspected Cases',
      "assets/suspect.png",
      Color(0xFFEEDA28),
    ),
    Endpoint.casesConfirmed: EndpointCardData(
      'Confirmed Cases',
      "assets/fever.png",
      Color(0xFFE99600),
    ),
    Endpoint.deaths: EndpointCardData(
      'Deaths',
      "assets/death.png",
      Color(0xFFE40000),
    ),
    Endpoint.recovered: EndpointCardData(
      'Recovered',
      "assets/patient.png",
      Color(0xFF70A901),
    ),
  };

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat().format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardData.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: cardData.color),
                ),
                SizedBox(height: 4),
                SizedBox(
                  height: 52,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        cardData.assetName,
                        color: cardData.color,
                      ),
                      Text(
                        formattedValue,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: cardData.color,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      if (value == null)
                        CircularProgressIndicator(
                          backgroundColor: Color(0xFF1B1F52),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
