// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:workbee/home/components/build_coin_section.dart';
import 'package:workbee/home/components/build_section.dart';
import 'package:workbee/home/components/home_page_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 206, 206),
      body: Column(
        children: [
          buildHeader(),
          Expanded(child: _buildContent(context)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 234, 234, 234),
              Color.fromARGB(255, 206, 206, 206),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCoinSection(context),
              const SizedBox(height: 20),
              buildSection('Works Available'),
              const SizedBox(height: 20),
              buildSection('Created Works'),
            ],
          ),
        ),
      ),
    );
  }
}
