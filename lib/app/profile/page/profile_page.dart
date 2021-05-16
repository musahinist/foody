import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/app/profile/widget/credit_card_widget.dart';
import 'package:foody/common/widget/form/form_input_field_with_icon_widget.dart';
import 'package:foody/util/validator_util.dart';
import 'package:get/route_manager.dart';

import '../../auth/bloc/authentication_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameCtrl = TextEditingController();
  late AuthBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = AuthBloc();
  }

  @override
  void dispose() {
    bloc.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  content: Text(
                      'Are you sure you want to log out of the application?'),
                  actions: [
                    ElevatedButton(
                      child: Text('OK'),
                      onPressed: () {
                        bloc.add(const SignOutEvent());
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.lightGreen[50],
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      child: SvgPicture.asset(
                        'asset/svg/dots.svg',
                      ),
                    ),
                    const SizedBox(
                      width: 140,
                      height: 140,
                      child: CircularProgressIndicator(
                        value: 0.8,
                        strokeWidth: 10,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.lightGreen[50],
                      radius: 67,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://styles.redditmedia.com/t5_dz9jg/styles/profileIcon_imbb9n6vnfb01.jpg?width=256&height=256&crop=256:256,smart&frame=1&s=2b31e594284836323836cf8b6c772156e609769d'),
                        backgroundColor: Colors.blue,
                        radius: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Musa Şahin',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 16),
              RaisedButton.icon(
                  icon: const Icon(
                    Icons.point_of_sale,
                    color: Colors.amber,
                  ),
                  shape: const StadiumBorder(),
                  color: Colors.white,
                  label: Text(
                    '3600 points',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  onPressed: () {}),
              const SizedBox(height: 16),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 1,
            builder: (context, ctrl) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
              ),
              child: ListView(
                controller: ctrl,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('General'),
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Profile Settings'),
                    children: [
                      Container(
                        color: Colors.grey[200],
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          child: Column(
                            children: [
                              FormInputFieldWithIconWidget(
                                controller: nameCtrl,
                                iconPrefix: Icons.person,
                                labelText: 'User Name',
                                validator: ValidatorUtil().requiredField,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (String value) {},
                                onSuffixTap: () {},
                              ),
                              FormInputFieldWithIconWidget(
                                controller: nameCtrl,
                                iconPrefix: Icons.person,
                                labelText: 'Photo Url',
                                validator: ValidatorUtil().requiredField,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (String value) {},
                              ),
                              FormInputFieldWithIconWidget(
                                controller: nameCtrl,
                                iconPrefix: Icons.person,
                                labelText: 'User Name',
                                validator: ValidatorUtil().requiredField,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (String value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.payment),
                    title: Text('Credit Cards'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CreditCard(),
                      )
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text('Addresses'),
                    children: [
                      Container(
                        color: Colors.grey[200],
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          child: Column(
                            children: [
                              FormInputFieldWithIconWidget(
                                controller: nameCtrl,
                                iconPrefix: Icons.location_on_outlined,
                                labelText: 'Address',
                                validator: ValidatorUtil().requiredField,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (String value) {},
                                onSuffixTap: () {},
                                // minLines: 3,
                                maxLines: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.notifications_outlined),
                    title: Text('Notifications'),
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.directions_bike),
                    title: Text('My Orders'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
