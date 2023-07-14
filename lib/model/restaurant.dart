class Restaurant {
  final String rid;
  final String rdelivery_time;
  final String rstatus;
  final String remail;
  final String rname;
  final String rlogo;
  final String rdelivery_fee;
  final String rphone;
  final String raddress;

  Restaurant(this.rid, this.remail, this.rname, this.rlogo, this.rdelivery_fee,
      this.rphone, this.raddress, this.rdelivery_time, this.rstatus);
  Restaurant.fromJson(Map<String, dynamic> json)
      : rid = json['public_id'],
        remail = json['email'],
        rname = json['name'],
        rstatus = json['status'],
        rlogo = json['logo'],
        raddress = json['address'],
        rdelivery_time = json['delivery_time'],
        rdelivery_fee = json['delivery_fee'],
        rphone = json['contact_number'];

  Map<String, dynamic> toJson() => {
        'rid': rid,
        'remail': remail,
        'rname': rname,
        'rlogo': rlogo,
        'rdelivery_time': rdelivery_time,
        'raddress': raddress,
        'rstatus': rstatus,
        'rdelivery_fee': rdelivery_fee,
        'rphone': rphone,
      };
}
