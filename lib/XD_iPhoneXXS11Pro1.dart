import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:adobe_xd/specific_rect_clip.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XD_iPhoneXXS11Pro1 extends StatelessWidget {
  XD_iPhoneXXS11Pro1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f3db),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(30.0, 226.0),
            child: SpecificRectClip(
              rect: Rect.fromLTWH(0, 0, 318, 518),
              child: UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 318,
                  height: 599,
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.all(0),
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 20,
                    crossAxisCount: 1,
                    childAspectRatio: 3.8313253012048194,
                    children: [
                      {},
                      {},
                      {},
                      {},
                      {},
                      {},
                      {},
                    ].map((map) {
                      return Transform.translate(
                        offset: Offset(-29.0, -226.0),
                        child: Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(39.0, 233.0),
                              child: Container(
                                width: 298.0,
                                height: 63.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff707070)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x7a000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 6)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 93.0),
            child: SizedBox(
              width: 284.0,
              child: Text(
                'Daily Cutting Report',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 27,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_4c8c057673084f8bada19d1c1fcd8cf1 =
    '<svg viewBox="0.5 34.5 383.0 1.0" ><path transform="translate(0.5, 34.5)" d="M 0 0 C 0 0 73.83646392822266 0 159.2651062011719 0 C 242.0455017089844 0 335.7949829101562 0 383 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
