import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/presentation/blocs/qr/qr_bloc.dart';
import 'package:home_module/presentation/widgets/qr_list_item.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';
import 'package:shared_module/widgets/seek_button.dart';

class QrHistorySection extends StatelessWidget {
  const QrHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Text(
                  context.l10nHome.scan_history_label,
                  style: context.theme.textTheme.titleMedium,
                ),
                Expanded(
                  child:
                      state.history.isEmpty
                          ? Center(
                            child: Text(context.l10nHome.no_scan_history_label),
                          )
                          : ListView.builder(
                            itemCount: state.history.length,
                            itemBuilder: (context, index) {
                              final entry = state.history[state.history.length - 1 - index];
                              return QrListItem(entry: entry);
                            },
                          ),
                ),
                if (state.history.isNotEmpty)
                  SeekButton(
                    label: "Clear History",
                    onPressed: () {
                      // Clear QR history
                      context.read<QrBloc>().add(ClearQrHistory());
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
