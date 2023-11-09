part of 'home_cubit.dart';

class HomeViewState extends Equatable {
  final bool filterApplied;
  final List<ProductConfig> productsList;
  final List<CategoryConfig> categories;
  final List<CategoryConfig> filterList;
  final int sliderCardNumber;
  final int filterListNumber;
  final bool isLoading;
  final bool moreButtonClicked;
  final List<CurrencyConfig> currencyList;
  final List<CurrencyConfig> sliderData;

  const HomeViewState({
    this.filterApplied = false,
    this.productsList = const [],
    this.categories = const [],
    this.filterList = const [],
    this.sliderCardNumber = 0,
    this.filterListNumber = 0,
    this.isLoading = true,
    this.moreButtonClicked = false,
    this.currencyList = const [],
    this.sliderData = const [],
  });

  HomeViewState copyWith({
    bool? filterApplied,
    List<ProductConfig>? productsList,
    List<CategoryConfig>? categories,
    List<CategoryConfig>? filterList,
    int? sliderCardNumber,
    int? filterListNumber,
    bool? isLoading,
    bool? moreButtonClicked,
    List<CurrencyConfig>? currencyList,
    List<CurrencyConfig>? sliderData,
  }) {
    return HomeViewState(
      filterApplied: filterApplied ?? this.filterApplied,
      productsList: productsList ?? this.productsList,
      categories: categories ?? this.categories,
      filterList: filterList ?? this.filterList,
      sliderCardNumber: sliderCardNumber ?? this.sliderCardNumber,
      filterListNumber: filterListNumber ?? this.filterListNumber,
      isLoading: isLoading ?? this.isLoading,
      moreButtonClicked: moreButtonClicked ?? this.moreButtonClicked,
      currencyList: currencyList ?? this.currencyList,
      sliderData: sliderData ?? this.sliderData,
    );
  }

  @override
  List<Object?> get props => [
        filterApplied,
        productsList,
        categories,
        filterList,
        sliderCardNumber,
        filterListNumber,
        isLoading,
        moreButtonClicked,
        currencyList,
        sliderData,
      ];
}
