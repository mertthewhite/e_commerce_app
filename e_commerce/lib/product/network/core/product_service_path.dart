enum ServicePath {
  getMeal('/search.php?s='),
  getMealCategory('/list.php?c=list');

  final String value;
  const ServicePath(this.value);
}
