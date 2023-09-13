class TokenEntity {
  TokenEntity({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
    this.dateLaunched,
    this.contractAddress,
    this.selfReportedCirculatingSupply,
    this.selfReportedTags,
    this.selfReportedMarketCap,
    this.infiniteSupply,
  });

  int? id;
  String? name;
  String? symbol;
  String? category;
  String? description;
  String? slug;
  String? logo;
  String? subreddit;
  String? notice;
  List<String>? tags;
  List<String>? tagNames;
  List<String>? tagGroups;
  dynamic platform;
  DateTime? dateAdded;
  String? twitterUsername;
  int? isHidden;
  DateTime? dateLaunched;
  List<dynamic>? contractAddress;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedTags;
  dynamic selfReportedMarketCap;
  bool? infiniteSupply;
}
