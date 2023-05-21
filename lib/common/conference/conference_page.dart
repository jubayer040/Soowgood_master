import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soowgood/common/conference/conference_button_bar.dart';
import 'package:soowgood/common/conference/conference_room.dart';
import 'package:soowgood/common/conference/draggable_publisher.dart';
import 'package:soowgood/common/conference/participant_widget.dart';
import 'package:soowgood/common/dialog/ok_dialog.dart';
import 'package:soowgood/common/local_database/key_constants.dart';
import 'package:soowgood/common/local_database/my_shared_preference.dart';
import 'package:soowgood/common/resources/my_assets.dart';
import 'package:soowgood/common/widget/noise_box.dart';
import 'package:soowgood/common/widget/platform_alert_dialog.dart';
import 'package:wakelock/wakelock.dart';


///
///
/// use twilio_programmable_video: ^1.0.0 dependency to implement video calling
/// refer https://gitlab.com/twilio-flutter/programmable-video/-/tree/master/programmable_video/example provided in plugin doc
class ConferencePage extends StatefulWidget {

  String accessToken;
  String bookingId;

   ConferencePage({
    Key? key,
     required this.accessToken,
     required this.bookingId
  }) : super(key: key);

  @override
  _ConferencePageState createState() => _ConferencePageState();
}

class _ConferencePageState extends State<ConferencePage> {
  final StreamController<bool> _onButtonBarVisibleStreamController = StreamController<bool>.broadcast();
  final StreamController<double> _onButtonBarHeightStreamController = StreamController<double>.broadcast();
  ConferenceRoom? _conferenceRoom;
  StreamSubscription? _onConferenceRoomException;

  @override
  void initState() {
    super.initState();

    _lockInPortrait();
    _connectToRoom();
    _wakeLock(true);
  }

  ///*
  ///
  /// initialize video call by connecting to ConferenceRoom i.e Room
  void _connectToRoom() async {
    try {
      final conferenceRoom = ConferenceRoom(
        name: widget.bookingId,
        token: widget.accessToken,
        identity: MySharedPreference.getString(KeyConstants.keyUserId)
      );
      await conferenceRoom.connect();
      setState(() {
        _conferenceRoom = conferenceRoom;
        _onConferenceRoomException = conferenceRoom.onException.listen((error) async {
          showDialog(
              context: context,
              builder: (BuildContext context){
                return OKDialog(
                    title: '_onConferenceRoomException',
                    descriptions: error.toString(),
                    img: errorImage);
              });
          await _showPlatformAlertDialog(error);
        });
        conferenceRoom.addListener(_conferenceRoomUpdated);
      });
    } catch (err) {
      log(err.toString());

      showDialog(
          context: context,
          builder: (BuildContext context){
            return OKDialog(
                title: '_connectToRoom',
                descriptions: err.toString(),
                img: errorImage);
          });
      await _showPlatformAlertDialog(err);
      Navigator.of(context).pop();
    }
  }

  Future _showPlatformAlertDialog(err) async {
    await PlatformAlertDialog(
      title: err is PlatformException ? err.message ?? 'An error occurred' : 'An error occurred',
      content: err is PlatformException ? (err.details ?? err.toString()) : err.toString(),
      defaultActionText: 'OK',
    ).show(context);
  }

  Future<void> _lockInPortrait() async {
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    _freePortraitLock();
    _wakeLock(false);
    _disposeStreamsAndSubscriptions();
    _conferenceRoom?.removeListener(_conferenceRoomUpdated);
    super.dispose();
  }

