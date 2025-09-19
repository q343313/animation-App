
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messanger/data/firebasedata/notificattiondata.dart';
import 'package:messanger/riverpad/notificationprovider.dart';

class Blocscreens extends ConsumerStatefulWidget {
  const Blocscreens({super.key});

  @override
  ConsumerState<Blocscreens> createState() => _BlocscreensState();
}

class _BlocscreensState extends ConsumerState<Blocscreens> {
  final refe = FirebaseFirestore.instance.collection("message").snapshots() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
        actions: [

          Consumer(builder: (context,ref,child){
            final notificstionpro= ref.watch(notificationprovider.select((val)=>val.visible));
            return Visibility(
              visible: notificstionpro,
                child: IconButton(onPressed:(){
                  ref.read(notificationprovider.notifier).deleteallmessage();
                  ref.read(notificationprovider.notifier).hidewidget();
                  ref.read(notificationprovider.notifier).clearlist();
                }, icon: Icon(Icons.delete,color: Colors.red,)));
          }),
          SizedBox(width: 12,)
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Expanded(child:
              StreamBuilder(
                  stream: refe,
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CupertinoActivityIndicator(color: Colors.blue,),
                      );
                    }else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString(),style: TextStyle(fontSize: 18,fontFamily: "heading_c"),),
                      );
                    }else if(!snapshot.hasData){
                      return Center(
                        child: Text("No Message Found",style: TextStyle(fontFamily: "heading_c",fontSize: 18),),
                      );
                    }else{
                      final doc = snapshot.data!.docs;
                      return ListView.builder(itemCount: doc.length,
                      itemBuilder: (context,index){
                        final message  = doc[index];
                        return Consumer(
                          builder: (context,ref,child){
                            final notificstionpro= ref.watch(notificationprovider);
                            final exists = notificstionpro.messageid.contains(message.id);
                            return Dismissible(
                              key: ValueKey(message.id.toString()),
                              onDismissed: (Disss){
                                NotificationData().deletenotification(message.id);
                              },
                              child: Card(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white10
                                    : Colors.grey.shade300,
                                child: ListTile(
                                onTap: (){
                                  ref.read(notificationprovider.notifier).hidewidget();
                                  ref.read(notificationprovider.notifier).clearlist();
                                },
                                  onLongPress: (){
                                  ref.read(notificationprovider.notifier).visiblewidget();
                                  },
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/lo.png"),
                                  ),
                                  title:Wrap(
                                    children: [
                                      AutoSizeText(message["title"].toString(),style: TextStyle(fontSize: 17,fontFamily: "heading_c"),),
                                      SizedBox(width: 8,),
                                      AutoSizeText(message["datetime"].toString(),style: TextStyle(fontSize: 13,fontFamily: "body_c"),),
                                    ],
                                  ),
                                  subtitle: AutoSizeText(message["body"].toString(),style: TextStyle(fontSize: 21,fontFamily: "body_p"),),
                                  trailing: Visibility(
                                    visible: notificstionpro.visible,
                                      child: Checkbox(value:exists, onChanged: (value){
                                        ref.read(notificationprovider.notifier).addmessages(message.id);
                                      })),
                                ),
                              ),
                            );
                          },

                        );
                      },);
                    }
                  }
              ))
            ],
          ),
        ),
      ),
    );
  }
}
