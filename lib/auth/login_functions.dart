import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Either<String, User>> signUp(String email, String password) async {
  try {
    final AuthResponse res = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
    final User? user = res.user;
    if (user == null) throw Text('Go login');

    return right(user);
  } on Exception catch (e) {
    return left(e.toString());
  }
}

Future<Either<String, User>> signIn(String email, String password) async {
  try {
    final AuthResponse res = await Supabase.instance.client.auth
        .signInWithPassword(email: email, password: password);
    final Session? session = res.session;
    final User? user = res.user;
    log(session.toString());
    if (user == null) throw Text('Go login');
    return right(user);
  } on Exception catch (e) {
    log(e.toString());

    return left(e.toString());
  }
}

      // email: 'abdallah.mohellebi@gmail.com',
      // password: 'ahdsaee123',
