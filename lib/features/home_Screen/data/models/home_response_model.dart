class HomeResponseModel {
  HomeResponseModel({required this.name});

  final String name;
}

class CategoriesResponseModel {
  CategoriesResponseModel({required this.categories});

  factory CategoriesResponseModel.fromJson(List<dynamic> json) {
    return CategoriesResponseModel(
      categories: List<HomeResponseModel>.from(
        json.map(
          (categoryName) => HomeResponseModel(name: categoryName as String),
        ),
      ),
    );
  }

  final List<HomeResponseModel> categories;
}
