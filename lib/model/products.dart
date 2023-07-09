class ProductModel {
  final String pid;
  final String pname;
  final String pimage;
  final String pprice;
  final String pdescription;


  ProductModel(this.pid,this.pname, this.pimage, this.pprice, this.pdescription);
  ProductModel.fromJson(Map<String, dynamic> json)
      : pid = json['public_id'],
        pname = json['product_name'],
        pimage = json['image'],
        pdescription = json['description'],

        pprice = json['price'];

  Map<String, dynamic> toJson()=>{
    'pid': pid,
    'pname': pname,
    'pimage': pimage,
    'pdescription': pdescription,
    'pprice': pprice,
  };
}
