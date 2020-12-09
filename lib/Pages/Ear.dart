import 'package:flutter/material.dart';
import 'package:heacker_app/authentication/constants.dart';
import './About.dart';
import 'package:heacker_app/authentication/login_view.dart';
import 'package:heacker_app/authentication/Auth.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';
import 'package:volume/volume.dart';

class Ear extends StatefulWidget {
  @override
  _Ear createState() => _Ear();
}

class _Ear extends State<Ear> {
  AudioPlayer advancedPlayer;
  static AudioCache audioCache = AudioCache();
  bool isPlaying = false;
  double _currentSliderValue = 0;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  String localFilePath;
  double _sliderValue = 0.0;

  AudioManager audioManager;
  int maxVol, currentVol;
  ShowVolumeUI showVolumeUI = ShowVolumeUI.SHOW;

  @override
  void initState() {
    super.initState();

    audioManager = AudioManager.STREAM_MUSIC;
    initAudioStreamType();
    updateVolumes();

    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  @override
  void dispose() {
    super.dispose();
    advancedPlayer.stop();

    setState(() {
      isPlaying = false;
    });
  }

  Future<void> initAudioStreamType() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  updateVolumes() async {
    // get Max Volume
    maxVol = await Volume.getMaxVol;
    // get Current Volume
    currentVol = await Volume.getVol;
    setState(() {});
  }

  setVol(int i) async {
    await Volume.setVol(i, showVolumeUI: showVolumeUI);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Ear Checker Page"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 12.0,
                      left: 16.0,
                      child: Text(
                        'Heacker - Health Checker',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
                title: new Text("About Us"),
                leading: Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new About()));
                }),
            new ListTile(
                title: new Text("Logout"),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  await Auth.signOut().then((value) => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()))
                      });
                }),
          ],
        ),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  new Image.asset(
                    "assets/images/Logo.png",
                    height: 220.0,
                    width: 220.0,
                  ),
                  Text(
                    currentVol.toString(),
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  (currentVol != null || maxVol != null)
                      ? Slider(
                          value: currentVol / 1.0,
                          divisions: maxVol,
                          max: maxVol / 1.0,
                          min: 0,
                          onChanged: (double d) {
                            setVol(d.toInt());
                            updateVolumes();
                          },
                        )
                      : Container(),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  InkWell(
                    onTap: () async {
                      if (isPlaying == true) {
                        advancedPlayer.stop();

                        setState(() {
                          isPlaying = false;
                        });
                        print("IsPlaying: {$isPlaying}");
                      } else {
                        advancedPlayer = await audioCache.play('1Khz.mp3');

                        setState(() {
                          isPlaying = true;
                        });
                        print("IsPlaying: {$isPlaying}");
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      width: 50.0,
                      child: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                      decoration: BoxDecoration(
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  new Text(
                      "Tekan tombol play, lalu geser slider \n sampai suara terdengar",
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new IconButton(
            icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
            onPressed: () async {
              if (isPlaying) {
                advancedPlayer.stop();

                setState(() {
                  isPlaying = false;
                });
              } else {
                advancedPlayer = await audioCache.play("1Khz.mp3");

                setState(() {
                  isPlaying = true;
                });
              }
            },
          ),
        ),
      ),
      */

/*
body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  new Text("Ear Checker"),
                  Padding(
                    padding: EdgeInsets.only(top: 250.0),
                  ),
                  new Slider(
                      // value: _currentSliderValue,
                      // min: 0,
                      // max: 200,
                      // divisions: 200,
                      // label: _currentSliderValue.round().toString(),
                      // onChanged: (double value) {
                      //   setState(() {
                      //     _currentSliderValue = value;
                      //   });
                      // },
                      activeColor: Colors.black,
                      inactiveColor: Colors.pink,
                      value: _position.inSeconds.toDouble(),
                      min: 0.0,
                      max: _duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          seekToSecond(value.toInt());
                          value = value;
                        });
                      }),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  InkWell(
                    onTap: () async {
                      if (isPlaying) {
                        advancedPlayer.stop();

                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        advancedP await audioCache.play('A.mp3');

                        setState(() {
                          isPlaying = true;
                        });
                      }
                      // await audioCache.play('A.mp3');
                      // print(advancedPlayer);

                      // setState(() {
                      //   isPlaying = false;
                      // });
                      // if (isPlaying) {
                      //   advancedPlayer.stop();

                      //   setState(() {
                      //     isPlaying = false;
                      //   });
                      // } else {
                      //   audioCache.play('sounds/1Khz.mp3');

                      //   setState(() {
                      //     isPlaying = true;
                      //   });
                      // }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      width: 50.0,
                      child: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                      decoration: BoxDecoration(
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  ),
                  // new IconButton(
                  //     icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  //     color: ColorPalette.primaryColor,
                  //     onPressed: () {}),
                ],
              ),
            )
*/
// new InkWell(
//   onTap: () async {
//     if (isPlaying) {
//       advancedPlayer.stop();

//       setState(() {
//         isPlaying = false;
//       });
//     } else {
//       advancedPlayer = await audioCache.play('A.mp3');

//       Fluttertoast.showToast(
//         msg: "Wrong Email or Password {$advancedPlayer}",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//         );

//       setState(() {
//         isPlaying = true;
//       });
//     }
//   },
//   child: Container(
//     padding: EdgeInsets.symmetric(vertical: 8.0),
//     width: 50.0,
//     child: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
//     decoration: BoxDecoration(
//       color: ColorPalette.primaryColor,
//     ),
//   ),
