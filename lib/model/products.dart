class ProductModel {
  final String pid;
  final String pname;
  final String pimage;
  final String pprice;
  final String pcategory;
  final String pdescription;


  ProductModel(this.pid,this.pname, this.pimage, this.pprice, this.pdescription, this.pcategory);
  ProductModel.fromJson(Map<String, dynamic> json)
      : pid = json['public_id'],
        pcategory = json['category_name'],
        pname = json['product_name'],
        pimage = json['image'],
        pdescription = json['description'],
        pprice = json['price'];

  Map<String, dynamic> toJson()=>{
    'pid': pid,
    'pname': pname,
    'pcategory': pcategory,
    'pimage': pimage,
    'pdescription': pdescription,
    'pprice': pprice,
  };
}
