import 'package:flutter/material.dart';

import '../utils/color_manager.dart';
import '../utils/size_manager.dart';

Widget customCard({
  context,
  String? title,
  String? image,
  String? publishedAt,
  Function() ? onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Card(
          color: ColorManager.blueDark,
          // margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.z10)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: ColorManager.grey,
                  image: DecorationImage(image: NetworkImage("$image"),fit: BoxFit.cover),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.clamp,
                      colors: [
                        Colors.transparent,
                        ColorManager.blueDark,
                      ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Text(
                    "$title \n $publishedAt",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white, height: 1.3),
                  ),
                ),
              ),
            ],
          )),
    );
