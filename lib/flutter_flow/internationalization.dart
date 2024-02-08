import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'km'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? kmText = '',
  }) =>
      [enText, kmText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '64n86xiy': {
      'en': 'Today\'s Discount',
      'km': 'បញ្ចុះតម្លៃថ្ងៃនេះ',
    },
    'libwi44i': {
      'en': 'Flash Sales',
      'km': 'ទំនិញបញ្ចុះតម្លៃ',
    },
    '42o26hpw': {
      'en': 'View All Products',
      'km': 'មើលផលិតផលទាំងអស់',
    },
    'c8yssqve': {
      'en': 'Categories',
      'km': 'ប្រភេទទំនិញ',
    },
    'k75q28l9': {
      'en': 'Browse By Category',
      'km': 'រកមើលតាមប្រភេទ',
    },
    'cy1cl69r': {
      'en': 'Best Selling Products',
      'km': 'ទំនិញលក់ដាច់បំផុត',
    },
    'vymv7nrq': {
      'en': 'Best Selling Products',
      'km': 'ផលិតផលលក់ដាច់បំផុត',
    },
    'mfcqgfz1': {
      'en': 'Product Feature',
      'km': 'ផលិតផលពិសេសៗ',
    },
    'hajjb89j': {
      'en': 'New Arrival',
      'km': 'ទំនិញមកដល់​ថ្មី',
    },
    'uid058wd': {
      'en': 'View All Products',
      'km': 'មើលផលិតផលទាំងអស់',
    },
    'w8d7zr2z': {
      'en': 'Explore Our Products',
      'km': 'ផលិតផលរបស់យើង',
    },
    '2rnk5dis': {
      'en': 'View All Our Product',
      'km': '',
    },
    '84u1l9z6': {
      'en': 'FAST DELIVERY',
      'km': 'ការដឹកជញ្ជូនដោយឆាប់រហ័ស',
    },
    'x9ebwkg5': {
      'en': '24/7 CUSTOMER SERVICE',
      'km': 'សេវាកម្មអតិថិជន 24/7',
    },
    'nsonlfvx': {
      'en': 'MONEY BACK GUARANTEE',
      'km': 'ធានាសងលុយវិញ',
    },
    'h6pefxvy': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Log_in
  {
    '3xfvk4pz': {
      'en': 'Log In',
      'km': 'ចូលគណនី',
    },
    'mencmheo': {
      'en': 'Let\'s get started by filling out the form below.',
      'km': 'ចូរចាប់ផ្តើមដោយការបំពេញទម្រង់ខាងក្រោម។',
    },
    'lmtifhvp': {
      'en': '+855',
      'km': '+៨៥៥',
    },
    '9mu558yh': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'uikjn24d': {
      'en': 'OTP Code',
      'km': 'លេខកូដ OTP',
    },
    'hfn2nhj5': {
      'en': 'Resend Code',
      'km': 'ផ្ញើលេខកូដឡើងវិញ',
    },
    '0e0ujw0j': {
      'en': 'Google',
      'km': '',
    },
    'ntknrcgm': {
      'en': 'Haven\'t had account? ',
      'km': 'មិនទាន់មានគណនីមែនទេ?',
    },
    'w3chsp6f': {
      'en': 'Sign Up',
      'km': 'ចុះ​ឈ្មោះ',
    },
    'nci3tccv': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Sign_up
  {
    'co8k5t5b': {
      'en': 'Create an Account',
      'km': 'បង្កើត​គណនី',
    },
    'vekh4zhl': {
      'en': 'Let\'s get started by filling out the form below.',
      'km': 'ចូរចាប់ផ្តើមដោយការបំពេញទម្រង់ខាងក្រោម',
    },
    'vh507g6s': {
      'en': 'Enter Your Name Here',
      'km': 'ឈ្មោះរបស់អ្នកនៅទីនេះ',
    },
    '5973rhd7': {
      'en': 'Enter Your Email Here(Optional)',
      'km': '',
    },
    '4d84nzgv': {
      'en': 'Phone',
      'km': 'លេខទូរសព្ទ',
    },
    '8pndq8u3': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    'au1kjqr1': {
      'en': 'Sign Up with Google',
      'km': 'Google',
    },
    'dqxdgbqw': {
      'en': 'OTP Code',
      'km': 'លេខកូដ OTP',
    },
    'w6kvh9tk': {
      'en': 'Resend Code',
      'km': 'ផ្ញើលេខកូដឡើងវិញ',
    },
    'qht21gp9': {
      'en': 'Already Have account? ',
      'km': '',
    },
    'k2cqra3n': {
      'en': 'Log In',
      'km': '',
    },
    'kq30o74b': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Account
  {
    '8gvx5p6k': {
      'en': 'Edit Your Profile',
      'km': 'កែសម្រួលប្រវត្តិរូបរបស់អ្នក។',
    },
    'teucmu7m': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    'wzh20n75': {
      'en': 'Phone Number',
      'km': 'លេខទូរសព្ទ',
    },
    'ilw9vw67': {
      'en': 'Adress',
      'km': 'អាស័យដ្ឋាន',
    },
    'lw3viozi': {
      'en': 'Email',
      'km': 'អ៊ីមែល',
    },
    '8e9r04p3': {
      'en': 'Sign Out',
      'km': 'រក្សាទុកការផ្លាស់ប្តូរ',
    },
    'g2pknlun': {
      'en': 'Save Change',
      'km': '',
    },
    'scpt0g61': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Cart
  {
    'od8imb0p': {
      'en': 'Your Cart',
      'km': '',
    },
    'jj1farhu': {
      'en': 'Below is the list of items in your cart.',
      'km': '',
    },
    'nus25p16': {
      'en': 'Remove',
      'km': 'ដកចេញ',
    },
    'wve0by8c': {
      'en': 'Cart is empty',
      'km': 'រទេះទទេ',
    },
    're1f9ii7': {
      'en': 'Remove All',
      'km': 'លុបចេញទាំងអស់។',
    },
    '31x84tyq': {
      'en': 'Add More Iteam',
      'km': '',
    },
    'oibcjac7': {
      'en': 'Delivery Option For',
      'km': 'ជម្រើសដឹកជញ្ជូន',
    },
    'fahvhc4m': {
      'en': 'User',
      'km': 'អ្នក​ប្រើ',
    },
    'qvpn00zq': {
      'en': 'Express delivery ',
      'km': 'ការដឹកជញ្ជូនលឿន',
    },
    'r01vjxdk': {
      'en': 'Pick Up in place',
      'km': 'យកនៅនឹងកន្លែង',
    },
    'fyljedv3': {
      'en': 'Order Summary',
      'km': 'សេចក្តីសង្ខេបនៃការបញ្ជាទិញ',
    },
    'dmos5l7z': {
      'en': 'Below is a list of your items.',
      'km': 'ខាងក្រោមនេះគឺជាបញ្ជីនៃទំនិញរបស់អ្នក។',
    },
    'a5qxqdc9': {
      'en': 'Price Breakdown',
      'km': 'ការបំបែកតម្លៃ',
    },
    'y9rqzu1i': {
      'en': 'Subtotal',
      'km': 'តម្លៃដើម',
    },
    'ytbg9zla': {
      'en': 'Discount',
      'km': 'បញ្ចុះតម្លៃ',
    },
    'lmu4tn6s': {
      'en': 'Total',
      'km': 'តម្លៃសរុប',
    },
    'nzrnijv6': {
      'en': 'Continue to Checkout',
      'km': 'បន្តទៅការបញ្ជាទិញ',
    },
    'wtbbk8wm': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Checkout
  {
    'ux03kavx': {
      'en': 'Billing Detail',
      'km': 'ព័ត៌មានលម្អិតអំពីការចេញវិក្កយបត្រ',
    },
    '7exscl0j': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    'prjpce88': {
      'en': 'Address',
      'km': 'អាស័យដ្ឋាន',
    },
    'bymo6m5h': {
      'en': 'Town/City',
      'km': 'ទីក្រុង/ក្រុង',
    },
    'kms8mqh4': {
      'en': 'Phnom Penh',
      'km': 'ភ្នំពេញ',
    },
    'wfxrb9e3': {
      'en': 'Battambang',
      'km': 'បាត់ដំបង',
    },
    'bhcwtz5x': {
      'en': 'Please select city',
      'km': 'សូមជ្រើសរើសតំបន់',
    },
    'yhvo6upd': {
      'en': 'Search for a city',
      'km': 'ស្វែងរកទីក្រុង',
    },
    '9feuyv17': {
      'en': 'Phone Number',
      'km': 'លេខទូរស័ព្ទ',
    },
    'o09dkph3': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    'ic8ov23c': {
      'en': 'Address',
      'km': 'អាស័យដ្ឋាន',
    },
    'uql0ixt4': {
      'en': 'Town/City',
      'km': 'ទីក្រុង/ក្រុង',
    },
    'j21o1pda': {
      'en': 'Phnom Penh',
      'km': 'ភ្នំពេញ',
    },
    'zf65ols4': {
      'en': 'Battambang',
      'km': 'បាត់ដំបង',
    },
    'e7g2ijxz': {
      'en': 'Please select city',
      'km': 'សូមជ្រើសរើសទីក្រុង',
    },
    'qy4vaird': {
      'en': 'Search for a city',
      'km': 'ស្វែងរកទីក្រុង',
    },
    'hodwohdj': {
      'en': 'Phone Number',
      'km': 'លេខទូរស័ព្ទ',
    },
    'n3tme922': {
      'en': 'Save this information for faster check-out next time',
      'km': 'រក្សាទុកព័ត៌មាននេះសម្រាប់ការទូទាត់ចេញកាន់តែលឿននៅពេលក្រោយ',
    },
    'acx1c4g7': {
      'en': ' check-out as Guest',
      'km': 'ពិនិត្យចេញជាភ្ញៀវ',
    },
    '3z95pjg4': {
      'en': 'Additional Detail',
      'km': 'ព័ត៌មានលម្អិតបន្ថែម',
    },
    'hwszcnn9': {
      'en': 'Remove',
      'km': 'ដកចេញ',
    },
    'qzta9j10': {
      'en': 'Price Breakdown',
      'km': 'ការបំបែកតម្លៃ',
    },
    '5ebrx26z': {
      'en': 'Subtotal',
      'km': 'តម្លៃដើម',
    },
    'hujefqei': {
      'en': 'Discount',
      'km': 'បញ្ចុះតម្លៃ',
    },
    'u46knt37': {
      'en': 'Delivery Fee',
      'km': 'ថ្លៃដឹកជញ្ជូន',
    },
    '0bkjys6y': {
      'en': 'Total',
      'km': 'តម្លៃសរុប',
    },
    'i9bih6u4': {
      'en': 'Online payment',
      'km': 'ការទូទាត់តាមអ៊ីនធឺណិត',
    },
    'hyj9l3ac': {
      'en': 'Cash On Delivery',
      'km': 'សាច់ប្រាក់លើការដឹកជញ្ជូន',
    },
    '5gehuddh': {
      'en': 'Place order',
      'km': 'ដាក់បញ្ជាការទិញ',
    },
    'vjqr0pcv': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // AdminDashboard
  {
    'wakt36my': {
      'en': 'Dashboard',
      'km': 'ផ្ទាំងគ្រប់គ្រង',
    },
    'c3aspt38': {
      'en': 'Below is a summary of your teams activity.',
      'km': 'ខាងក្រោមនេះគឺជាសេចក្តីសង្ខេបនៃសកម្មភាពក្រុមរបស់អ្នក។',
    },
    '6hhh3cjz': {
      'en': 'Total Revenue',
      'km': 'ប្រាក់ចំណូលសរុប',
    },
    'bfzcuow4': {
      'en': 'Total Order',
      'km': 'ការបញ្ជាទិញសរុប',
    },
    'bubvp8iv': {
      'en': 'New Users',
      'km': 'អ្នកប្រើប្រាស់ថ្មី',
    },
    'ghe73s8i': {
      'en': 'Projects',
      'km': 'គម្រោង',
    },
    '3r186akj': {
      'en': 'MongKul Technology',
      'km': 'MongKul Technology',
    },
    'ewuonojx': {
      'en': 'Contract Activity',
      'km': 'សកម្មភាពកិច្ចសន្យា',
    },
    'l5pk3sxp': {
      'en': 'Below is an a summary of activity.',
      'km': 'ខាងក្រោមនេះជាសេចក្តីសង្ខេបនៃសកម្មភាព។',
    },
    'e56v1emt': {
      'en': 'Customer Activity',
      'km': 'សកម្មភាពអតិថិជន',
    },
    '4n9mq35y': {
      'en': 'Below is an a summary of activity.',
      'km': 'ខាងក្រោមនេះជាសេចក្តីសង្ខេបនៃសកម្មភាព។',
    },
    'pm2ghdvt': {
      'en': 'Contract Activity',
      'km': 'សកម្មភាពកិច្ចសន្យា',
    },
    'xbdwbo0l': {
      'en': 'Below is an a summary of activity.',
      'km': 'ខាងក្រោមនេះជាសេចក្តីសង្ខេបនៃសកម្មភាព។',
    },
    'nkytlodb': {
      'en': 'Customer Activity',
      'km': 'សកម្មភាពអតិថិជន',
    },
    '9kdo8trr': {
      'en': 'Below is an a summary of activity.',
      'km': 'ខាងក្រោមនេះជាសេចក្តីសង្ខេបនៃសកម្មភាព។',
    },
    'e8elyfp2': {
      'en': 'Best Selling Products',
      'km': 'ទំនិញលក់ដាច់បំផុត',
    },
    'vqboroj9': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
    },
    'v7gs80ao': {
      'en': 'Order Quantity',
      'km': 'បរិមាណបញ្ជាទិញ',
    },
    'nyfmkrnc': {
      'en': 'Order ID',
      'km': 'អាយដីបញ្ជាទិញ',
    },
    'v8844lq9': {
      'en': 'Cost',
      'km': 'ការចំណាយ',
    },
    'tf4knc2s': {
      'en': 'Category',
      'km': 'ប្រភេទទំនិញ',
    },
    'gl1ycla7': {
      'en': '__',
      'km': '__',
    },
  },
  // Signin_Admin
  {
    '7apw86ba': {
      'en': 'Admin Log In',
      'km': 'Admin Log In',
    },
    'c3q47jy5': {
      'en': 'Let\'s Fill Your User Name and Password',
      'km': 'Let\'s Fill Your User Name and Password',
    },
    '3slp7f4l': {
      'en': 'User Name',
      'km': 'User Name',
    },
    'efnzc0jn': {
      'en': 'Password',
      'km': 'Password',
    },
    'xho6g04y': {
      'en': 'Forgot Passsword',
      'km': 'Forgot Passsword',
    },
    '0yi443kd': {
      'en': 'Get Started',
      'km': 'Get Started',
    },
    'ly5ob9fr': {
      'en': 'Home',
      'km': 'Home',
    },
  },
  // Customer_List
  {
    'sapw59wb': {
      'en': 'Customer',
      'km': 'អតិថិជន',
    },
    '71i7kcr3': {
      'en': 'Below is a summary of your Customer',
      'km': 'ខាងក្រោមនេះគឺជាសេចក្តីសង្ខេបរបស់អតិថិជនរបស់អ្នក',
    },
    'x1k38wjh': {
      'en': 'Our Users',
      'km': 'អ្នកប្រើប្រាស់របស់យើង',
    },
    'sghslqlu': {
      'en': 'Search Order',
      'km': 'ស្វែងរការទិញ',
    },
    '4akf3bd1': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
    },
    '7t90bq9j': {
      'en': 'Phone Number',
      'km': 'លេខទូរស័ព្ទ',
    },
    '0f4t7vkf': {
      'en': 'adress',
      'km': 'លេខ​សម្គាល់ការទិញ',
    },
    'krkl67lx': {
      'en': 'email',
      'km': 'email',
    },
    'svsr9a6k': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Order_list
  {
    'a4bx1cqu': {
      'en': 'Order',
      'km': 'បញ្ជាទិញ',
    },
    'nnsn949x': {
      'en': 'Below is a summary of your Order',
      'km': 'ខាងក្រោមនេះគឺជាសេចក្តីសង្ខេបនៃការបញ្ជាទិញរបស់អ្នក',
    },
    'agan4usj': {
      'en': 'Order',
      'km': 'បញ្ជាទិញ',
    },
    'v7si5rkk': {
      'en': 'Search Order',
      'km': 'ស្វែងរកការទិញ',
    },
    'vorkeemw': {
      'en': 'Name',
      'km': 'ឈ្មោះ',
    },
    'ecub20b4': {
      'en': 'Delivery',
      'km': 'កាលបរិច្ឆេទ',
    },
    'g1zdc17x': {
      'en': 'Phone Number',
      'km': 'លេខទូរសព្ទ',
    },
    '7bc65oa5': {
      'en': 'Total',
      'km': 'សរុប',
    },
    '6c92iiz6': {
      'en': 'Payment',
      'km': 'ការទូទាត់',
    },
    '0tors2ep': {
      'en': 'Accepted By Store',
      'km': 'ទទួលយកដោយហាង',
    },
    '0zvinhyg': {
      'en': 'Delivered',
      'km': 'ចែកចាយ',
    },
    'gjwlz8hb': {
      'en': 'Pending',
      'km': 'កំពុងរង់ចាំ',
    },
    'i6hb616c': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
    },
    '5w5phceb': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកទំនិញ...',
    },
    'w9el4yak': {
      'en': 'Action',
      'km': 'សកម្មភាព',
    },
    'xz9ir5gs': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // OrderDetail
  {
    'sq4e6uep': {
      'en': 'Update Order',
      'km': 'ធ្វើបច្ចុប្បន្នភាពការបញ្ជាទិញ',
    },
    'twqtnihg': {
      'en': 'Products',
      'km': 'ផលិតផល',
    },
    'qfumuaul': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
    },
    '540gaufa': {
      'en': 'Category',
      'km': 'ប្រភេទ',
    },
    's6q93ilh': {
      'en': 'Amount',
      'km': 'ចំនួនទឹកប្រាក់',
    },
    '7t1v5on7': {
      'en': 'Price',
      'km': 'តម្លៃ',
    },
    '2nq64gou': {
      'en': 'In Stock',
      'km': 'នៅ​ក្នុង​ស្តុក',
    },
    'euj97b4y': {
      'en': 'Save',
      'km': 'រក្សាទុក',
    },
    '8eto70hu': {
      'en': 'Payments',
      'km': 'ការទូទាត់',
    },
    'fmtcrrrn': {
      'en': 'Total',
      'km': 'សរុប',
    },
    '4s4324zb': {
      'en': 'Customer',
      'km': 'អតិថិជន',
    },
    'jer4ntnw': {
      'en': 'Edit',
      'km': 'កែសម្រួល',
    },
    'zjnwidif': {
      'en': 'Name: ',
      'km': 'ឈ្មោះ:',
    },
    'pwylfbai': {
      'en': 'Phone Number: ',
      'km': 'លេខទូរសព្ទ:',
    },
    '3shf01j1': {
      'en': 'Delivery',
      'km': 'ការដឹកជញ្ជូន',
    },
    'wwd4qi5w': {
      'en': 'Edit',
      'km': 'កែសម្រួល',
    },
    'ielckud1': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
    },
    'vrxugpf1': {
      'en': 'Accepted By Store',
      'km': 'ទទួលយកដោយហាង',
    },
    'mfg24erd': {
      'en': 'Delivered',
      'km': 'ចែកចាយ',
    },
    '4ebj6dg0': {
      'en': 'Pending',
      'km': 'កំពុងរង់ចាំ',
    },
    '9d46y376': {
      'en': 'Cancle',
      'km': 'បោះបង់ការទិញ',
    },
    'jtnnt16v': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    'hlw1sdda': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // product_Detail
  {
    'pe63hrz7': {
      'en': 'Add to Cart',
      'km': 'បញ្ចូលទៅក្នុងរទេះ',
    },
    '9085bt5f': {
      'en': 'Remove',
      'km': '',
    },
    'avvbrbpa': {
      'en': 'Related Products',
      'km': 'ផលិតផលស្រដៀងគ្នា',
    },
    'jsfbujlr': {
      'en': 'No Products Available',
      'km': 'គ្មានផលិតផលស្រដៀង',
    },
    'bmb3cz7s': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // new_product
  {
    '1ypw2imd': {
      'en': 'New Products',
      'km': 'ផលិតផល​ថ្មី',
    },
    'wqnlt9dy': {
      'en': 'Submit Product',
      'km': '',
    },
    'pvd9sw37': {
      'en': 'General Information',
      'km': 'ព័ត៌មាន​ទូទៅ',
    },
    '205cvun7': {
      'en': 'Products Name',
      'km': 'ឈ្មោះផលិតផល',
    },
    '0g4lrirw': {
      'en': 'Type the name here....',
      'km': 'វាយឈ្មោះនៅទីនេះ....',
    },
    '55d2u7u5': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    '6qtd5i3d': {
      'en': 'Type the description here....',
      'km': 'វាយ​ការ​ពិពណ៌នា​នៅ​ទីនេះ ....',
    },
    '2rnw8f1l': {
      'en': 'About Item',
      'km': 'អំពីទំនិញ',
    },
    '1wlxrww0': {
      'en': 'Type the About Item here....',
      'km': 'វាយបញ្ចូលអំពីធាតុនៅទីនេះ....',
    },
    '3qjnx5ey': {
      'en': 'Product Images ',
      'km': 'រូបភាពផលិតផល',
    },
    'thwspe8s': {
      'en': 'Preview Images',
      'km': 'មើលរូបភាពជាមុន',
    },
    'nqx7n5yn': {
      'en': 'Drag and drop image here, or click add image',
      'km': 'អូស និងទម្លាក់រូបភាពនៅទីនេះ ឬចុចបន្ថែមរូបភាព',
    },
    'nvxbh35d': {
      'en': 'Other Images',
      'km': 'រូបភាពផ្សេងៗ',
    },
    'lj1usohq': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    'srj5c92z': {
      'en': 'Drag and drop image here, or click add image',
      'km': 'អូស និងទម្លាក់រូបភាពនៅទីនេះ ឬចុចបន្ថែមរូបភាព',
    },
    'm4nd1poi': {
      'en': 'General Information',
      'km': '',
    },
    '0ac7n4n2': {
      'en': 'Base Price',
      'km': '',
    },
    'jkfpy5h3': {
      'en': 'Type the price here....',
      'km': '',
    },
    'c18d2v72': {
      'en': 'Description',
      'km': '',
    },
    'm7emyo2p': {
      'en': 'Statud Type',
      'km': '',
    },
    'v9rd8mh1': {
      'en': 'In stock',
      'km': '',
    },
    'kjepsh8n': {
      'en': 'Out Stock',
      'km': '',
    },
    'mdlea9jo': {
      'en': 'Status Type',
      'km': '',
    },
    'c822453p': {
      'en': 'Search for an item...',
      'km': '',
    },
    'cznq7dyh': {
      'en': 'Discount Precentage (%)',
      'km': '',
    },
    'dleuiii8': {
      'en': 'Type the Discount Percentage here....',
      'km': '',
    },
    '15c0c50u': {
      'en': 'Category',
      'km': '',
    },
    '654e1otm': {
      'en': 'Option 1',
      'km': '',
    },
    '7z9q567u': {
      'en': 'Please select...',
      'km': '',
    },
    'bmomc6s4': {
      'en': 'Search for an item...',
      'km': '',
    },
    't4i6wsmf': {
      'en': 'Add Category',
      'km': '',
    },
    '7crn8kj5': {
      'en': 'Choose Category',
      'km': '',
    },
    'blhnsewn': {
      'en': 'Type Category here....',
      'km': '',
    },
    '6xe2y21s': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // product_list
  {
    'pjzib4pt': {
      'en': 'Products List',
      'km': 'បញ្ជីផលិតផល',
    },
    'iveq1e7p': {
      'en': 'Add Products',
      'km': 'បន្ថែមផលិតផល',
    },
    'to8uwjab': {
      'en': 'Products',
      'km': 'ផលិតផល',
    },
    'b04bfio4': {
      'en': 'Search Order',
      'km': 'ស្វែងរកលំដាប់',
    },
    'ynr2l9vn': {
      'en': 'Product Name',
      'km': 'លេខសម្គាល់ផលិតផល',
    },
    '5i428lzt': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    'mmkcb2xw': {
      'en': 'Category',
      'km': 'ប្រភេទ',
    },
    'gaeliwhq': {
      'en': 'Total',
      'km': 'សរុប',
    },
    'cb7x1whl': {
      'en': 'Discount',
      'km': 'បញ្ចុះតម្លៃ',
    },
    'ksjoy5w6': {
      'en': 'In Stock',
      'km': 'នៅ​ក្នុង​ស្តុក',
    },
    'sinpifmj': {
      'en': 'Out Stock',
      'km': 'អស់ពីស្តុក',
    },
    'ok9ftwj5': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
    },
    'u48gg2e3': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកទំនិញ...',
    },
    'rp5f3n6t': {
      'en': 'Action',
      'km': 'សកម្មភាព',
    },
    'fga7ypvc': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Edit_product
  {
    'mwqkh4xn': {
      'en': 'Edit Products',
      'km': 'កែសម្រួលផលិតផល',
    },
    'qjy3dzb7': {
      'en': 'Save Products',
      'km': 'រក្សាទុកទំនិញ',
    },
    'c6koxsg4': {
      'en': 'General Information',
      'km': 'ព័ត៌មាន​ទូទៅ',
    },
    'owomzgw2': {
      'en': 'Products Name',
      'km': 'ឈ្មោះផលិតផល',
    },
    'taomki8a': {
      'en': 'Type the name here....',
      'km': 'វាយឈ្មោះនៅទីនេះ....',
    },
    'ip35bqsx': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    '7m03mmzf': {
      'en': 'Type the description here....',
      'km': 'វាយបញ្ចូលការពិពណ៌នានៅទីនេះ....',
    },
    'n4nyqtqo': {
      'en': 'About Item',
      'km': 'អំពីធាតុ',
    },
    'ld8zzhog': {
      'en': 'Type the About Item here....',
      'km': 'វាយបញ្ចូលអំពីធាតុនៅទីនេះ....',
    },
    'hly9qn9o': {
      'en': 'Product Images ',
      'km': 'រូបភាពផលិតផល',
    },
    'f3cfcrm9': {
      'en': 'Preview Image',
      'km': 'មើលរូបភាពជាមុន',
    },
    'uanv3e6u': {
      'en': 'Drag and drop image here, or click add image',
      'km': 'អូស និងទម្លាក់រូបភាពនៅទីនេះ ឬចុចបន្ថែមរូបភាព',
    },
    's47tzsmf': {
      'en': 'Images',
      'km': 'រូបភាព',
    },
    'yud8v19z': {
      'en': 'Add image',
      'km': 'បន្ថែមរូបភាព',
    },
    '5jsql14n': {
      'en': 'General Information',
      'km': 'ព័ត៌មាន​ទូទៅ',
    },
    '5zgbeqwz': {
      'en': 'Base Price',
      'km': 'តម្លៃមូលដ្ឋាន',
    },
    '3zh2o7sp': {
      'en': 'Type the price here....',
      'km': 'វាយតំលៃនៅទីនេះ....',
    },
    'gly4425m': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    'n3mhywnf': {
      'en': 'Statud Type',
      'km': 'ប្រភេទស្ថានភាព',
    },
    '3h7ogno2': {
      'en': 'In stock',
      'km': 'នៅ​ក្នុង​ស្តុក',
    },
    'futpqojh': {
      'en': 'Out Stock',
      'km': 'អស់ពីស្តុក',
    },
    'xzmgut2b': {
      'en': 'Status Type',
      'km': 'ប្រភេទស្ថានភាព',
    },
    'zaes822z': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    'xg2n8li7': {
      'en': 'Discount Precentage (%)',
      'km': 'បញ្ចុះតម្លៃមុន (%)',
    },
    'cxoma2hv': {
      'en': 'Type the Discount Percentage here....',
      'km': 'វាយពាក្យ Discount Percent នៅទីនេះ....',
    },
    'x6q8pjow': {
      'en': 'Category',
      'km': 'ប្រភេទ',
    },
    '9wn3e0m9': {
      'en': 'Option 1',
      'km': '',
    },
    'lw75jl1c': {
      'en': 'Please select...',
      'km': '',
    },
    'yt2altbu': {
      'en': 'Search for an item...',
      'km': '',
    },
    'm5x2qgwg': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // my_Order
  {
    'adq70ih0': {
      'en': 'Order',
      'km': 'ទំនិញ',
    },
    '5sykyxl7': {
      'en': 'Search Order',
      'km': 'ស្វែងរកលំដាប់',
    },
    '9cr5wir6': {
      'en': 'Order ID',
      'km': 'លេខ​សម្គាល់​ទំនិញ',
    },
    'vga6aa4n': {
      'en': 'Date',
      'km': 'កាលបរិច្ឆេទ',
    },
    '202mhuvo': {
      'en': 'Adress',
      'km': 'ទីតាំង',
    },
    'l465wwz2': {
      'en': 'Total',
      'km': 'សរុប',
    },
    '2o9vbnec': {
      'en': 'Status',
      'km': 'ការទូទាត់',
    },
    '8frk2i6i': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // productPage
  {
    'bn6s7wf1': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
    '5azw7fy9': {
      'en': 'Contact',
      'km': 'ទំនាក់ទំនង',
    },
    'myf8i6nt': {
      'en': 'About',
      'km': 'អំពី',
    },
    'z2ocozfp': {
      'en': 'Sign Up',
      'km': 'ចុះ​ឈ្មោះ',
    },
    '2r1art8o': {
      'en': 'What are you looking for?',
      'km': 'តើ​អ្នក​កំពុង​រក​អ្វី?',
    },
    'bbaxtjrt': {
      'en': 'Discount',
      'km': 'បញ្ចុះតម្លៃ',
    },
    'xs0pc2ye': {
      'en': ' Discount product',
      'km': 'ផលិតផលបញ្ចុះតម្លៃ',
    },
    '0h422m33': {
      'en': 'No Products Available',
      'km': 'គ្មានផលិតផលដែលអាចប្រើបាន',
    },
    'dnq6728r': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // contact
  {
    '1w8pcn6q': {
      'en': 'Call To Us',
      'km': 'ទំនាក់ទំនងមកយើង',
    },
    '5g7sb2vr': {
      'en': 'We are available 24/7, 7 days a week.',
      'km': 'យើងអាចរកបាន 24/7, 7 ថ្ងៃក្នុងមួយសប្តាហ៍។',
    },
    'r1ilv4ag': {
      'en': 'Phone: +855 010 553 827',
      'km': 'ទូរស័ព្ទ៖ +855 010 553 827',
    },
    '4woov8j3': {
      'en': 'Write To Us',
      'km': 'សរសេរមកយើង',
    },
    '67d2d9q0': {
      'en': 'Fill out our form and we will contact you within 24 hours.',
      'km': 'បំពេញទម្រង់របស់យើង ហើយយើងនឹងទាក់ទងអ្នកក្នុងរយៈពេល 24 ម៉ោង។',
    },
    '1lafq0ck': {
      'en': 'Emails: HQ24@exclusive.com',
      'km': 'អ៊ីមែល៖ HQ24@exclusive.com',
    },
    'g7s1i9si': {
      'en': 'Write Your Detail Below',
      'km': 'សរសេរព័ត៌មានលម្អិតរបស់អ្នកខាងក្រោម',
    },
    'uin92us9': {
      'en': 'Your Name',
      'km': 'ឈ្មោះ​របស់​អ្នក',
    },
    'nt27xcwn': {
      'en': 'Email',
      'km': 'អ៊ីមែល',
    },
    'u1gqg176': {
      'en': 'Phone Number',
      'km': 'លេខទូរសព្ទ',
    },
    'tjsxqojk': {
      'en': 'Your Massage',
      'km': 'សាររបស់អ្នក',
    },
    'klk8ggqe': {
      'en': 'Send Massage',
      'km': 'ផ្ញើសារ',
    },
    '2f856mwh': {
      'en': 'Our location',
      'km': '',
    },
    'qfmyofv8': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // about_us
  {
    'gu9iv10x': {
      'en': 'About Us',
      'km': 'អំពី​ពួក​យើង',
    },
    '0lek6se9': {
      'en': 'MongKul Technology',
      'km': 'MongKul Technology',
    },
    '6051k3ep': {
      'en': 'Our Vision',
      'km': 'ទស្សនវិស័យ​របស់​យើ​ង',
    },
    'wsx3823y': {
      'en': 'Our Approch',
      'km': 'វិធីសាស្រ្តរបស់យើង',
    },
    'di1a8m9s': {
      'en': 'Our Proccess',
      'km': 'ដំណើរការរបស់យើង',
    },
    'non2iwnf': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // signUp_Editio1
  {
    'i4v8xjz0': {
      'en': 'Create an Account',
      'km': 'បង្កើត​គណនី',
    },
    'r3je2xbj': {
      'en': 'Let\'s get started by filling out the form below.',
      'km': 'ចូរចាប់ផ្តើមដោយការបំពេញទម្រង់ខាងក្រោម។',
    },
    'hxjqq90o': {
      'en': 'Inter Your Name Here',
      'km': 'ឈ្មោះរបស់អ្នកនៅទីនេះ',
    },
    '4b94teou': {
      'en': 'Email (Optional)',
      'km': 'អ៊ីមែល (ស្រេចចិត្ត)',
    },
    'gb0t0o8z': {
      'en': 'Adress (Optional)',
      'km': 'អាស័យដ្ឋាន (ស្រេចចិត្ត)',
    },
    'gnub4yzw': {
      'en': 'Phone',
      'km': 'ទូរស័ព្ទ',
    },
    'dunetsva': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    'eezgacsf': {
      'en': 'OTP Code',
      'km': 'លេខកូដ OTP',
    },
    '7zoxznrg': {
      'en': 'Resend Code',
      'km': 'ផ្ញើលេខកូដឡើងវិញ',
    },
    'uafv2g1w': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Advertisment_Banner
  {
    'mhn98c4d': {
      'en': 'Advertisement Banner',
      'km': 'បដាផ្សាយពាណិជ្ជកម្ម',
    },
    'bksbvn8c': {
      'en': 'Product Banner',
      'km': 'បដាផលិតផល',
    },
    'l27w3o6m': {
      'en': 'Drag and drop image here, or click add image',
      'km': 'អូស និងទម្លាក់រូបភាពនៅទីនេះ ឬចុចបន្ថែមរូបភាព',
    },
    'wh1pfs4v': {
      'en': 'Advertisement Information',
      'km': 'ព័ត៌មានផ្សព្វផ្សាយ',
    },
    'mqtljqx8': {
      'en': 'Product',
      'km': 'ផលិតផល',
    },
    'r9wgqqt8': {
      'en': 'Select product',
      'km': 'ជ្រើសរើសផលិតផល',
    },
    '1eyq4bva': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    '6pxnx19i': {
      'en': 'Discount Percentage (%)',
      'km': 'ភាគរយបញ្ចុះតម្លៃ (%)',
    },
    '744maud9': {
      'en': 'Type the Discount Percentage here....',
      'km': 'វាយពាក្យ Discount Percent នៅទីនេះ....',
    },
    '28a33djg': {
      'en': 'Submit Product',
      'km': 'ដាក់ស្នើផលិតផល',
    },
    'i22a3gcw': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // contact_update_info
  {
    'nub3vokg': {
      'en': 'General Information',
      'km': 'ព័ត៌មាន​ទូទៅ',
    },
    'fq50x627': {
      'en': 'Email',
      'km': 'អ៊ីមែល',
    },
    'gf7lgt3a': {
      'en': '',
      'km': '',
    },
    'xjenhxm9': {
      'en': 'Phone number',
      'km': 'លេខទូរសព្ទ',
    },
    'uwd6gr8a': {
      'en': '',
      'km': '',
    },
    'jdq7gr8j': {
      'en': 'Adress',
      'km': 'អាសយដ្ឋាន',
    },
    't62yf9tj': {
      'en': '',
      'km': '',
    },
    'fg0yr901': {
      'en': 'Facebook Link',
      'km': 'តំណភ្ជាប់ហ្វេសប៊ុក',
    },
    'jqicuf1m': {
      'en': '',
      'km': '',
    },
    '1h5tnerd': {
      'en': 'Telegram Link',
      'km': '',
    },
    '7x3wsthg': {
      'en': '',
      'km': '',
    },
    'rhvgbi4h': {
      'en': 'About US',
      'km': 'អំពី​ពួក​យើង',
    },
    '8sq2gcd5': {
      'en': 'Our Vision',
      'km': 'ទស្សនវិស័យ​របស់​យេ​ី​ង',
    },
    'hty7mpga': {
      'en': '',
      'km': '',
    },
    'ywa7a2dd': {
      'en': 'Our Process',
      'km': 'ដំណើរការរបស់យើង។',
    },
    't42yis81': {
      'en': '',
      'km': '',
    },
    't893u643': {
      'en': 'Our Approach',
      'km': 'វិធីសាស្រ្តរបស់យើង។',
    },
    '6qe8mell': {
      'en': '',
      'km': '',
    },
    'hokxi4e4': {
      'en': 'About US Image',
      'km': 'អំពីរូបភាពអាមេរិក',
    },
    'xr6b725l': {
      'en': 'Our Vision',
      'km': 'ទស្សនវិស័យ​របស់​យើ​ង',
    },
    'ecsng6zk': {
      'en': 'Drag and drop image here, or click add image',
      'km': 'អូស និងទម្លាក់រូបភាពនៅទីនេះ ឬចុចបន្ថែមរូបភាព',
    },
    '0fwytgnw': {
      'en': 'Our Process',
      'km': 'ដំណើរការរបស់យើង។',
    },
    '7ov4flwk': {
      'en': 'Drag and drop image here, or click add image',
      'km': 'អូស និងទម្លាក់រូបភាពនៅទីនេះ ឬចុចបន្ថែមរូបភាព',
    },
    'gkf2ltfr': {
      'en': 'Our Approach',
      'km': 'វិធីសាស្រ្តរបស់យើង។',
    },
    'l9tm5zgl': {
      'en': 'Drag and drop image here, or click add image',
      'km': 'អូស និងទម្លាក់រូបភាពនៅទីនេះ ឬចុចបន្ថែមរូបភាព',
    },
    'jakenu73': {
      'en': 'Submit Product',
      'km': 'ដាក់ស្នើផលិតផល',
    },
    '90x2bh1g': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // My_orderDetail
  {
    'fuxii183': {
      'en': 'Your Order',
      'km': 'ការបញ្ជាទិញរបស់អ្នក',
    },
    'j9dq6ia2': {
      'en': 'Products',
      'km': 'ផលិតផល',
    },
    'gq5l4b2l': {
      'en': 'Status',
      'km': 'ស្ថានភាព',
    },
    'ckhxdgus': {
      'en': 'Category',
      'km': 'ប្រភេទ',
    },
    'pg0blhbj': {
      'en': 'Amount',
      'km': 'ចំនួនទឹកប្រាក់',
    },
    'znh7xxlc': {
      'en': 'Price',
      'km': 'តម្លៃ',
    },
    'ephkbi64': {
      'en': 'In Stock',
      'km': 'នៅ​ក្នុង​ស្តុក',
    },
    'i3sbngam': {
      'en': 'Cancle Order',
      'km': 'បោះបង់ការបញ្ជាទិញ',
    },
    'm0kulyqk': {
      'en': 'Payments',
      'km': 'ការទូទាត់',
    },
    'wg8gfita': {
      'en': 'Total',
      'km': 'សរុប',
    },
    'dwaru4g3': {
      'en': 'Customer',
      'km': 'អតិថិជន',
    },
    'xyswva5i': {
      'en': 'Name: ',
      'km': 'ឈ្មោះ៖',
    },
    '02tjk3w7': {
      'en': 'Phone Number: ',
      'km': 'លេខទូរសព្ទ:',
    },
    'si7t0wbu': {
      'en': 'Delivery',
      'km': 'ការដឹកជញ្ជូន',
    },
    'a9xx3p9h': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // edit_user
  {
    'c87mr9og': {
      'en': 'Edit Your Profile',
      'km': 'កែសម្រួលប្រវត្តិរូបរបស់អ្នក។',
    },
    '6hepa8rl': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    'pepmgubk': {
      'en': 'Phone Number',
      'km': 'លេខទូរសព្ទ',
    },
    'nc5ooxo1': {
      'en': 'Adress',
      'km': 'អាស័យដ្ឋាន',
    },
    'kkw1mp7p': {
      'en': 'Email',
      'km': 'Email',
    },
    'uu5heq8i': {
      'en': 'Save Change',
      'km': 'រក្សាទុកការផ្លាស់ប្តូរ',
    },
    'flz5zzu0': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // Advertisement_bannerList
  {
    'fsfoogzf': {
      'en': 'Advertisement Banner',
      'km': '',
    },
    'hcmwo25a': {
      'en': 'Home',
      'km': '',
    },
  },
  // ProductCard
  {
    'qj5hvpq7': {
      'en': '%',
      'km': '',
    },
    '7oy2rv0y': {
      'en': 'Add To Cart',
      'km': 'បញ្ចូលទៅក្នុងរទេះ',
    },
    '756qjeo4': {
      'en': 'Remove',
      'km': 'ដកចេញ',
    },
  },
  // webNav
  {
    '7h42e64y': {
      'en': 'Dashboard',
      'km': 'ផ្ទាំងគ្រប់គ្រង',
    },
    'txhn31cu': {
      'en': 'Products',
      'km': 'ផលិតផល',
    },
    'e3bqboow': {
      'en': 'Customers',
      'km': 'អតិថិជន',
    },
    'yv2rb1f1': {
      'en': 'Order',
      'km': 'បញ្ជាទិញ',
    },
    'iijnlb0j': {
      'en': 'Imformation',
      'km': 'ទម្រង់',
    },
    'tu8v3nq4': {
      'en': 'Advertisement Banner',
      'km': 'បដាផ្សាយពាណិជ្ជកម្ម',
    },
    'n2f4rjc3': {
      'en': 'Banner List',
      'km': '',
    },
  },
  // hearder
  {
    '6ndborg9': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
    'at0alq33': {
      'en': 'Contact',
      'km': 'ទំនាក់ទំនង',
    },
    'kcogv908': {
      'en': 'About',
      'km': 'អំពី',
    },
    'ekvj5c2j': {
      'en': 'Sign Up',
      'km': 'ចុះ​ឈ្មោះ',
    },
    'gjbqubd0': {
      'en': 'What are you looking for?',
      'km': 'តើ​អ្នក​កំពុង​រក​អ្វី?',
    },
  },
  // userAccount
  {
    'ncl3dx2t': {
      'en': 'Manage My Account',
      'km': 'គ្រប់គ្រងគណនីរបស់ខ្ញុំ',
    },
    'qtttxdym': {
      'en': 'My Account',
      'km': 'គណនី​របស់ខ្ញុំ',
    },
    'zg98mdkw': {
      'en': 'My Order',
      'km': 'ការទិញរបស់​ខ្ញុំ',
    },
    'sgnfdnav': {
      'en': 'My Order',
      'km': 'ការទិញរបស់​ខ្ញុំ',
    },
  },
  // footer
  {
    '83quhi7v': {
      'en': 'Support',
      'km': 'គាំទ្រ',
    },
    'd1v3ouk6': {
      'en': 'Account',
      'km': 'គណនី',
    },
    'lb1d85ld': {
      'en': 'My Account',
      'km': 'គណនី​របស់ខ្ញុំ',
    },
    'gei0bxgx': {
      'en': 'Login / Register',
      'km': 'ចូល / ចុះឈ្មោះ',
    },
    '26xu9s4w': {
      'en': 'Cart',
      'km': 'រទេះ',
    },
    '917kreup': {
      'en': 'Quick Link',
      'km': 'តំណភ្ជាប់រហ័ស',
    },
    'b8qs74uh': {
      'en': 'Contact',
      'km': 'ទំនាក់ទំនង',
    },
    'fpa4rpgu': {
      'en': 'About Us',
      'km': 'អំពី​ពួក​យើង',
    },
    '1jxehsmc': {
      'en': 'Mungkul Technology. All Rights Reserved.',
      'km': 'Mungkul Technology រក្សា​រ​សិទ្ធ​គ្រប់យ៉ាង',
    },
  },
  // SignUp_popup
  {
    'l4zc3jed': {
      'en': 'Create an Account',
      'km': 'បង្កើត​គណនី',
    },
    '9fusmlr3': {
      'en': 'Let\'s get started by filling out the form below.',
      'km': 'ចូរចាប់ផ្តើមដោយការបំពេញទម្រង់ខាងក្រោម។',
    },
    'ia2db0v9': {
      'en': 'Inter Your Name Here',
      'km': 'ឈ្មោះរបស់អ្នកនៅទីនេះ',
    },
    'in457g9l': {
      'en': 'Email (Optional)',
      'km': 'អ៊ីមែល (ស្រេចចិត្ត)',
    },
    '3r7kbt0h': {
      'en': 'Adress (Optional)',
      'km': 'អាស័យដ្ឋាន (ស្រេចចិត្ត)',
    },
    'oepnlxln': {
      'en': 'Phone',
      'km': 'ទូរស័ព្ទ',
    },
    '4r2i0sia': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    'sffffehl': {
      'en': 'OTP Code',
      'km': 'លេខកូដ OTP',
    },
    'anbg7fta': {
      'en': 'Resend Code',
      'km': 'ផ្ញើលេខកូដឡើងវិញ',
    },
    '9if0oxn4': {
      'en': 'Dismiss',
      'km': 'Dismiss',
    },
  },
  // product_Category
  {
    '2hdoe2f1': {
      'en': 'Smart House',
      'km': 'ផ្ទះឆ្លាត',
    },
    '7katotfm': {
      'en': 'Spending',
      'km': 'ការចំណាយ',
    },
    'bwk8sxpy': {
      'en': 'Income',
      'km': 'ចំណូល',
    },
  },
  // Successful_placeOrder
  {
    'ewji1iih': {
      'en': 'Place Order has been Successful',
      'km': 'ការបញ្ជាទិញទីកន្លែងបានជោគជ័យ',
    },
    'mklrt5s3': {
      'en': 'Thank fot trusting our website and products.',
      'km': 'អរគុណសម្រាប់ការជឿជាក់លើគេហទំព័រ និងផលិតផលរបស់យើង',
    },
    '09wwyjln': {
      'en': 'Go to Home Page',
      'km': 'ចូលទៅកាន់ទំព័រដើម',
    },
  },
  // Miscellaneous
  {
    'vuzvfxrq': {
      'en': '',
      'km': '',
    },
    '3h8k8p58': {
      'en': '',
      'km': '',
    },
    'd9w9wueu': {
      'en': '',
      'km': '',
    },
    '8onv46f2': {
      'en': '',
      'km': '',
    },
    'lkobds6l': {
      'en': '',
      'km': '',
    },
    'xpe0x261': {
      'en': '',
      'km': '',
    },
    'vntlb7bx': {
      'en': '',
      'km': '',
    },
    'l7yerzy4': {
      'en': '',
      'km': '',
    },
    'oseb60md': {
      'en': '',
      'km': '',
    },
    'lx9shu0x': {
      'en': '',
      'km': '',
    },
    'z3p9q0qz': {
      'en': '',
      'km': '',
    },
    'a2yght21': {
      'en': '',
      'km': '',
    },
    'zdlx1ocg': {
      'en': '',
      'km': '',
    },
    'm10hkwbp': {
      'en': '',
      'km': '',
    },
    'zoyzhaik': {
      'en': '',
      'km': '',
    },
    '4jqelru9': {
      'en': '',
      'km': '',
    },
    'dgx8mzfb': {
      'en': '',
      'km': '',
    },
    'kgk0xcps': {
      'en': '',
      'km': '',
    },
    'zo2679dc': {
      'en': '',
      'km': '',
    },
    '3i3nef3j': {
      'en': '',
      'km': '',
    },
    'u5dc1ily': {
      'en': '',
      'km': '',
    },
    '74mihjz7': {
      'en': '',
      'km': '',
    },
    'bmrnpjqm': {
      'en': '',
      'km': '',
    },
    'z2r5v1x1': {
      'en': '',
      'km': '',
    },
    'nvl4l0r9': {
      'en': '',
      'km': '',
    },
    'hxjgzzm4': {
      'en': '',
      'km': '',
    },
  },
].reduce((a, b) => a..addAll(b));
