import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/contact.dart';
import 'package:shopping_app/models/user.dart';
import 'package:shopping_app/provider/user_provider.dart';
import 'package:shopping_app/resources/firebase_methods.dart';
import 'package:shopping_app/screens/chatscreens/chat_screen.dart';
import 'package:shopping_app/screens/chatscreens/widgets/cached_image.dart';
import 'package:shopping_app/widgets/custom_tile.dart';

import 'last_message_container.dart';
import 'online_dot_indicator.dart';

class ContactView extends StatelessWidget {
  final Contact contact;
  ContactView({this.contact});

  FirebaseMethods _firebaseMethods = FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _firebaseMethods.getUserDetailsById(contact.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data;

          return ViewLayout(
            contact: user,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ViewLayout extends StatelessWidget {
  final User contact;
  final FirebaseMethods _firebaseMethods = FirebaseMethods();

  ViewLayout({
    @required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return CustomTile(
      mini: false,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                receiver: contact,
              ),
            ));
      },
      title: Text(
        contact?.name == userProvider.getUser.name
            ? "Me"
            : contact?.name ?? "..",
        style:
            TextStyle(color: Colors.black, fontFamily: "Arial", fontSize: 19),
      ),
      subtitle: LastMessageContainer(
        stream: _firebaseMethods.fetchLastMessageBetween(
            senderId: userProvider.getUser.uid, receiverId: contact.uid),
      ),
      leading: Container(
        constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
        child: Stack(
          children: <Widget>[
            CachedImage(
              contact.profilePhoto,
              radius: 80,
              isRound: true,
            ),
            OnlineDotIndicator(
              uid: contact.uid,
            )
          ],
        ),
      ),
    );
  }
}
