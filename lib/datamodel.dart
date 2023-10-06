class datas{
  final String Heading;
  final String Detail;

  datas({required this.Heading,required this.Detail});
  static datas fromMap(Map<String , Object?>map){
    final Heading =['Heading'] as String;
    final Detail =['Detail'] as String;
    return datas(Heading: Heading, Detail: Detail); 
  }

}