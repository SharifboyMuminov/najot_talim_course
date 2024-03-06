import 'package:default_project/data/models/categoriy/categoriy_modul.dart';
import 'package:default_project/data/models/coffe_modul/coffe_modul.dart';

List<CagetegoriyModul> categpriyes = [
  CagetegoriyModul(id: 1, name: "Mocha"),
  CagetegoriyModul(id: 2, name: "Latte"),
  CagetegoriyModul(id: 3, name: "Cappucino"),
  CagetegoriyModul(id: 4, name: "Espresso"),
];

List<CoffeModul> coffeFavorite = [];

List<CoffeModul> coffeCappuchchino = [
  CoffeModul(
    imageUr:
        "https://static.onecms.io/wp-content/uploads/sites/19/2009/12/21/chocolate-cappucino-ck-x.jpg",
    count: 0,
    cagetegoriyModul: categpriyes[2],
    descreption: "asdfasdf",
    name: "Cappucino",
    price: 20000,
    sizeDish: "S",
    subTitle: "With Chocolate",
  ),
  CoffeModul(
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "asdf",
      name: "Cappucino",
      price: 25000,
      sizeDish: "M",
      subTitle: "With Oat Milk",
      imageUr:
          'https://4tololo.ru/sites/default/files/images/20160311134552.jpg'),
  CoffeModul(
      imageUr:
          "https://dyvn6jpt1f0d3.cloudfront.net/wp-content/uploads/2019/05/07111756/recipe-creamy-chocolate-coffee-1000x1000.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "",
      name: "Cappucino",
      price: 30000,
      sizeDish: "S",
      subTitle: "With Chocolate"),
  CoffeModul(
      imageUr:
          "https://perfectdailygrind.com/wp-content/uploads/2017/09/anchorheadcoffee_18_9_2017_10_59_54_598-1-e1505774955739.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "asdf",
      name: "Cappucino",
      price: 35000,
      sizeDish: "L",
      subTitle: "With Oat Milk"),
];

List<CoffeModul> coffeMocha = [
  CoffeModul(
    imageUr:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeO7gIlorGa2-QoOAVDbRISdEPAbE-2LZqeg&usqp=CAU",
    count: 0,
    cagetegoriyModul: categpriyes[0],
    descreption: "",
    name: "Mocha",
    price: 18000,
    sizeDish: "M",
    subTitle: "With Chocolate",
  ),
  CoffeModul(
      imageUr:
          "https://www.shutterstock.com/image-photo/cups-coffee-drink-latte-mocha-600nw-2271808651.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[0],
      descreption: "sdfasdf",
      name: "Mocha",
      price: 22000,
      sizeDish: "S",
      subTitle: "With Oat Milk"),
  CoffeModul(
      imageUr:
          "https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/exps22961_RDSM1338224D75_RMS2.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[0],
      descreption: "descreption",
      name: "Mocha",
      price: 16000,
      sizeDish: "L",
      subTitle: "With Chocolate"),
  CoffeModul(
      imageUr:
          "https://static.toiimg.com/thumb/57289996.cms?imgsize=299118&width=800&height=800",
      count: 0,
      cagetegoriyModul: categpriyes[0],
      descreption: "descreptionasdf",
      name: "Mocha",
      price: 50000,
      sizeDish: "L",
      subTitle: "With Oat Milk"),
];

List<CoffeModul> coffeLatte = [
  CoffeModul(
      imageUr: "https://www.pjscoffee.com/uploads/white-chocolate-latte.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "sdfad",
      name: "Latte",
      price: 33000,
      sizeDish: "S",
      subTitle: "With Chocolate"),
  CoffeModul(
      imageUr:
          "https://i.pinimg.com/originals/11/f5/25/11f525e9b9ceda0201293dfceb7dc3ff.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "dfsdf",
      name: 'Latte',
      price: 30000,
      sizeDish: "M",
      subTitle: "With Chocolate"),
  CoffeModul(
      imageUr: "https://ae01.alicdn.com/kf/HTB1s0BlcBiE3KVjSZFMq6zQhVXaw.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "dfdfdf",
      name: "Latte",
      price: 38000,
      sizeDish: "L",
      subTitle: "With Milk"),
  CoffeModul(
      imageUr:
          "https://i.pinimg.com/originals/35/07/b8/3507b8a0ca83c086f1ceffc2a38bf540.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "aaaa",
      name: "Latte",
      price: 40000,
      sizeDish: "M",
      subTitle: "With Milk"),
];

List<CoffeModul> coffeEspresso = [
  CoffeModul(
      imageUr:
          "https://omtea.ru/wp-content/uploads/2/c/c/2ccdb0b001c2605d1b77f0bb861e2401.jpeg",
      count: 0,
      cagetegoriyModul: categpriyes[3],
      descreption: "dffsdf",
      name: "Espresso",
      price: 12000,
      sizeDish: "S",
      subTitle: "With Milk"),
  CoffeModul(
      imageUr:
          "https://zakipyati.ru/wp-content/uploads/2023/07/1da832a9714ab53e6d59fdea51623536.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "dfsd",
      name: "Espresso",
      price: 25000,
      sizeDish: "M",
      subTitle: "With Milk"),
  CoffeModul(
      imageUr:
          "https://gurman-bel.ru/assets/uploads/2015/10/polza-i-vred-kofe-s-molokom.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "MAzgi",
      name: "Espresso",
      price: 55000,
      sizeDish: "L",
      subTitle: "With Chocolate"),
  CoffeModul(
      imageUr:
          "https://i.pinimg.com/originals/53/ff/ff/53ffff6eed531dc8b4b50a384e0bd1b2.jpg",
      count: 0,
      cagetegoriyModul: categpriyes[2],
      descreption: "Vashw mazza",
      name: "Espresso",
      price: 58000,
      sizeDish: "L",
      subTitle: "With Chocolate"),
];

List<String> homeScreenTitleButtons = [
  "All",
  "Mocha",
  "Latte",
  "Cappucino",
  "Espresso",
];
