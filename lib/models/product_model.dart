
class ProductModel {
  final String productId;
  final String productName;
  final String productImage;
  final String productDescription;
  final double productPrice;  
  final int productOffer; // ==> 1 this product have offer otherwise 0
  final double prodOfferPercentage;
  final String productNote;
  final int productCategory;

  ProductModel({
    this.productId,
    this.productName,
    this.productImage,
    this.productDescription,
    this.productPrice,
    this.productOffer,
    this.prodOfferPercentage,
    this.productNote,
    this.productCategory,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      productId: json['prod_id'],
      productName: json['prod_name'],
      productImage: json['prod_image'],
      productDescription: json['prod_description'],
      productPrice: double.tryParse( json['prod_price']),
      productOffer: int.tryParse(json['prod_offer']),
      prodOfferPercentage: double.tryParse( json['prod_offer_percentage']),
      productNote: json['prod_note'],
      productCategory: int.tryParse( json['prod_category']),
    );
  }





}
