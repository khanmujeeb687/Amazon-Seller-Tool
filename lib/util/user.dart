class MyFileDataBase{

  String _path;
  int _id;
  MyFileDataBase(this._path);

  //assign incoming map values to the class private variables
  MyFileDataBase.map(dynamic obj)
  {
    this._path=obj["path"];
    this._id=obj["id"];
  }
//get the values .This is used to secure the private variables

  String get path=>_path;
  int get id=>_id;

  //
Map<String,dynamic> toMap()
{
  var map=Map<String,dynamic>();
  map["path"]=_path;
  if(id!=null)
    {
      map["id"]=_id;
    }
  return map;
}
MyFileDataBase.fromMap(Map<String,dynamic> map)
  {

this._path=map["path"];
this._id=map["id"];
  }
}