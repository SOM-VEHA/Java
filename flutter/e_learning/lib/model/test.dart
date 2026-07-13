// class SupabaseService {
//   final SupabaseClient client;
//
//   SupabaseService(this.client);
//
//
//   Future<List<Map<String, dynamic>>> select(
//       String table, {
//         String columns = '*',
//       }) async {
//
//     final response = await client
//         .from(table)
//         .select(columns);
//
//     return List<Map<String, dynamic>>.from(response);
//   }
//
//
//   Future<void> insert(
//       String table,
//       Map<String, dynamic> data,
//       ) async {
//
//     await client
//         .from(table)
//         .insert(data);
//   }
//
//
//   Future<void> delete(
//       String table,
//       String column,
//       dynamic value,
//       ) async {
//
//     await client
//         .from(table)
//         .delete()
//         .eq(column, value);
//   }
// }

//
// ប្រើក្នុង UI
// Add Favorite ❤️
// ref
//     .read(favoriteControllerProvider.notifier)
//     .addFavorite(course.id);
// Remove Favorite
// ref
//     .read(favoriteControllerProvider.notifier)
//     .removeFavorite(course.id);
// Get Favorite List
// final favorites =
// ref.watch(favoriteControllerProvider);