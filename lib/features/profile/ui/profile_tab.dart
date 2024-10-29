import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Text(
                  'AM',
                  style: TextStyles.font20BlackW600,
                ),
              ),
              textColor: Colors.black,
              title: const Text(
                'Hello, Asma Magdy ',
                style: TextStyle(fontSize: 15),
              ),
              subtitle: const Text('asma@test.com '),
              trailing: Image.asset('assets/Frame 106.png'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 23, 104, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Personal information',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.credit_card),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Payment method',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.clear_all_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Measurements',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  'Privacy',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 23, 104, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.label_important),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Privacy & Cookie policy',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.terminal_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.dehaze_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'About Us',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
