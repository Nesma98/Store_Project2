part of 'bottom_nav_cubit.dart';

@immutable
abstract class BottomNavStates {}

class BottomNavInitialStates extends BottomNavStates {}


class BottomNavChangeStates extends BottomNavStates {}
class StoreLoadingStates extends BottomNavStates {}
class StoreSuccessStates extends BottomNavStates {}
class StoreErrorStates extends BottomNavStates {}


class StoreCategoriesLoadinStates extends BottomNavStates {}
class StoreCategoriesSuccessStates extends BottomNavStates {}
class StoreCategoriesErrorStates extends BottomNavStates {}

