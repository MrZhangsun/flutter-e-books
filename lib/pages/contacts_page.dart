import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _getContactsPermission();
  }

  Future<void> _getContactsPermission() async {
    print('Requesting contacts permission...');

    PermissionStatus permissionStatus = await Permission.contacts.request();
    print('Contacts permission status: $permissionStatus');
    if (permissionStatus.isGranted) {
      _loadContacts();
    } else if (permissionStatus.isDenied) {
      // 权限被拒绝，处理逻辑
      _showPermissionDeniedDialog();
    } else if (permissionStatus.isPermanentlyDenied) {
      // 用户永久拒绝了权限，建议去设置开启
      _showPermissionPermanentlyDeniedDialog();
    }
  }

  Future<void> _loadContacts() async {
    List<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  void _showPermissionPermanentlyDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('权限被永久拒绝'),
          content: const Text('请在设置中允许访问通讯录。'),
          actions: <Widget>[
            TextButton(
              child: const Text('去设置'),
              onPressed: () {
                openAppSettings(); // 打开设置
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('通讯录权限被拒绝'),
          content: const Text('请在设置中允许访问通讯录。'),
          actions: <Widget>[
            TextButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通讯录'),
      ),
      body: _contacts.isEmpty
          ? Center(
              child: TextButton(
                  onPressed: () {
                    _getContactsPermission();
                  },
                  child: const Text('未读取到联系人')))
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                Contact contact = _contacts[index];
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(
                      contact.phones?.map((e) => e.value).join(', ') ?? ''),
                );
              },
            ),
    );
  }
}
