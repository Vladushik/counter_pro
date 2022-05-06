import 'package:counter_pro/core/widgets/big_button.dart';
import 'package:counter_pro/features/counter_simple/presentation/bloc/simple_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleCounterPage extends StatelessWidget {
  const SimpleCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimpleCounterBloc(),
      child: const SimpleCounterView(),
    );
  }
}

class SimpleCounterView extends StatelessWidget {
  const SimpleCounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterPro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<SimpleCounterBloc>().resetCounter();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<SimpleCounterBloc, int>(
                builder: (context, state) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '$state',
                      style: TextStyle(fontSize: 128.sp),
                    ),
                  );
                },
              ),
              SizedBox(height: 32.h),
              Column(
                children: [
                  SizedBox(
                    height: 130.h,
                    width: double.infinity,
                    child: BigButton(
                      text: '+1',
                      onPressed: () {
                        context.read<SimpleCounterBloc>().plusOne();
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    child: BigButton(
                      text: '-1',
                      onPressed: () {
                        context.read<SimpleCounterBloc>().minusOne();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
