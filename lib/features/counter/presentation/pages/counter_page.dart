import 'package:counter_pro/core/widgets/big_button.dart';
import 'package:counter_pro/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterPro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<CounterBloc>().resetCounter();
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
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Text('$state', style: const TextStyle(fontSize: 64));
                },
              ),
              const SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigButton(
                    text: '+1',
                    onPressed: () {
                      context.read<CounterBloc>().plusOne();
                    },
                  ),
                  BigButton(
                    text: '-1',
                    onPressed: () {
                      context.read<CounterBloc>().minusOne();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigButton(
                    text: '+10',
                    onPressed: () {
                      context.read<CounterBloc>().plusTen();
                    },
                  ),
                  BigButton(
                    text: '-10',
                    onPressed: () {
                      context.read<CounterBloc>().minusTen();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigButton(
                    text: '+100',
                    onPressed: () {
                      context.read<CounterBloc>().plusHundred();
                    },
                  ),
                  BigButton(
                    text: '-100',
                    onPressed: () {
                      context.read<CounterBloc>().minusHundred();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigButton(
                    text: '+1000',
                    onPressed: () {
                      context.read<CounterBloc>().plusThousand();
                    },
                  ),
                  BigButton(
                    text: '-1000',
                    onPressed: () {
                      context.read<CounterBloc>().minusThousand();
                    },
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
