/// Formats [date] as `yyyy-MM-dd'T'HH:mm:ss` in local time.
abstract final class DateFormatUtil {
  static String formatDateTime(DateTime date) {
    final local = date.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-'
        '${two(local.month)}-'
        '${two(local.day)}  '
        '${two(local.hour)}:'
        '${two(local.minute)}:'
        '${two(local.second)}';
  }
}
