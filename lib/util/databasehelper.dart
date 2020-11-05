import 'dart:io';
import 'package:juna/util/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class databasehelper
{
  final tablename="filesdata";
  final idcolumn="id";
  final path="path";

  static final databasehelper _instance=new databasehelper.internal();

  factory databasehelper()=>_instance;

  databasehelper.internal();

static  Database _db;

  Future<Database> get db async{
    if(_db!=null)
      {
        return _db;
      }
    _db=await initdb();
    return db;
  }
//create database if not exists
  initdb() async{
Directory directory=await getApplicationDocumentsDirectory();
String path=join(directory.path,"maindb.db");
var ourdb=await openDatabase(path,version: 1,onCreate: _onCreate);
return ourdb;
  }

  void _onCreate(Database db,int newVersion) async{
    var sql="CREATE TABLE $tablename($idcolumn INTEGER PRIMARY KEY,$path TEXT)";

    db.execute(sql);
  }
  //insert a new user
  Future<int> insertuser(MyFileDataBase myFileDataBase)
async {
    var databse=await db;
    var res=databse.insert(tablename, myFileDataBase.toMap());
    return res;

  }

  //get all the users
Future<List> AllUsers() async{
    Database dbclient=await db;
    var result=await dbclient.rawQuery("SELECT *FROM $tablename ORDER BY $idcolumn DESC");
    return result.toList();
}

//get row count

Future<int> rowcounts() async{
    Database dbclient=await db;

    return Sqflite.firstIntValue(
      await dbclient.rawQuery("SELECT COUNT(*) FROM $tablename")
    );
}

//fetch a user
Future<MyFileDataBase> getuser(String id) async{
    Database dbclient=await db;
    var result=await dbclient.rawQuery("SELECT * FROM $tablename WHERE $idcolumn=$id");
    if(result.length==0) return null;
    return new MyFileDataBase.fromMap(result.first);
}
//delete a user
Future<int> deleteuser(String id) async{
    Database dbclient=await db;
    return dbclient.delete(tablename,where: "$idcolumn=?",whereArgs: [id]);
}

//update a row
Future<int> updateuser(MyFileDataBase myFileDataBase)
async{
    Database dbclient=await db;
    return dbclient.update(tablename, myFileDataBase.toMap(),where: "$idcolumn=?",whereArgs: [myFileDataBase.id]);
}

//close database instance
Future close() async{
    Database dbclient=await db;
    return dbclient.close();
}
}