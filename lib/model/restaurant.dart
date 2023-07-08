class Restaurant {
  final String rid;
  final String remail;
  final String rname;
  final String rlogo;
  final String rdelivery_fee;
  final String rphone;
  final String raddress;


  Restaurant(this.rid, this.remail, this.rname, this.rlogo, this.rdelivery_fee, this.rphone, this.raddress);
  Restaurant.fromJson(Map<String, dynamic> json)
      : rid = json['public_id'],
        remail = json['email'],
        rname = json['name'],
        rlogo = json['logo'],
        raddress = json['address'],

        rdelivery_fee = json['delivery_fee'],
        rphone = json['contact_number'];

  Map<String, dynamic> toJson()=>{
    'rid': rid,
    'remail': remail,
    'rname': rname,
    'rlogo': rlogo,
    'raddress': raddress,
    'rdelivery_fee': rdelivery_fee,
    'rphone': rphone,
  };
}
