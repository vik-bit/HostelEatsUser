class Seller
{
  String? sellerUid;
  String? sellerName;
  String? sellerAvatarUrl;
  String? sellerEmail;
  String? phone;
  String? upi;

  Seller({
    this.sellerUid,
    this.sellerName,
    this.sellerAvatarUrl,
    this.sellerEmail,
    this.phone,
    this.upi
  });

  Seller.fromJson(Map<String, dynamic> json)
  {
    sellerUid = json["sellerUID"];
    sellerName = json["sellerName"];
    sellerAvatarUrl = json["sellerAvatarUrl"];
    sellerEmail = json["sellerEmail"];
    phone = json["phone"];
    upi = json["upiid"];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["sellerUID"] = this.sellerUid;
    data["sellerName"] = this.sellerName;
    data["sellerAvatarUrl"] = this.sellerAvatarUrl;
    data["sellerEmail"] = this.sellerEmail;
    data["phone"] = this.phone;
    data["upiid"] = this.upi;
    return data;
  }

}