import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zemnanit/presentation/user_side/providers/auth_provider.dart';
import 'package:zemnanit/presentation/user_side/services/auth_service.dart';

// State providers for managing the visibility of password fields
final oldPasswordVisibilityProvider = StateProvider<bool>((ref) => true);
final newPasswordVisibilityProvider = StateProvider<bool>((ref) => true);

class ProfilePage extends ConsumerWidget {
  final String email;

  ProfilePage({required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider.notifier);
    final authState = ref.watch(authServiceProvider);

    final TextEditingController passwordController = TextEditingController();
    final TextEditingController oldpasswordController = TextEditingController();

    // Get the current visibility states
    final oldPasswordVisible = ref.watch(oldPasswordVisibilityProvider);
    final newPasswordVisible = ref.watch(newPasswordVisibilityProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: $email'),
            SizedBox(height: 16),
            TextField(
              controller: oldpasswordController,
              decoration: InputDecoration(
                labelText: 'Old Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    oldPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle the visibility state
                    ref.read(oldPasswordVisibilityProvider.notifier).state =
                        !oldPasswordVisible;
                  },
                ),
              ),
              obscureText: oldPasswordVisible,
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    newPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle the visibility state
                    ref.read(newPasswordVisibilityProvider.notifier).state =
                        !newPasswordVisible;
                  },
                ),
              ),
              obscureText: newPasswordVisible,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await authService.updatePassword(
                        passwordController.text, oldpasswordController.text);
                    final snackBarContent =
                        authState.message ?? authState.error;
                    if (snackBarContent != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(snackBarContent),
                      ));
                    }
                  },
                  child: Text('Update Password'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () async {
                    await authService.deleteUser();
                    final snackBarContent =
                        authState.message ?? authState.error;
                    if (snackBarContent != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(snackBarContent),
                      ));
                      if (authState.message != null) {
                        Navigator.of(context)
                            .pop(); // Go back to the previous screen
                      }
                    }
                  },
                  child: Text('Delete Account'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