  Future<void> _freePortraitLock() async {
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> _disposeStreamsAndSubscriptions() async {
    await _onButtonBarVisibleStreamController.close();
    await _onButtonBarHeightStreamController.close();
    await _onConferenceRoomException?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: buildLayout(),
      ),
    );
  }


  ///widget with controllers audio, video, hangup camera switch
  Widget buildLayout() {
    final conferenceRoom = _conferenceRoom;

    return conferenceRoom == null
        ? showProgress()
        : LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: <Widget>[
            _buildParticipants(context, constraints.biggest, conferenceRoom),
            ConferenceButtonBar(
              audioEnabled: conferenceRoom.onAudioEnabled,
              videoEnabled: conferenceRoom.onVideoEnabled,
              flashState: conferenceRoom.flashStateStream,
              speakerState: conferenceRoom.speakerStateStream,
              onAudioEnabled: conferenceRoom.toggleAudioEnabled,
              onVideoEnabled: conferenceRoom.toggleVideoEnabled,
              onHangup: _onHangup,
              onSwitchCamera: conferenceRoom.switchCamera,
              onToggleSpeaker: conferenceRoom.toggleSpeaker,
              toggleFlashlight: conferenceRoom.toggleFlashlight,
              onPersonAdd: _onPersonAdd,
              onPersonRemove: _onPersonRemove,
              onHeight: _onHeightBar,
              onShow: _onShowBar,
              onHide: _onHideBar,
            ),
          ],
        );
      },
    );
  }


  ///show progress until connect to room
  Widget showProgress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: CircularProgressIndicator()),
        SizedBox(
          height: 10,
        ),
        Text(
          'Connecting...',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }


  /// disconnect from room to hangup
  Future<void> _onHangup() async {
    log('onHangup');
    await _conferenceRoom?.disconnect();
    Navigator.of(context).pop();

    /*showDialog(
        barrierDismissible: false,
        context: context,
        builder: showJoinAgainDialog);*/
  }

  void _onPersonAdd() {
    final conferenceRoom = _conferenceRoom;
    if (conferenceRoom == null) return;

    log('onPersonAdd');
    try {
      conferenceRoom.addDummy(
        child: Stack(
          children: <Widget>[
            const Placeholder(),
            Center(
              child: Text(
                (conferenceRoom.participants.length + 1).toString(),
                style: const TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      blurRadius: 8.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                  fontSize: 80,
                ),
              ),
            ),
          ],
        ),
      );
    } on PlatformException catch (err) {
      _showPlatformAlertDialog(err);
    }
  }

  void _onPersonRemove() {
    log('onPersonRemove');
    _conferenceRoom?.removeDummy();
  }

  Widget _buildParticipants(BuildContext context, Size size, ConferenceRoom conferenceRoom) {
    final children = <Widget>[];
    final length = conferenceRoom.participants.length;

    if (length <= 2) {
      _buildOverlayLayout(context, size, children);
      return Stack(children: children);
    }

    void buildInCols(bool removeLocalBeforeChunking, bool moveLastOfEachRowToNextRow, int columns) {
      _buildLayoutInGrid(
        context,
        size,
        children,
        removeLocalBeforeChunking: removeLocalBeforeChunking,
        moveLastOfEachRowToNextRow: moveLastOfEachRowToNextRow,
        columns: columns,
      );
    }

    if (length <= 3) {
      buildInCols(true, false, 1);
    } else if (length == 5) {
      buildInCols(false, true, 2);
    } else if (length <= 6 || length == 8) {
      buildInCols(false, false, 2);
    } else if (length == 7 || length == 9) {
      buildInCols(true, false, 2);
    } else if (length == 10) {
      buildInCols(false, true, 3);
    } else if (length == 13 || length == 16) {
      buildInCols(true, false, 3);
    } else if (length <= 18) {
      buildInCols(false, false, 3);
    }

    return Column(
      children: children,
    );
  }

  void _buildOverlayLayout(BuildContext context, Size size, List<Widget> children) {
    final conferenceRoom = _conferenceRoom;
    if (conferenceRoom == null) return;

    final participants = conferenceRoom.participants;
    if (participants.length == 1) {
      children.add(_buildNoiseBox());
    } else {
      final remoteParticipant = participants.firstWhereOrNull((ParticipantWidget participant) => participant.isRemote);
      if (remoteParticipant != null) {
        children.add(remoteParticipant);
      }
    }

    final localParticipant = participants.firstWhereOrNull((ParticipantWidget participant) => !participant.isRemote);
    if (localParticipant != null) {
      children.add(DraggablePublisher(
        key: Key('publisher'),
        availableScreenSize: size,
        onButtonBarVisible: _onButtonBarVisibleStreamController.stream,
        onButtonBarHeight: _onButtonBarHeightStreamController.stream,
        child: localParticipant,
      ));
    }
  }

  void _buildLayoutInGrid(
      BuildContext context,
      Size size,
      List<Widget> children, {
        bool removeLocalBeforeChunking = false,
        bool moveLastOfEachRowToNextRow = false,
        int columns = 2,
      }) {
    final conferenceRoom = _conferenceRoom;
    if (conferenceRoom == null) return;

    final participants = conferenceRoom.participants;
    ParticipantWidget? localParticipant;
    if (removeLocalBeforeChunking) {
      localParticipant = participants.firstWhereOrNull((ParticipantWidget participant) => !participant.isRemote);
      if (localParticipant != null) {
        participants.remove(localParticipant);
      }
    }
    final chunkedParticipants = chunk(array: participants, size: columns);
    if (localParticipant != null) {
      chunkedParticipants.last.add(localParticipant);
      participants.add(localParticipant);
    }

    if (moveLastOfEachRowToNextRow) {
      for (var i = 0; i < chunkedParticipants.length - 1; i++) {
        var participant = chunkedParticipants[i].removeLast();
        chunkedParticipants[i + 1].insert(0, participant);
      }
    }

    for (final participantChunk in chunkedParticipants) {
      final rowChildren = <Widget>[];
      for (final participant in participantChunk) {
        rowChildren.add(
          Container(
            width: size.width / participantChunk.length,
            height: size.height / chunkedParticipants.length,
            child: participant,
          ),
        );
      }
      children.add(
        Container(
          height: size.height / chunkedParticipants.length,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: rowChildren,
          ),
        ),
      );
    }
  }

  NoiseBox _buildNoiseBox() {
    return NoiseBox(
      density: NoiseBoxDensity.xLow,
      backgroundColor: Colors.grey.shade900,
      child: Center(
        child: Container(
          color: Colors.black54,
          width: double.infinity,
          height: 40,
          child: Center(
            child: Text(
              'Waiting for another participant to connect to the call...',
              key: Key('text-wait'),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  List<List<T>> chunk<T>({required List<T> array, required int size}) {
    final result = <List<T>>[];
    if (array.isEmpty || size <= 0) {
      return result;
    }
    var first = 0;
    var last = size;
    final totalLoop = array.length % size == 0 ? array.length ~/ size : array.length ~/ size + 1;
    for (var i = 0; i < totalLoop; i++) {
      if (last > array.length) {
        result.add(array.sublist(first, array.length));
      } else {
        result.add(array.sublist(first, last));
      }
      first = last;
      last = last + size;
    }
    return result;
  }

  void _onHeightBar(double height) {
    _onButtonBarHeightStreamController.add(height);
  }

  void _onShowBar() {
    setState(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    });
    _onButtonBarVisibleStreamController.add(true);
  }

  void _onHideBar() {
    setState(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    });
    _onButtonBarVisibleStreamController.add(false);
  }

  ///*
  ///
  ///
  Future<void> _wakeLock(bool enable) async {
    try {
      return await (enable ? Wakelock.enable() : Wakelock.disable());
    } catch (err) {
      log('Unable to change the Wakelock and set it to $enable');
      showDialog(
          context: context,
          builder: (BuildContext context){
            return OKDialog(
                title: 'Exception _wakeLock',
                descriptions: err.toString(),
                img: errorImage);
          });
      log(err.toString());
    }
  }

  void _conferenceRoomUpdated() {
    setState(() {});
  }

  ///*
  ///
  ///
  Widget showJoinAgainDialog(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            height: 20,
          ),
          Text(
            'Do you want to Rejoin call ?',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'poppins_medium',
              fontSize: 16
            ),
          ),

          SizedBox(height: 15,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: (){
                  _connectToRoom();

                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.lightBlue
                  ),
                  child: Text('Yes', style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins_medium',
                      fontSize: 14
                  ),),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.redAccent
                  ),
                  child: Text('No', style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins_medium',
                      fontSize: 14
                  ),),
                ),
              )

            ],
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
