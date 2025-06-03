class GetHomeAreaModel {
    GetHomeAreaModel({
        required this.status,
        required this.statusCode,
        required this.code,
        required this.message,
        required this.results,
    });

    final bool? status;
    final int? statusCode;
    final String? code;
    final String? message;
    final Results? results;

    factory GetHomeAreaModel.fromJson(Map<String, dynamic> json){ 
        return GetHomeAreaModel(
            status: json["status"],
            statusCode: json["statusCode"],
            code: json["code"],
            message: json["message"],
            results: json["results"] == null ? null : Results.fromJson(json["results"]),
        );
    }

}

class Results {
    Results({
        required this.slider,
        required this.mobileSlider,
        required this.deals,
        required this.category,
    });

    final List<Slider> slider;
    final List<Slider> mobileSlider;
    final List<Deal> deals;
    final Category? category;

    factory Results.fromJson(Map<String, dynamic> json){ 
        return Results(
            slider: json["slider"] == null ? [] : List<Slider>.from(json["slider"]!.map((x) => Slider.fromJson(x))),
            mobileSlider: json["mobile_slider"] == null ? [] : List<Slider>.from(json["mobile_slider"]!.map((x) => Slider.fromJson(x))),
            deals: json["deals"] == null ? [] : List<Deal>.from(json["deals"]!.map((x) => Deal.fromJson(x))),
            category: json["category"] == null ? null : Category.fromJson(json["category"]),
        );
    }

}

class Category {
    Category({
        required this.categoryDetails,
    });

    final List<CategoryDetail> categoryDetails;

    factory Category.fromJson(Map<String, dynamic> json){ 
        return Category(
            categoryDetails: json["categoryDetails"] == null ? [] : List<CategoryDetail>.from(json["categoryDetails"]!.map((x) => CategoryDetail.fromJson(x))),
        );
    }

}

class CategoryDetail {
    CategoryDetail({
        required this.id,
        required this.storeid,
        required this.parentid,
        required this.name,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.image,
        required this.childcategories,
    });

    final String? id;
    final String? storeid;
    final String? parentid;
    final String? name;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? image;
    final List<CategoryDetail> childcategories;

    factory CategoryDetail.fromJson(Map<String, dynamic> json){ 
        return CategoryDetail(
            id: json["_id"],
            storeid: json["storeid"],
            parentid: json["parentid"],
            name: json["name"],
            status: json["status"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
            image: json["image"],
            childcategories: json["childcategories"] == null ? [] : List<CategoryDetail>.from(json["childcategories"]!.map((x) => CategoryDetail.fromJson(x))),
        );
    }

}

class Deal {
    Deal({
        required this.id,
        required this.title,
        required this.mrp,
        required this.salePrice,
        required this.taxPercentage,
        required this.discount,
        required this.basePrice,
        required this.taxAmount,
        required this.isLock,
        required this.isEcommerce,
        required this.primaryImage,
        required this.categories,
    });

    final String? id;
    final String? title;
    final int? mrp;
    final int? salePrice;
    final int? taxPercentage;
    final int? discount;
    final int? basePrice;
    final int? taxAmount;
    final String? isLock;
    final bool? isEcommerce;
    final String? primaryImage;
    final List<List<CategoryDetail>> categories;

    factory Deal.fromJson(Map<String, dynamic> json){ 
        return Deal(
            id: json["id"],
            title: json["title"],
            mrp: json["mrp"],
            salePrice: json["salePrice"],
            taxPercentage: json["taxPercentage"],
            discount: json["discount"],
            basePrice: json["basePrice"],
            taxAmount: json["taxAmount"],
            isLock: json["isLock"],
            isEcommerce: json["isEcommerce"],
            primaryImage: json["primaryImage"],
            categories: json["categories"] == null ? [] : List<List<CategoryDetail>>.from(json["categories"]!.map((x) => x == null ? [] : List<CategoryDetail>.from(x!.map((x) => CategoryDetail.fromJson(x))))),
        );
    }

}

class Slider {
    Slider({
        required this.title,
        required this.image,
        required this.redirectUrl,
    });

    final String? title;
    final String? image;
    final String? redirectUrl;

    factory Slider.fromJson(Map<String, dynamic> json){ 
        return Slider(
            title: json["title"],
            image: json["image"],
            redirectUrl: json["redirectUrl"],
        );
    }

}
