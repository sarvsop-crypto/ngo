class KpiData {
  final String value;
  final String label;
  const KpiData({required this.value, required this.label});
}

class CardData {
  final String title;
  final String description;
  final String? badge;
  const CardData({required this.title, required this.description, this.badge});
}
