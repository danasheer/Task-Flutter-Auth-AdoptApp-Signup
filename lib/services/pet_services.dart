import 'package:adopt_app/models/pet.dart';
import 'package:dio/dio.dart';

class PetServices {
  final Dio _dio = Dio();

  final _baseurl = "https://coded-pets-api-crud.herokuapp.com";
  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
    try {
      var petsJason = await _dio.get('$_baseurl/pets') as List;
      var pets = petsJason.map((pet) => Pet.fromJson(pet)).toList();
    } on DioError catch (error) {
      print(error);
    }

    return pets;
  }
}
