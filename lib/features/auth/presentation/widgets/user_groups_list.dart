//import 'package:flutter/material.dart';
//import 'package:model_flutter/core/data/model/ObjectBox/objectBoxModels.dart';
//import 'package:model_flutter/core/presentation/notifiers/core_state.dart';
//import 'package:model_flutter/core/res/constants.dart';
//import 'package:model_flutter/features/auth/presentation/notifiers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/data/model/ObjectBox/objectBoxModels.dart';
import '../../../../core/res/constants.dart';

class UserGroupsList extends StatelessWidget {
  const UserGroupsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<GroupObject>? items = Constants.groups;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: items!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  //backgroundColor: const Color(0xff764abc),
                  child: Text((index + 1).toString()),
                ),
                title: Text('Responsable ' + items[index].name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal.shade100,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    )),
                trailing: Icon(Icons.more_vert),
                // tileColor: Colors.red,
                minVerticalPadding: 18.0,
              );
            },
          ),
        ]);

    /*
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('lib/assets/images/fadcrepin.jpg'),
          ),
        ]);
        */
  }
}
