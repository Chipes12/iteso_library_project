class DatabaseRepository {

  static final DatabaseRepository databaseRepository = DatabaseRepository._internal();
  factory DatabaseRepository() => databaseRepository;

  DatabaseRepository._internal();
}