import 'package:injectable/injectable.dart';
import 'package:recipe_finder/app/data/data_sources/constants/local_storage_keys.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class RecipeDatabaseModule {
  @singleton
  @preResolve
  Future<Database> createDatabase() async {
    final database = await openDatabase(
      'recipe_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('CREATE TABLE ${LocalStorageKeys.recipesCache.name}'
            ' (id INTEGER PRIMARY KEY, data TEXT)');
      },
    );

    return database;
  }
}
