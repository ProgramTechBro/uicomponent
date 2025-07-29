import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hostelize/app/modules/auth/controller/auth_controller.dart';
import 'package:hostelize/app/modules/profile/controllers/profile_controller.dart';
import 'package:hostelize/app/modules/profile/local_widgets/update_profile_dialog.dart';
import 'package:hostelize/core/data/models/user_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetBuilder<AuthController>(
        id: 'update',
        builder: (controller) {
          UserModel? user = AuthController.to.user.value;
          return Scaffold(
            backgroundColor: Colors.grey.shade50,
            body: SafeArea(
              child: Column(
                children: [
                  // Header with title and edit button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return UpdateProfileDialog();
                                });
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.grey,
                          ),
                          label: const Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Profile content
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Profile image
                        _buildProfileImage(user?.pictureUrl),
                        
                        const SizedBox(height: 40),
                        
                        // Profile details
                        _buildProfileDetails(user!),
                        
                        const Spacer(),
                        
                        // Logout button
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add logout functionality
                                AuthController.to.logout();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink.shade100,
                                foregroundColor: Colors.red.shade400,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.red.shade400,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildProfileImage(String? imageUrl) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        ImageProvider? imageProvider;

        if (imageUrl != null && imageUrl.isNotEmpty) {
          imageProvider = NetworkImage(imageUrl);
        }

        return CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: imageProvider,
          child: imageProvider == null
              ? Icon(
                  Icons.person,
                  size: 48,
                  color: Colors.grey.shade600,
                )
              : null,
        );
      },
    );
  }

  Widget _buildProfileDetails(UserModel user) {
    return Column(
      children: [
        _buildField('Name', user.name ?? 'Ahmed Ali'),
        const SizedBox(height: 16),
        _buildField('Email Address', user.email ?? 'kashif@gmail.com'),
      ],
    );
  }

  Widget _buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}