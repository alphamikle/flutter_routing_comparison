import 'dart:core';

class CommonImagesGenerator {
  factory CommonImagesGenerator() {
    return _instance ??= CommonImagesGenerator._();
  }

  CommonImagesGenerator._();

  static CommonImagesGenerator? _instance;

  final Set<String> _usedImages = {};
  final Map<int, String> _imagesSets = {};

  final List<String> _images = [
    '13698217-8cbf-4ae3-aefd-d98f0a8ed7d4',
    'e28a5217-27fd-4061-a5c4-405dcc348db7',
    '9921df8a-a99b-4d6d-ae80-c3c7459dec2f',
    '3cc6dbd5-d12a-4c92-b959-0751f7ba10df',
    'fef0a598-fa99-43b6-bcd4-9101893b19a1',
    'ee006cb3-9703-49c5-b02f-d9c9f081a873',
    '246d6df1-19bf-4b5b-b763-70e6df2c3cdb',
    '97f42323-1c56-46e4-a548-8a4ea45289b1',
    '151d5896-1ba4-4b16-8a37-b8f78782d1d9',
    '3710a215-aa74-4c15-a78e-22e18b0e213b',
    'fe4b1707-1330-48e8-8704-0b5024834624',
    '1cfe62d1-f139-41d6-9331-75eed842c697',
    'e7bcc5c5-1827-4cd4-8d5d-78720c9ba4fd',
    'e1c468e2-eb15-4661-8db3-0a86dcf61256',
    'f02d68e1-47c2-4851-84ca-8be51e127f01',
    '92122ca3-c405-4fab-b94c-67a34a269f6e',
    '81d064a5-c46b-4f2f-98ea-64f2b606f131',
    'e6dfa001-f1f6-49af-a3e1-4c09ff577376',
    '6c0c3986-b416-4c50-b07e-1448cbc525df',
    'faf45e4b-715f-42fb-9917-120830aaa03b',
    '1e28b64f-f59d-4e5c-8df1-d7341f36141d',
    '06d34903-2605-46b4-b695-89dd515b35f4',
    '9df31c8b-0b74-419a-9e70-905976fb4e85',
    '93cf44cc-e71a-48f3-9b5f-c384b3ff5177',
    'ab599202-269e-4973-b7cf-94f280f86175',
    'efaee084-2588-47ce-8c80-94ad85b05631',
    '53f4b628-4b59-46f7-a289-a2379189e7fb',
    '7f977352-da08-4d56-8b6f-4781d80f305a',
    '451fe21d-2232-4c5c-8b01-b1b8562dc0af',
    '4e13be20-267f-49f3-8785-52cf830686c9',
    '8aecef7b-cd6a-47de-ac7b-f9101266be45',
    'da00a393-8c4c-4a06-adf2-257e4e997ad3',
    'bcd78a3a-9547-4474-9d64-fba206ec11e0',
    '6976e8dd-d574-4d36-8f9d-650d4c67d101',
    'cfd35641-7747-4b7d-8d09-31b478cba86c',
    '1dd40667-ed02-49cf-9f0a-ff544f844c25',
    '981889d8-d081-48ba-b152-4c1687105339',
    '9734032c-ac81-4782-a09e-6a321eded908',
    '311043a5-f2dc-481a-b7e1-710eabfc9acb',
    '4b966a1d-d9be-4819-8e69-c1d35af2bdc2',
    '9a77b1bc-e079-4bcb-b7e9-901170855da8',
    'fa6e6846-eb92-433e-b5ad-424c99b85def',
    '2f87c6e2-4453-487d-a390-42514bcaa535',
    '11d91ffe-4bee-4246-a232-a2727551dc46',
    'de84766c-7551-4ce6-be23-f36698d3fcb2',
    '5af55c40-b4bd-4f20-93de-01f15561f9e4',
  ];

  final Map<String, String> _modifiedToOriginal = {
    '9a77b1bc-e079-4bcb-b7e9-901170855da8': 'c41cbfee-8294-4974-8e25-b56dc78e2958',
    'fa6e6846-eb92-433e-b5ad-424c99b85def': '213dcfb5-80ab-4a21-a8bc-7f2481680dab',
    '2f87c6e2-4453-487d-a390-42514bcaa535': '0def4e61-46bd-4617-bf44-f72e868c68e8',
    '11d91ffe-4bee-4246-a232-a2727551dc46': '950d1492-2ee2-42ce-bcfa-6abee5473fb5',
    'de84766c-7551-4ce6-be23-f36698d3fcb2': '714a4bea-714c-4e06-b6f9-6ec90832b07a',
    '5af55c40-b4bd-4f20-93de-01f15561f9e4': 'f5051862-93df-44f8-918b-b9750b19523f',
  };

  int get realImagesCount => _modifiedToOriginal.length;

  String getRandomImageSet(int setNumber) {
    if (_imagesSets.containsKey(setNumber)) {
      return _imagesSets[setNumber]!;
    }
    final List<String> allImages = [..._images];
    String? result;
    allImages.shuffle();
    for (final String image in allImages) {
      if (!_usedImages.contains(image)) {
        _usedImages.add(image);
        result = image;
        break;
      }
    }
    if (result == null) {
      _usedImages.clear();
      _imagesSets.clear();
      return getRandomImageSet(setNumber);
    }
    final String path = _idToPath(result);
    _imagesSets[setNumber] = path;
    return path;
  }

  bool isRealImage(String imagePath) => getOriginalByModified(imagePath) != null;

  String? getOriginalByModified(String imagePath) {
    final RegExp imageIdRegExp = RegExp(r'^.*(?<id>[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}).*$');
    final RegExpMatch? match = imageIdRegExp.firstMatch(imagePath);
    if (match == null) {
      return null;
    }
    final String? originalImageId = _modifiedToOriginal[match.namedGroup('id')];
    if (originalImageId == null) {
      return null;
    }
    return _idToPath(originalImageId);
  }

  String _idToPath(String imageId) {
    return 'assets/images/$imageId.jpg';
  }
}
