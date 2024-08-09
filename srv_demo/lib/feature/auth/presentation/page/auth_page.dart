import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:srv_demo/core/constants/colors.dart';
import 'package:srv_demo/core/constants/routes.dart';
import 'package:srv_demo/core/utils/email_validator.dart';
import 'package:srv_demo/feature/auth/data/models/security_request_model.dart';
import 'package:srv_demo/feature/auth/presentation/page/profile_page.dart';
import 'package:srv_demo/feature/auth/presentation/provider/user_controller.dart';
import 'package:srv_demo/feature/auth/presentation/widgets/auth_app_bar_widget.dart';

class LoginAuthPage extends StatefulWidget {
  const LoginAuthPage({super.key});

  @override
  _LoginAuthPageState createState() => _LoginAuthPageState();
}

class _LoginAuthPageState extends State<LoginAuthPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: const AuthAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: _FormWidget(
          formKey: formKey,
          emailTextController: emailTextController,
          passwordTextController: passwordTextController,
        ),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({
    required this.formKey,
    required this.emailTextController,
    required this.passwordTextController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const LabelWidget(label: "Email"),
          const SizedBox(
            height: 23,
          ),
          _EmailFieldWidget(controller: emailTextController),
          const SizedBox(
            height: 23,
          ),
          const LabelWidget(label: "Пароль"),
          const SizedBox(
            height: 23,
          ),
          _PasswordFieldWidget(controller: passwordTextController),
          const SizedBox(
            height: 23,
          ),
          Center(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ShopButton(
                  title: "Подтвердить",
                  event: () {
                    //TODO: Get the code
                    final form = formKey.currentState!;
                    if (form.validate()) {
                      final email = emailTextController.text;
                      final password = passwordTextController.text;
                      ref
                          .read(userControllerProvider.notifier)
                          .login(
                            request: SecurityRequestModel(
                              email: email,
                              password: password,
                            ),
                          )
                          .then(
                            (value) => {
                              value.fold(
                                (l) {
                                  final snackBar = SnackBar(
                                    content: Text(l),
                                    duration: const Duration(seconds: 5),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                (r) => context.go(mainRoute),
                              ),
                            },
                          );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  final String label;

  const LabelWidget({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class ShopButton extends StatelessWidget {
  final String title;
  final Function() event;
  const ShopButton({super.key, required this.title, required this.event});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: event,
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(300, 50)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(
          mainButtonBackgroundColor,
        ),
        elevation: const WidgetStatePropertyAll(0),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: mainButtonForegroundColor,
          fontSize: 23,
        ),
      ),
    );
  }
}

class _EmailFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const _EmailFieldWidget({
    required this.controller,
  });

  @override
  State<_EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<_EmailFieldWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: shopInputStyle,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      validator: gardenEmailValidator,
    );
  }
}

final shopInputStyle = InputDecoration(
  fillColor: Colors.white,
  constraints: const BoxConstraints(maxHeight: 40),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: Colors.black, // Цвет границы в обычном состоянии
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: Colors.black, // Цвет границы при фокусе
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: Colors.red, // Цвет границы при ошибке
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: Colors.red, // Цвет границы при фокусе и ошибке
    ),
  ),
  filled: true,
  errorStyle: const TextStyle(
    color: Colors.red, // Цвет текста ошибки
  ),
  hintStyle: const TextStyle(
    color: Colors.black, // Цвет подсказки
  ),
  labelStyle: const TextStyle(
    color: Colors.black, // Цвет текста внутри поля
  ),
);

class _PasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const _PasswordFieldWidget({
    required this.controller,
  });

  @override
  State<_PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<_PasswordFieldWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: shopInputStyle,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.password],
    );
  }
}
