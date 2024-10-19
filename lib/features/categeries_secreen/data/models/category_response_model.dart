class CategoryResponseModel {
  CategoryResponseModel({required this.name});

  final String name;
}

class CategoriesResponseModel {
  CategoriesResponseModel({required this.categories});

  factory CategoriesResponseModel.fromJson(List<dynamic> json) {
    return CategoriesResponseModel(
      categories: List<CategoryResponseModel>.from(
        json.map(
          (categoryName) => CategoryResponseModel(name: categoryName as String),
        ),
      ),
    );
  }

  final List<CategoryResponseModel> categories;
}
