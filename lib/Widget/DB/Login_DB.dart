// To parse this JSON data, do
//
//     final loginDb = loginDbFromJson(jsonString);

import 'dart:convert';

LoginDb loginDbFromJson(String str) => LoginDb.fromJson(json.decode(str));

String loginDbToJson(LoginDb data) => json.encode(data.toJson());

class LoginDb {
    LoginDb({
        this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.name,
        this.email,
        this.issued,
        this.expires,
    });

    String accessToken;
    String tokenType;
    int expiresIn;
    String name;
    String email;
    String issued;
    String expires;

    factory LoginDb.fromJson(Map<String, dynamic> json) => LoginDb(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        name: json["Name"] == null ? null : json["Name"],
        email: json["Email"] == null ? null : json["Email"],
        issued: json[".issued"] == null ? null : json[".issued"],
        expires: json[".expires"] == null ? null : json[".expires"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "Name": name == null ? null : name,
        "Email": email == null ? null : email,
        ".issued": issued == null ? null : issued,
        ".expires": expires == null ? null : expires,
    };
}
