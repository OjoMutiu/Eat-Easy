class AppTag {
  final String tagText;
  //final bool removeTag;

  AppTag({required this.tagText});

  addTag(String appTag, List<dynamic> tagList) {
    tagList.add(AppTag(tagText: appTag));
  }

  removeTag(AppTag appTag, List<dynamic> tagList) {
    tagList.remove(appTag);
  }

  getTagText(AppTag appTag) {
    return appTag.tagText;
  }
}

//Demo Tag List
///Popular Tag List
List<String> popularSearchTags = [
  'Duo Table',
  'Noodle',
  'Chicken',
  'Date',
  'Fried rice',
  'Meat',
  'Family'
];

///Food tag list
List<AppTag> foodTagList = [];

///Table tag list
List<AppTag> tableTagList = [];
