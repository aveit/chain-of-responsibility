abstract class DataSource {
  DataSource? next;

  DataSource linkWith(DataSource dataSource) {
    return next = dataSource;
  }

  List<String> handle() {
    return next?.handle() ?? [];
  }
}
