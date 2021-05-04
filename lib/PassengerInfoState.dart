import 'package:flutter/material.dart';
import 'dart:ui';

import 'main.dart';
import 'models/NoName.dart';
import 'models/Passengers.dart';




class PassengerInfoState extends State<PassengerInfo> {
  List<Passengers> passList = [
    Passengers(
        id: 1,
        name: 'Test user 1',
        phone: '87777777777',
        mail: 'test@gmail.com',
        price: '2000',
        sit_num: '21',
        type: 'offline'
    ),
    Passengers(
        id: 2,
        name: 'Test user 2',
        phone: '87777777777',
        mail: 'test2@gmail.com',
        price: '2000',
        sit_num: '1',
        type: 'offline'
    ),
    Passengers(
        id: 3,
        name: 'Test user 3',
        phone: '87777777777',
        mail: 'test3@gmail.com',
        price: '2500',
        sit_num: '5',
        type: 'online'
    ),
    Passengers(
        id: 4,
        name: 'Test user 4',
        phone: '87777777777',
        mail: 'test4@gmail.com',
        price: '2500',
        sit_num: '2',
        type: 'online'
    ),
  ];

  List<NoName> noName = [
    NoName(
      id: 5,
      name: 'Нет имени',
      price: '3000',
      sit_num: '15',
      type: 'no type',
    ),
    NoName(
      id: 6,
      name: 'Нет имени',
      price: '3000',
      sit_num: '20',
      type: 'no type',
    ),
    NoName(
      id: 7,
      name: 'Нет имени',
      price: '3000',
      sit_num: '30',
      type: 'no type',
    ),
    NoName(
      id: 8,
      name: 'Нет имени',
      price: '3000',
      sit_num: '32',
      type: 'no type',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Пассажиры'),
        ),
        body: ListView(children: <Widget>[
          DataTable(
            showCheckboxColumn: false,
            columns: [
              DataColumn(label: Text('Имя', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('Место', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('Тип', style: TextStyle(fontSize: 20))),
            ],
            rows: [
              for (Passengers i in passList)
                DataRow(
                    onSelectChanged: (value) {
                      _detailedInfo(context, i);
                    },
                    cells: [
                      DataCell(Text(i.name)),
                      DataCell(Text(i.sit_num)),
                      DataCell(Text(i.type,
                          style: TextStyle(
                              color: Colors.white,
                              background: Paint()
                                ..strokeWidth = 24.0
                                ..color = Colors.green
                                ..style = PaintingStyle.stroke
                                ..strokeJoin = StrokeJoin.round
                          ))),
                    ]),
            ],
          ),
          Center(
              child: Text(
                'Свободные места',
                style: TextStyle(fontSize: 20),
              )),
          DataTable(
            columns: [
              DataColumn(label: Text('', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('', style: TextStyle(fontSize: 20))),
              DataColumn(label: Text('', style: TextStyle(fontSize: 20))),
            ],
            rows: [
              for (NoName i in noName)
                DataRow(cells: [
                  DataCell(Text(i.name)),
                  DataCell(Text(i.sit_num)),
                  DataCell(Text(i.type,
                      style: TextStyle(
                          color: Colors.white,
                          background: Paint()
                            ..strokeWidth = 24.0
                            ..color = Colors.green
                            ..style = PaintingStyle.stroke
                            ..strokeJoin = StrokeJoin.round
                      ))),

                ]),

            ],
          ),
        ]));
  }

  void _detailedInfo(context, Passengers pass) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container (
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Информация о пассажире",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                        Border(bottom: BorderSide(color: Colors.black))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: pass.name,
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                        Border(bottom: BorderSide(color: Colors.black))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: pass.phone,
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                        Border(bottom: BorderSide(color: Colors.black))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: pass.mail,
                          hintStyle: TextStyle(color: Colors.green)),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Место",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Цена",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                pass.sit_num,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                pass.price,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                "Изменить",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 37,
                      ),
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                "отправить чек",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Center(
                    child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 5),
                          height: 36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.green),
                          child: FlatButton(
                            onPressed: (){
                              Widget cancelButton = FlatButton(
                                  child: Text("Нет",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.0)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  });
                              Widget continueButton = FlatButton(
                                  child: Text("Да",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.0)),
                                  onPressed: () => setState(() {
                                    passList.remove(pass);
                                    Navigator.of(context).pop();
                                  }));

                              AlertDialog alert = AlertDialog(
                                  content: Text("отменить покупку билета?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400, fontSize: 21.0)),
                                  actions: [cancelButton, continueButton]);
                              showDialog(context: context, builder: (context) => alert);
                            },
                            child: Text(
                              "отменить покупку билета",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
                ],
              ));
        });
  }
}