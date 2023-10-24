import 'package:flutter/material.dart';
import '../../routers/routers.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<LoginPage> {
  String _message = "";

  // 输入框控制器
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // 管理焦点
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusScopeNode? focusScopeNode;

  // 输入框-用户名
  Widget _buildName() {
    return TextField(
      controller: _controllerName,
      autofocus: true,
      focusNode: focusNodeName,
      decoration: const InputDecoration(
          labelText: '用户名',
          hintText: '请输入',
          prefixIcon: Icon(Icons.person),
          suffixIcon: Icon(Icons.edit),
          border: OutlineInputBorder()),
      onChanged: (String value) {
        setState(() {
          _message = value;
        });
      },
      onSubmitted: (String value) {
        focusScopeNode ??= FocusScope.of(context);
        focusScopeNode?.requestFocus(focusNodePassword);
      },
    );
  }

  // @override
  // void initState() {
  //   passwordVisible = false;
  // }

// 输入框-密码
  Widget _buildPassword() {
    return TextField(
      controller: _controllerPassword,
      obscureText: false,
      focusNode: focusNodePassword,
      decoration: const InputDecoration(
          labelText: '密码',
          hintText: '请输入密码',
          prefixIcon: Icon(Icons.person),
          suffixIcon: Icon(Icons.visibility_off),
          // suffixIcon: IconButton(onPressed:(){}, icon: Icon(Icons.visibility_off)),
          border: OutlineInputBorder()),
    );
  }

  // button
  Widget _buildButton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            _message =
                'name:${_controllerName.text},pass:${_controllerPassword.text}';
          });
          Routes.router.navigateTo(context, '/');
        },
        child: const Text('登录'));
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildName(),
          const SizedBox(height: 10),
          _buildPassword(),
          const SizedBox(height: 10),
          _buildButton(),
          const SizedBox(height: 10)
        ]),
      ),
    );
  }
}
