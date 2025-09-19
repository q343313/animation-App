

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messanger/data/firebasedata/notificattiondata.dart';
import 'package:messanger/main.dart';

final notificationprovider = StateNotifierProvider<NotificationNotifier,NotiicationStates>((ref)=>NotificationNotifier(getIt()));

class NotificationNotifier extends StateNotifier<NotiicationStates>{
  final NotificationData notificationData;
NotificationNotifier(this.notificationData):super(NotiicationStates(id: "", visible: false, messageid: []));

addmessages(String messageid){
  if(state.messageid.contains(messageid)){
    state = state.copyWith(messageid: state.messageid.where((e)=>e != messageid).toList());
  }else{
    state = state.copyWith(messageid: [...state.messageid,messageid]);
  }
}

visiblewidget(){
  state = state.copyWith(visible: true);
}

hidewidget(){
  state = state.copyWith(visible: false);
}

deleteallmessage()async{
  await notificationData.deletelistnotification(state.messageid);
}

deletesinglenotification(String messageid)async {
  state = state.copyWith(id: messageid);
  await notificationData.deletenotification(state.id);
}

clearlist(){
  state = state.copyWith(messageid: []);
}

}

class NotiicationStates {

  final List<String>messageid;
  final bool visible;
  final String id;

  NotiicationStates({required this.id,required this.visible,required this.messageid});
  NotiicationStates copyWith({
    List<String>?messageid,
     bool?visible,
     String?id
}){
    return NotiicationStates(id: id??this.id, visible: visible??this.visible, messageid: messageid??this.messageid);
  }
}
