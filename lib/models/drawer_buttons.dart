import 'package:flutter/material.dart';


class ListButton extends StatelessWidget {
  const ListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.list),
      title: const Text('list of articles'),
      onTap: () {
        Navigator.pop(context);
        if (ModalRoute.of(context)?.settings.name != '/home') {
          Navigator.pushNamed(context, '/home');
        }
        else {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
    );
  }
}

          // ListTile(
          //   leading: const Icon(Icons.list),
          //   title: const Text('list of articles'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
          //   },
          // ),


class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.heat_pump_rounded),
      title: const Text('about application'),
      onTap: () {
        Navigator.pop(context);
        if (ModalRoute.of(context)?.settings.name != '/about') {
          Navigator.pushNamed(context, '/about');
        }
        else {
          Navigator.pushReplacementNamed(context, '/about');
        }
      },
    );
  }
}

          // ListTile(
          //   leading: const Icon(Icons.heat_pump_rounded),
          //   title: const Text('about application'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutPage()));
          //   },
          // ),
