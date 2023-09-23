import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {

  // 날짜 선택
  DateTime date = DateTime.now();

  final _bankList1 = [
    '하나은행',
    '우리은행',
    'KB국민은행',
    '신한은행',
    'NH농협은행',
    '기업은행',
    'SC제일은행',
    '시티은행',
    '수협은행',
    '부산은행',
    '대구은행',
    '전북은행',
    '경남은행',
    '제주은행',
  ];
  var _selectedBank = '하나은행';

  int idx1 = 0;
  final TextEditingController _percentController = TextEditingController(text: "30");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child:Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Color(0xFFFFD954),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Container(
                      child: RichText(
                        text:  const TextSpan(
                          children:  [
                            TextSpan(
                              text: "이익/손실",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            TextSpan(
                              text: "계산",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                      const SizedBox(width: 10,),
                      Container(
                        child:IconButton(
                          icon: const Icon(Icons.info_outline_rounded),
                          color: Colors.white,
                          onPressed: () {  },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                            width: 190,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black38),
                            ),
                            // 날짜 선택
                            child: GestureDetector(
                              onTap: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),

                                );
                                if (selectedDate != null) {
                                  setState(() {
                                    date = selectedDate;
                                  });
                                }
                              },
                              child:  Text(
                                "${date?.year.toString()}.${date?.month.toString().padLeft(2, '0')}.${date?.day.toString().padLeft(2, '0')}",
                            style: const TextStyle(fontSize: 26),),
                          ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            margin:const EdgeInsets.fromLTRB(50, 10, 10, 10),
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                            padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                            width: 330,
                            height: 60,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 3,
                                    offset: const Offset(0, 0),
                                  ),
                                ]),
                            child: const Text(
                              '3,000.00 ',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                            width: 90,
                            height: 30,
                            // color: Colors.red,
                            child: ElevatedButton(
                              onPressed: (){
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    builder: (BuildContext context){
                                  return Container(
                                      height: MediaQuery.of(context).size.height / 5 * 4,
                                      color: Colors.transparent,
                                      child:Container(
                                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                          height: MediaQuery.of(context).size.height / 5 * 4,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '환전 기록',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Container(
                                                      margin: const EdgeInsets.all(20.0),
                                                      padding: const EdgeInsets.all(0.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const Text(
                                                                '2022년 9월',
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 17,
                                                                )
                                                            ),
                                                            const SizedBox(height: 4),
                                                            Container(
                                                                width: 350,
                                                                height: 150,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                  color: const Color(0xFFF2F2F2),
                                                                ),
                                                                child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                          margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                const Text(
                                                                                  '2022년 9월 20일 수요일',
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                IconButton(
                                                                                    icon: const Icon(
                                                                                      Icons.more_horiz,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      showDialog(
                                                                                          context: context,
                                                                                          builder: (BuildContext context) {
                                                                                            return const CustomModalWidget();
                                                                                          }
                                                                                      );
                                                                                    }
                                                                                )
                                                                              ]
                                                                          )
                                                                      ),
                                                                      const SizedBox(height: 10),
                                                                      Container(
                                                                          margin: const EdgeInsets.symmetric(horizontal: 16),
                                                                          child: const Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                          '1331.66',
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontSize: 30,
                                                                                          )
                                                                                      ),
                                                                                      SizedBox(height:5),
                                                                                      Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                                '신한은행',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 17,
                                                                                                )
                                                                                            ),
                                                                                            Text(
                                                                                                '우대율30%',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 13,
                                                                                                )
                                                                                            )
                                                                                          ]
                                                                                      )
                                                                                    ]
                                                                                ),
                                                                                Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Text(
                                                                                                '740',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 20,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  color: Color(0xFF0984E3),
                                                                                                )
                                                                                            ),
                                                                                            Text(
                                                                                                ' USD',
                                                                                                style: TextStyle(
                                                                                                    fontSize: 20,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    color: Color(0xFF0984E3)
                                                                                                )
                                                                                            ),
                                                                                            SizedBox(width: 10),
                                                                                            CircleAvatar(
                                                                                              backgroundImage:
                                                                                              AssetImage('assets/images/USD.png'),
                                                                                              radius: 16,
                                                                                            ),
                                                                                          ]
                                                                                      ),
                                                                                      SizedBox(height:6),
                                                                                      Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Text(
                                                                                                '992,147',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 20,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  color: Color(0xFFFF5656),
                                                                                                )
                                                                                            ),
                                                                                            Text(
                                                                                                ' KRW',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 20,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  color: Color(0xFFFF5656),
                                                                                                )
                                                                                            ),
                                                                                            SizedBox(width: 10),
                                                                                            CircleAvatar(
                                                                                              backgroundImage:
                                                                                              AssetImage('assets/images/KRW.png'),
                                                                                              radius: 16,
                                                                                            ),
                                                                                          ]
                                                                                      )
                                                                                    ]
                                                                                )
                                                                              ]
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                      ),
                                  );
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.green,
                              ), child: const Text('환전기록'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black38),
                                color: Colors.white,
                            ),
                            child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                value: _selectedBank,
                                items: _bankList1.map(
                                    (value) {
                                      return  DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                          child: Text(value),
                                        ),

                                      );
                                    }
                                ).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedBank = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          // 우대율
                          Container(
                            margin: const EdgeInsets.fromLTRB(30, 0, 10, 5),
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                            width: 110,
                            height: 50,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black38),
                            ),
                            child:  TextField(
                              controller: _percentController,
                              cursorColor: Colors.black38,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration:  InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                suffixText: '%',
                              ),
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(280, 10, 10, 0),
                            width: 70,
                            height: 50,
                            // color: const Color(0xFFFFD954),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(color: Colors.black38),
                              color:  const Color(0xFFFFD954),
                            ),
                            child:IconButton(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                              onPressed: (){
                              },
                              icon: const Icon(Icons.drag_handle_rounded),
                              iconSize: 50,
                              color: Colors.white,

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      width: 350,
                      height: 60,
                      child: getCalculateView(
                          ChatBubbleClipper6(type: BubbleType.sendBubble),
                          context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  getCalculateView(CustomClipper clipper, BuildContext context) => ChatBubble(
    clipper: clipper,
    elevation: 0,
    alignment: Alignment.topLeft,
    margin: const EdgeInsets.all(0),
    backGroundColor:const Color(0xFFFFD954),
    child: Container(
      // constraints: const BoxConstraints(
      //   // maxWidth: MediaQuery.of(context).size.width * 1,
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child:  const Column(
        children: [
          Row(
            children: [
              Text(
                " 환전 시기에 따른 ",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                "손익/손실 ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "을 ",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                "비교 ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "해보세요! ",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// 수정, 삭제 모달
class CustomModalWidget extends StatelessWidget {
  const CustomModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Container(
            width: 330,
            height: 170,
            child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }
                        )
                      ]
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                      onTap: () {
                        // 수정하기 동작 구현
                      },
                      child: Container(
                          width: 270,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: const Color(0xFF1D77E8)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                                "수정하기",
                                style: TextStyle(
                                    color: Color(0xFF1D77E8),
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          )
                      )
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                      onTap: () {
                        // 삭제하기 동작 구현
                      },
                      child: Container(
                          width: 270,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: const Color(0xFFF53C3C)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                                "삭제하기",
                                style: TextStyle(
                                    color: Color(0xFFF53C3C),
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}