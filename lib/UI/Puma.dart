import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home.dart';
import 'Page2.dart';
class PUMA extends StatefulWidget {
  const PUMA({Key? key}) : super(key: key);

  @override
  State<PUMA> createState() => _PUMAState();
}

class _PUMAState extends State<PUMA> {
  bool value = false;

  List<bool> isVisible=[];
  @override
  Widget build(BuildContext context) {
    for(int i=0;i<puma.length;i++){
      isVisible.add(false);
    }
    return  Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.h
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(   onTap: (){
                    Navigator.of(context)
                        .pop();
                  },
                      child: Icon(Icons.arrow_back,color: Colors.black,)),

                  SizedBox(width: 260,),

                  Icon(Icons.search_outlined),
                ],
              ),
            ),
            SizedBox(height: 30.h
            ),
            Expanded(

              child: Container(

                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 200 / 300,
                  shrinkWrap: true,
                  children:
                  List.generate(

                    pumaname.length,
                        (index) {


                      // ----------- Main container -----------------

                      return GestureDetector(onTap: (){
                        Navigator.push
                          (context, MaterialPageRoute(builder: (builder)=>Page2(image:puma,)));
                      },
                        child: Container(
                          width: 140.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              // border: Border.all(width: 1,color: Colors.grey),
                              color: Color(0xffffffff)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                // ------------ Image container  -----------------

                                Stack(
                                    children: [Container(
                                      width: 160.w,
                                      height: 180.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          // border: Border.all(width: 1,color: Colors.grey),
                                          color: Color(0xfce5e5e5)),
                                      child: SizedBox( width: 76.65777587890625.w,
                                        height: 83.19111633300781.h,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
                                          child: Image.asset(
                                            puma[index],
                                            width: 76.65777587890625.w,
                                            height: 83.19111633300781.h,
                                          ),
                                        ),
                                      ),
                                    ),

                                      Positioned(left: 119.w,top: 11.h,
                                        child: CircleAvatar(radius: 15.r,backgroundColor: Colors.black,
                                          child: GestureDetector(onTap: (){
                                            setState((){
                                              isVisible[index]=!isVisible[index];
                                            });
                                          },
                                              child:isVisible[index]==true? Icon(
                                                Icons.favorite,
                                                color: Colors.red,size: 16,
                                              ):Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,size: 16,
                                              )
                                          ),
                                        ),
                                      ),


                                    ]),
                                SizedBox(height: 10.h,),
                                Column(
                                  children: [
                                    Center(
                                      child: Text(pumaname[index],
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 55),
                                      child: SizedBox(width: 100,
                                        child: Row(
                                          children: [
                                            Text(
                                                "\$",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                )
                                            ),
                                            Text(
                                                "554.2",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: Text(
                                          "Free Shipping",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w400,
                                          )
                                      ),
                                    )
                                  ],
                                ),
                                // SizedBox(
                                //   width: 120.w,
                                // ),

                              ],
                            ),

                          ),
                        ),
                      );

                    },

                  ),

                ),

              ),

            ),

          ],
        ),
      ),
    );
  }
}
