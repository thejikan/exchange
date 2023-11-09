import 'package:exchange/features/api/detailsRepository.dart';
import 'package:exchange/features/model/detailsModel.dart';
import 'package:exchange/features/model/productConfig.dart';
import 'package:exchange/icons/icons_enum.dart';
import 'package:rxdart/subjects.dart';

class DetailsService {
  IDetailsRepository repository;

  late DetailsModel _detailsModel;
  late BehaviorSubject<DetailsModel> detailsController;

  DetailsService({required this.repository, DetailsModel? detailsModel}) {
    _detailsModel = detailsModel ?? DetailsModel.empty();
  }

  Future<List<ProductConfig>> getAllProductsDetails() async {
    try {
      List<ProductConfig> data = await repository.getAllProducts();

      if (data.isNotEmpty) {
        _detailsModel.productsData = data;
      }

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductConfig> getProductById(int productId) async {
    try {
      ProductConfig data = await repository.getProductById(productId);

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductConfig>> getProductsWithinLimit() async {
    try {
      List<ProductConfig> data = await repository.getProductsWithLimit(
          _detailsModel.noOfProducts, _detailsModel.paginationLimit);

      if (data.isNotEmpty) {
        for (var product in data) {
          _detailsModel.productsData.add(product);
        }

        _detailsModel.noOfProducts += _detailsModel.paginationLimit;
      }

      return _detailsModel.productsData;
    } catch (e) {
      return [];
      // rethrow;
    }
  }

  Future<List<CategoryConfig>> getAllCategories() async {
    try {
      List<CategoryConfig> data = await repository.getAllCategories();

      if (data.isNotEmpty) {
        _detailsModel.allCategories = data;
      }

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductConfig>> filterProductsList(
      Map<String, String> filter, bool filterCheck) async {
    List<ProductConfig> data = [];
    try {
      String filterString = '', res;
      if (filter['categoryId'] != '0') {
        Iterable<MapEntry<String, String>> entries = filter.entries;
        for (final entry in entries) {
          res = '${entry.key}=${entry.value}';
          filterString += '$res&';
        }
      }
      if (filterString.isEmpty) {
        data = await repository.getProductsWithLimit(
            _detailsModel.noOfProducts, _detailsModel.paginationLimit);
      } else {
        filterString +=
            'offset=${_detailsModel.noOfProducts}&limit=${_detailsModel.paginationLimit}';
        data = await repository.filterProductsList(filterString);
      }

      if (filterCheck) {
        for (var product in data) {
          _detailsModel.productsData.add(product);
        }
      } else {
        _detailsModel.productsData = data;
      }

      _detailsModel.noOfProducts += _detailsModel.paginationLimit;

      return _detailsModel.productsData;
    } catch (e) {
      rethrow;
    }
  }

  void setOffset(int offset) {
    _detailsModel.noOfProducts = offset;
  }

  void setLimit(int limit) {
    _detailsModel.paginationLimit = limit;
  }

  Future<List<CurrencyConfig>> getCurrencyList() async {
    try {
      // List<ProductConfig> data = await repository.getProductsWithLimit(
      //     _detailsModel.noOfProducts, _detailsModel.paginationLimit);

      // if (data.isNotEmpty) {
      //   for (var product in data) {
      //     _detailsModel.productsData.add(product);
      //   }
      //
      //   _detailsModel.noOfProducts += _detailsModel.paginationLimit;
      // }
      List<CurrencyConfig> data = [
        CurrencyConfig(name: "Ethereum", nameId: "ETH", image: IconsEnum.ethereum, amount: 3800, percentage: 3.2, isDrop: true),
        CurrencyConfig(name: "Binance Coin", nameId: "BNB", image: IconsEnum.binanceCoin, amount: 450, percentage: 1.8, isDrop: false),
        CurrencyConfig(name: "Cardano", nameId: "ADA", image: IconsEnum.cardano, amount: 450, percentage: 2.7, isDrop: true),
        CurrencyConfig(name: "Ripple", nameId: "XRP", image: IconsEnum.ripple, amount: 1.20, percentage: 1.5, isDrop: false),
        CurrencyConfig(name: "Solana", nameId: "SOL", image: IconsEnum.solana, amount: 155, percentage: 4.1, isDrop: true),
        CurrencyConfig(name: "Ethereum", nameId: "ETH", image: IconsEnum.ethereum, amount: 3800, percentage: 3.2, isDrop: true),
        CurrencyConfig(name: "Binance Coin", nameId: "BNB", image: IconsEnum.binanceCoin, amount: 450, percentage: 1.8, isDrop: false),
        CurrencyConfig(name: "Cardano", nameId: "ADA", image: IconsEnum.cardano, amount: 450, percentage: 2.7, isDrop: true),
        CurrencyConfig(name: "Ripple", nameId: "XRP", image: IconsEnum.ripple, amount: 1.20, percentage: 1.5, isDrop: false),
        CurrencyConfig(name: "Solana", nameId: "SOL", image: IconsEnum.solana, amount: 155, percentage: 4.1, isDrop: true),
      ];

      return data;
    } catch (e) {
      return [];
      // rethrow;
    }
  }

  List<CurrencyConfig> getSliderCurrencyList() {
    try {
      List<CurrencyConfig> data = [
        CurrencyConfig(name: "Bitcoin", nameId: "BTC", image: IconsEnum.bitcoin, amount: 55000, percentage: 2.5, isDrop: false),
      ];

      return data;
    } catch (e) {
      return [];
      // rethrow;
    }
  }

}
