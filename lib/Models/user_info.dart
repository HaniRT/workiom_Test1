class User {
  String? tenancyName;
  String? name;
  String? adminEmailAddress;
  String? adminFirstName;
  String? adminLastName;
  String? adminPassword;
  String? captchaResponse;
  int? editionId;
  int? templateCategoryId;
  int? siloId;
  String? couponCode;
  String? loginProvider;
  String? providerKey;

  User(
      {this.tenancyName,
        this.name,
        this.adminEmailAddress,
        this.adminFirstName,
        this.adminLastName,
        this.adminPassword,
        this.captchaResponse,
        this.editionId,
        this.templateCategoryId,
        this.siloId,
        this.couponCode,
        this.loginProvider,
        this.providerKey});

  User.fromJson(Map<String, dynamic> json) {
    tenancyName = json['tenancyName'];
    name = json['name'];
    adminEmailAddress = json['adminEmailAddress'];
    adminFirstName = json['adminFirstName'];
    adminLastName = json['adminLastName'];
    adminPassword = json['adminPassword'];
    captchaResponse = json['captchaResponse'];
    editionId = json['editionId'];
    templateCategoryId = json['templateCategoryId'];
    siloId = json['siloId'];
    couponCode = json['couponCode'];
    loginProvider = json['loginProvider'];
    providerKey = json['providerKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tenancyName'] = this.tenancyName;
    data['name'] = this.name;
    data['adminEmailAddress'] = this.adminEmailAddress;
    data['adminFirstName'] = this.adminFirstName;
    data['adminLastName'] = this.adminLastName;
    data['adminPassword'] = this.adminPassword;
    data['captchaResponse'] = this.captchaResponse;
    data['editionId'] = this.editionId;
    data['templateCategoryId'] = this.templateCategoryId;
    data['siloId'] = this.siloId;
    data['couponCode'] = this.couponCode;
    data['loginProvider'] = this.loginProvider;
    data['providerKey'] = this.providerKey;
    return data;
  }
}