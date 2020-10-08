import 'package:flutter/material.dart';
import 'package:farmasee/src/widgets/side_menu/side_menu.dart';
import 'package:farmasee/src/widgets/app_bar_widget.dart';

class PrescriptionsListPage extends StatelessWidget {
  static const String route = 'prescriptions-list';
  static const String appbarText = 'Prescriptions';
  final List<String> pTitle = <String>['Prescription 1', 'Prescription'];

  @override
  Widget build(BuildContext context) {
    // final MyPrescriptionBloc bloc = BlocProvider.of(context).my
    return Scaffold(
      appBar: appBar(appbarText, context),
      
      body: ListView.builder(
        itemCount: pTitle.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Icon(Icons.list),
            trailing: Text("GFG", style: TextStyle(color: Colors.green, fontSize: 15),),
            title: Text(pTitle[index]),
          );

      })
      ,
      drawer: SideMenu(route: route),
    );

  }
}