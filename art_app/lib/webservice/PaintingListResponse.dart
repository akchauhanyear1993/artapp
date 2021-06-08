

class PaintingListResponse {
  List<Arts> _arts;

  List<Arts> get arts => _arts;

  PaintingListResponse({
      List<Arts> arts}){
    _arts = arts;
}

  PaintingListResponse.fromJson(dynamic json) {
    if (json["arts"] != null) {
      _arts = [];
      json["arts"].forEach((v) {
        _arts.add(Arts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_arts != null) {
      map["arts"] = _arts.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class Arts {
  String _id;
  Images _image;
  Meta _meta;
  User _user;

  String get id => _id;
  Images get image => _image;
  Meta get meta => _meta;
  User get user => _user;

  Arts({
      String id,
      Images image,
      Meta meta, 
      User user}){
    _id = id;
    _image = image;
    _meta = meta;
    _user = user;
}

  Arts.fromJson(dynamic json) {
    _id = json["id"];
    _image = json["image"] != null ? Images.fromJson(json["image"]) : null;
    _meta = json["meta"] != null ? Meta.fromJson(json["meta"]) : null;
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    if (_image != null) {
      map["image"] = _image.toJson();
    }
    if (_meta != null) {
      map["meta"] = _meta.toJson();
    }
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    return map;
  }

}

/// likes : "420"

class User {
  String _likes;

  String get likes => _likes;
  set likes(String val) => _likes = val;

  User({
      String likes}){
    _likes = likes;
  }

  User.fromJson(dynamic json) {
    _likes = json["likes"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["likes"] = _likes;
    return map;
  }

}

/// title : "Self-Portrait"
/// description : "In 1886 Vincent van Gogh left his native Holland and settled in Paris, where his beloved brother Theo was a dealer in paintings. Van Gogh created at least twenty-four self-portraits during his two-year stay in the energetic French capital. This early example is modest in size and was painted on prepared artist’s board rather than canvas. Its densely dabbed brushwork, which became a hallmark of Van Gogh’s style, reﬂects the artist’s response to Georges Seurat’s revolutionary pointillist technique in A Sunday on La Grande Jatte—1884. But what was for Seurat a method based on the cool objectivity of science became in Van Gogh’s hands an intense emotional language. The surface of the painting dances with particles of color—intense greens, blues, reds, and oranges. Dominating this dazzling array of staccato dots and dashes are the artist’s deep green eyes and the intensity of their gaze. “I prefer painting people’s eyes to cathedrals,” Van Gogh once wrote to Theo. “However solemn and imposing the latter may be—a human soul, be it that of a poor streetwalker, is more interesting to me.” From Paris, Van Gogh traveled to the southern town of Arles for fifteen months. At the time of his death, in 1890, he had actively pursued his art for only five years.\\n\",\n"
/// year : "1887"
/// place : "Netherlands"
/// dimensions : "41 × 32.5 cm (16 1/8 × 12 13/16 in.)"
/// genre : "self_portrait"
/// genreId : "g1"
/// style : "Post_Impressionism"
/// styleId : "s1"
/// artist : "Vincent van Gogh"
/// artist_id : "1"

class Meta {
  String _title;
  String _description;
  String _year;
  String _place;
  String _dimensions;
  String _genre;
  String _genreId;
  String _style;
  String _styleId;
  String _artist;
  String _artistId;

  String get title => _title;
  String get description => _description;
  String get year => _year;
  String get place => _place;
  String get dimensions => _dimensions;
  String get genre => _genre;
  String get genreId => _genreId;
  String get style => _style;
  String get styleId => _styleId;
  String get artist => _artist;
  String get artistId => _artistId;

  Meta({
      String title, 
      String description, 
      String year, 
      String place, 
      String dimensions, 
      String genre, 
      String genreId, 
      String style, 
      String styleId, 
      String artist, 
      String artistId}){
    _title = title;
    _description = description;
    _year = year;
    _place = place;
    _dimensions = dimensions;
    _genre = genre;
    _genreId = genreId;
    _style = style;
    _styleId = styleId;
    _artist = artist;
    _artistId = artistId;
}

  Meta.fromJson(dynamic json) {
    _title = json["title"];
    _description = json["description"];
    _year = json["year"];
    _place = json["place"];
    _dimensions = json["dimensions"];
    _genre = json["genre"];
    _genreId = json["genreId"];
    _style = json["style"];
    _styleId = json["styleId"];
    _artist = json["artist"];
    _artistId = json["artist_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    map["year"] = _year;
    map["place"] = _place;
    map["dimensions"] = _dimensions;
    map["genre"] = _genre;
    map["genreId"] = _genreId;
    map["style"] = _style;
    map["styleId"] = _styleId;
    map["artist"] = _artist;
    map["artist_id"] = _artistId;
    return map;
  }

}

/// i1x : "https://www.artic.edu/iiif/2/26d3cea8-44c0-bfbd-a91a-19a007517152/full/200,/0/default.jpg"
/// i2x : "https://www.artic.edu/iiif/2/26d3cea8-44c0-bfbd-a91a-19a007517152/full/400,/0/default.jpg"
/// i3x : "https://www.artic.edu/iiif/2/26d3cea8-44c0-bfbd-a91a-19a007517152/full/600,/0/default.jpg"
/// i4x : "https://www.artic.edu/iiif/2/26d3cea8-44c0-bfbd-a91a-19a007517152/full/800,/0/default.jpg"

class Images {
  String _i1x;
  String _i2x;
  String _i3x;
  String _i4x;

  String get i1x => _i1x;
  String get i2x => _i2x;
  String get i3x => _i3x;
  String get i4x => _i4x;

  Images({
      String i1x, 
      String i2x, 
      String i3x, 
      String i4x}){
    _i1x = i1x;
    _i2x = i2x;
    _i3x = i3x;
    _i4x = i4x;
}

  Images.fromJson(dynamic json) {
    _i1x = json["i1x"];
    _i2x = json["i2x"];
    _i3x = json["i3x"];
    _i4x = json["i4x"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["i1x"] = _i1x;
    map["i2x"] = _i2x;
    map["i3x"] = _i3x;
    map["i4x"] = _i4x;
    return map;
  }

}