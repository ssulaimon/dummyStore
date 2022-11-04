import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocy/controller/bottomsheet_controller.dart';
import 'package:grocy/views/widget_custome/edited_button.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class BottomsheetCustomized extends StatelessWidget {
  const BottomsheetCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    final currentValue = Get.put(BottomsheetController());
    List<String> sortBy = ['new', 'popularity,'];
    List select = [];
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel,
                ),
              ),
              const Text('Filter'),
              TextButton(
                onPressed: () {},
                child: const Text('Reset',
                    style: TextStyle(color: Color(0xFF009B37))),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort By',
                ),
                DropdownButton(
                    focusColor: Colors.white,
                    value: sortBy[0],
                    items: sortBy
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (Value) {})
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 10.0,
            ),
            child: Text(
              'Price Range',
              style: TextStyle(color: Color(0xFF009B37)),
            ),
          ),
          Obx(
            () => Slider(
              min: 5.0,
              activeColor: const Color(0xFF009B37),
              inactiveColor: const Color(0xFFE9FBEF),
              thumbColor: const Color(0xFF009B37),
              value: currentValue.currentIndex.value,
              onChanged: (value) {
                currentValue.changeIndex(
                  setIndex: value,
                );
              },
              max: 1000.00,
              divisions: currentValue.currentIndex.value.round(),
              label: '\$${currentValue.currentIndex.value.round().toString()}',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF009B37),
              ),
            ),
          ),
          MultiSelectChipField(
              // onTap: (value) {
              //   // log(value.toString());
              // },
              items: sortBy
                  .map((items) => MultiSelectItem(
                        items,
                        items,
                      ))
                  .toList()),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: FlatButtonEdited(
              title: 'Apply Filter',
              function: () {
                Get.back();
                Get.snackbar(
                  'Filter',
                  'Your Search have been added ',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
