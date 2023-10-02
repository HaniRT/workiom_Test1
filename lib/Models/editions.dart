class editions {
  String? displayName;
  bool? isRegistrable;
  double? annualPrice;
  bool? hasTrial;
  bool? isMostPopular;
  int? id;

  editions(
      {this.displayName,
        this.isRegistrable,
        this.annualPrice,
        this.hasTrial,
        this.isMostPopular,
        this.id});

  editions.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    isRegistrable = json['isRegistrable'];
    annualPrice = json['annualPrice'];
    hasTrial = json['hasTrial'];
    isMostPopular = json['isMostPopular'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['isRegistrable'] = this.isRegistrable;
    data['annualPrice'] = this.annualPrice;
    data['hasTrial'] = this.hasTrial;
    data['isMostPopular'] = this.isMostPopular;
    data['id'] = this.id;
    return data;
  }
}
