// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/exception/api_failure.dart';
import 'package:s_booking_public/app/data/models/category.dart';
import 'package:s_booking_public/app/data/models/location_model.dart';
import 'package:s_booking_public/app/services/home_service.dart';

class HomeController extends GetxController {
  final _isLoadingServices = false.obs;
  bool get isLoadingServices => _isLoadingServices.value;

  RxList<Service> _services = <Service>[].obs;
  List<Service> get services => _services.value;

  final _isLoadingCategories = false.obs;
  bool get isLoadingCategories => _isLoadingCategories.value;

  RxList<Category> _categories = <Category>[].obs;
  List<Category> get categories => _categories.value;

  final _isLoadingLocations = false.obs;
  bool get isLoadingLocations => _isLoadingLocations.value;

  RxList<Location> _locations = <Location>[].obs;
  List<Location> get locations => _locations.value;

  final Rx<Location> _selectedLocation = Location().obs;
  Location get selectedLocation => _selectedLocation.value;
  set selectedLocation(Location value) => _selectedLocation(value);

  @override
  Future<void> onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
    // load multi futures in parallel
    Future.wait([
      getAllLocations(),
      getAllServices(),
      getAllCategories(),
    ]);
  }

  Future<void> getAllLocations() async {
    _isLoadingLocations(true);
    final Either<List<Location>, Failure> result =
        await HomeServices.getAllLocations();
    _isLoadingLocations(false);
    result.fold((List<Location> l) {
      _locations.value = l;
      selectedLocation = l.first;
    }, (r) => log('Cannot login: ${r.message}'));
  }

  Future<void> getAllCategories() async {
    _isLoadingCategories(true);
    final Either<List<Category>, Failure> result =
        await HomeServices.getAllCategories();
    _isLoadingCategories(false);
    result.fold((List<Category> l) {
      _categories.value = l;
      log('categories list length: ${l.length}');
    }, (r) => log('Cannot login: ${r.message}'));
  }

  Future<void> getAllServices() async {
    final request = <String, dynamic>{
      "code": selectedLocation.code,
    };
    _isLoadingServices(true);
    final Either<List<Service>, Failure> result =
        await HomeServices.getAllServices(request);
    _isLoadingServices(false);
    result.fold((List<Service> l) {
      _services.value = l;
      log('services list length: ${l.length}');
    }, (r) => log('Cannot login: ${r.message}'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
