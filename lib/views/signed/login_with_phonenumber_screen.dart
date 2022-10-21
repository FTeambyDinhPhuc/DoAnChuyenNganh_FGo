import 'package:fgo/constants.dart';
import 'package:flutter/material.dart';
import 'components/or_divider.dart';
import 'components/text_question_select.dart';

class LoginWithPhoneNumber extends StatelessWidget {
  const LoginWithPhoneNumber({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 19, top: 0, right: 19, bottom: 51),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Đăng nhập\nBằng số điện thoại",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: defaultPadding * 2.5,
                                bottom: defaultPadding * 1.5),
                            child: Column(children: [TextField(), TextField()]),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            minWidth: double.infinity,
                            height: heightButton,
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              "Đăng nhập",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            onPressed: () {},
                          ),
                          Column(
                            children: [
                              OrDivider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                      heroTag: "btn1", onPressed: () {}),
                                  FloatingActionButton(
                                      heroTag: "btn2", onPressed: () {})
                                ],
                              ),
                              TextQuestionSelect(
                                question: "Chưa có tài khoản? ",
                                select: "Đăng ký",
                                press: () {
                                  print("hihi");
                                },
                              )
                            ],
                          )
                        ]),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
