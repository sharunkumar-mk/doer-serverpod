class Service {
  String name;
  List<String> description;
  String image;
  List<SubService>? subServices;
  Service(
      {required this.name,
      required this.description,
      required this.image,
      this.subServices});
}

class SubService {
  String name;
  List<String> description;
  String image;
  SubService(
      {required this.name, required this.description, required this.image});
}
