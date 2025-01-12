import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/account.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/screens/add_account_screen.dart';
import 'package:money_manager/src/widgets.dart';
import '../components/category.dart';
import '../components/catagory_horizontal_widget.dart';
import '../components/category_widget.dart';
import '../components/custome_page_route.dart';
import '../components/navigation_drawer.dart';
import '../components/title_text_1.dart';

class AccountWidget extends StatelessWidget {
  AccountWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TitleText1(
            text: 'Tài khoản',
            fontFamily: 'Inter',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            r: 255,
            g: 255,
            b: 255),
        backgroundColor: Colors.transparent,
        toolbarHeight: 72.h,
        elevation: 0.0,
        leading: Builder(
          builder: (context) => Container(
            child: IconButton(
              padding: EdgeInsets.only(left: 32.w),
              iconSize: 30.sp,
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () => {Scaffold.of(context).openDrawer()},
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 35, 111, 87),
                Color.fromARGB(255, 35, 111, 87)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: TitleText1(
                  text: 'Tổng cộng',
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  r: 127,
                  g: 130,
                  b: 103),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: TitleText1(
                  text: '${ApplicationState.getInstance.getTotalAmount()} ₫',
                  fontFamily: 'Inter',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  r: 0,
                  g: 0,
                  b: 0),
            ),
          ),
          Row(children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 80.w, top: 15.h),
                child: CategoryVWidget(
                    category: Category(
                        id: '',
                        icon: '⟲',
                        description: 'Lịch sử',
                        color: '0xFF46BF8C'),
                    iconColor: '0xFFFFFFFF'),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 80.w, top: 15.h),
                child: CategoryVWidget(
                    category: Category(
                        id: '',
                        icon: '⇄',
                        description: 'Chuyển tiền',
                        color: '0xFF46BF8C'),
                    iconColor: '0xFFFFFFFF'),
              ),
            ),
          ]),
          // Center(
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 30.h),
          //     child: SizedBox(
          //       width: 344.w,
          //       height: 53.h,
          //       child: RaisedButton.icon(
          //         onPressed: () {
          //           print('Raise button');
          //         },
          //         icon: Icon(Icons.attach_money,
          //             color: Color.fromARGB(255, 127, 130, 103)),
          //         label: TitleText1(
          //             text: 'Chính            20,000,000 đ',
          //             fontFamily: 'Inter',
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //             r: 127,
          //             g: 130,
          //             b: 103),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(15.r)),
          //         ),
          //         color: Color.fromARGB(255, 248, 248, 248),
          //         elevation: 0.5,
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: SizedBox(
                width: 344.w,
                height: 53.h,
                child: ListView.builder(
                    itemCount: ApplicationState.getInstance.accounts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AccountInfo(
                          account:
                              ApplicationState.getInstance.accounts[index]);
                    }),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 280.h),
              child: SizedBox(
                width: 93.w,
                height: 51.h,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(CustomPageRoute(
                          direction: AxisDirection.up,
                          child: AddAccountScreen(title: '')));
                    },
                    child: TitleText1(
                        text: 'Thêm',
                        fontFamily: 'Inter',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        r: 255,
                        g: 255,
                        b: 255),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 35, 111, 87)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      )),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key, required this.account, this.onPress})
      : super(key: key);

  final Account account;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          CategoryHWidget(
            category: Category(
                index: account.index,
                icon: account.icon,
                id: account.id,
                color: account.color,
                description: account.description),
            hasImage: false,
          ),
          (account.visible ? Text('') : Text(':)')),
          Text('${account.value} VNĐ'),
        ],
      ),
    );
  }
}
