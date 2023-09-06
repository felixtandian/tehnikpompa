import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemUtility extends StatelessWidget {
  final int? id;
  final String? name;
  final Function? onTap;
  final int? isSelected;

  const ItemUtility(
      {this.id, this.name = 'name', this.onTap, this.isSelected = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: 321,
        height: 70,
        decoration: BoxDecoration(
            color: /*isSelected!=0 ? Constants.PrimaryColor*/ Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name != null ? name.toString() : '0',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    color: /*isSelected!=0 ? Colors.white :*/ Colors.black),
              ),
              Icon(Icons.arrow_forward_ios, size: 12)
            ],
          ),
        ),
      ),
    );
  }
}
