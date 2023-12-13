import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/widgets/chat_user_card.dart';
import 'apis.dart';
import 'common/app_colors.dart';
import 'common/app_text_style.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatUser> list = [];
  List<ChatUser> searchList = [];
  bool _isSearching = false;
  //final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    //_focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Thêm lắng nghe sự kiện khi TextField được focus
    //_focusNode.addListener(_onFocusChange);


    APIs.getSelfInfo();
  }
  // void _onFocusChange() {
  //   // Nơi xử lý sự kiện khi TextField được focus hoặc mất focus
  //   if (_focusNode.hasFocus) {
  //     _isSearching = !_isSearching;
  //     print('TextField is focused');
  //   } else {
  //     _isSearching = !_isSearching;
  //     print('TextField lost focus');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///Ẩn bản phím khi click ra bên ngoài màn hình
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        ///Nếu đang search và ấn nút back
        ///hoặc là ở màn hình chính và ấn nút back
        onWillPop: (){
          if(_isSearching){
            setState(() {
              _isSearching = !_isSearching;
              _searchController.clear();
            });
          }else{
            setState(() {
              ///reset gái trị search
              _searchController.clear();
            });
          }
          return Future.value(false);
        },
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(
            top: 14,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contacts",
                      style: AppTextStyle.primaryS18W600,
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        "assets/vectors/ic_add.svg",
                        width: 14,
                        height: 14,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Container(
                  width: 327,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.backgroundInput,
                  ),
                  child: TextField(
                    controller: _searchController,
                    //focusNode: _focusNode,
                    onChanged: (value){
                      searchList.clear();

                      for(var i in list){
                        if(i.name.toLowerCase().contains(value.toLowerCase())){
                          searchList.add(i);
                        }
                        setState(() {
                          searchList;
                        });
                      }
                    },

                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: AppTextStyle.primaryS14W600.copyWith(
                        color: AppColors.textHintPrimary,
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        color: AppColors.textHintPrimary,
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              StreamBuilder(

                  stream: APIs.getAllUser(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      //if data is loading
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );

                      case ConnectionState.active:
                      case ConnectionState.done:

                        final data = snapshot.data?.docs;
                        list = data?.map((e) => ChatUser.fromJson(e.data())).toList()??[];
                        return Expanded(
                          child: ListView.separated(
                              itemCount:_isSearching || _searchController.text.isNotEmpty ? searchList.length : list.length,
                              separatorBuilder: (context, index) {
                                return Container(
                                  color: AppColors.borderPrimary,
                                  height: 1,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 24),
                                );
                              },
                              itemBuilder: (context, index) {
                                return ChatUserCard(
                                    user: _isSearching || _searchController.text.isNotEmpty ? searchList[index] : list[index]);
                              }),
                        );
                    }
                  }),
            ],
          ),
        )),
      ),
    );
  }
}