import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/features/shop/models/catagory_model.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/constants/image_string.dart';

class CDummyData {
  //* List of categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: "Sports", image: CIMages.sportsIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: "Furniture",
        image: CIMages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: "Electronics",
        image: CIMages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: "Cloths", image: CIMages.clothsIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: "Animals", image: CIMages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: "Shoes", image: CIMages.shoesIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: "Cosmetics",
        image: CIMages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: "Jewelery",
        image: CIMages.jewelryIcon,
        isFeatured: true),

    //* Subcategories
    CategoryModel(
        id: '8',
        name: "Sports Shoes",
        image: CIMages.sportsIcon,
        isFeatured: false,
        parendId: '1'),
    CategoryModel(
        id: '9',
        name: "Track suits",
        image: CIMages.sportsIcon,
        isFeatured: false,
        parendId: '1'),
    CategoryModel(
        id: '10',
        name: "Sports Equipments",
        image: CIMages.sportsIcon,
        isFeatured: false,
        parendId: '1'),

    //* furniture
    CategoryModel(
        id: '11',
        name: "Bedroom Furniture",
        image: CIMages.furnitureIcon,
        isFeatured: false,
        parendId: '5'),
    CategoryModel(
        id: '12',
        name: "Kitchen Furniture",
        image: CIMages.furnitureIcon,
        isFeatured: false,
        parendId: '5'),
    CategoryModel(
        id: '13',
        name: "Office Furniture",
        image: CIMages.furnitureIcon,
        isFeatured: false,
        parendId: '5'),

    //*electronice
    CategoryModel(
        id: '14',
        name: "Laptop",
        image: CIMages.electronicsIcon,
        isFeatured: false,
        parendId: '2'),
    CategoryModel(
        id: '15',
        name: "Mobile",
        image: CIMages.electronicsIcon,
        isFeatured: false,
        parendId: '2'),

    //* Cloths
    CategoryModel(
        id: '16',
        name: "Shirt",
        image: CIMages.clothsIcon,
        isFeatured: false,
        parendId: '2'),
  ];

  //* Banner
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: CIMages.promoBanner1, targetScreen: CRoutes.brand, active: true),
    BannerModel(imageUrl: CIMages.promoBanner2, targetScreen: CRoutes.brand, active: true),
    BannerModel(imageUrl: CIMages.promoBanner3, targetScreen: CRoutes.brand, active: true),
  ];
}
