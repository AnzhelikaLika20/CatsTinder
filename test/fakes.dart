import 'package:mocktail/mocktail.dart';
import 'package:cats_tinder/domain/entity/cat.dart';
import 'package:cats_tinder/domain/entity/liked_cat.dart';

class FakeCat extends Fake implements Cat {}

class FakeLikedCat extends Fake implements LikedCat {}
