class Messagemodel {
  final String message;
  final String id;
 

  Messagemodel( {
    required this.message,
    required this.id,
  });
  factory Messagemodel.fromJson(json) {
    return Messagemodel(
      message: json['message'],
      id: json['id'],
     
    );
  }
}