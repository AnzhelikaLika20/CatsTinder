import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/connectivity_cubit.dart';

class ConnectivityListener extends StatefulWidget {
  final Widget child;

  const ConnectivityListener({Key? key, required this.child}) : super(key: key);

  @override
  State<ConnectivityListener> createState() => _ConnectivityListenerState();
}

class _ConnectivityListenerState extends State<ConnectivityListener> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bannerWidth = screenWidth / 4;

    return Stack(
      children: [
        Positioned.fill(child: widget.child),
        BlocBuilder<ConnectivityCubit, ConnectivityStatus>(
          bloc: GetIt.I<ConnectivityCubit>(),
          builder: (context, state) {
            if (state == ConnectivityStatus.offline) {
              return Positioned(
                top: 10,
                left: (screenWidth - bannerWidth) / 2,
                child: Container(
                  width: bannerWidth,
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha((0.5 * 255).toInt()),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((0.3 * 255).toInt()),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'offline mode',
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
