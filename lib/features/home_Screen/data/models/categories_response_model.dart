class CategoryResponseModel {
  CategoryResponseModel({required this.name});

  final String name;
}

class CategoriesResponseModel {
  CategoriesResponseModel({required this.categories});

  factory CategoriesResponseModel.fromJson(List<String> json) {
    return CategoriesResponseModel(
      categories: List<CategoryResponseModel>.from(
        json.map(
          (categoryName) => CategoryResponseModel(name: categoryName),
        ),
      ),
    );
  }

  final List<CategoryResponseModel> categories;
}
