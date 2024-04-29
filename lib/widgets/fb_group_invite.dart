import 'package:flutter/material.dart';

class FbInviteButton extends StatelessWidget {
  const FbInviteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: const Size(120, 10),
        backgroundColor: Color(0xFF012269),
        shadowColor: Colors.transparent,
      ),
      child: Row(
        children: [
          Icon(Icons.group_add),
          SizedBox(
            width: 5,
          ),
          const Text(
            "invite",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
