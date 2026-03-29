import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final client1 = Supabase.instance.client;
  static final client2 = SupabaseClient(
    'https://ssakrzyoltsgrbmznukl.supabase.co',
    'sb_publishable_XysSMGZN2TncXU8WuOMN_A_Cu6csCnO',
  );
}