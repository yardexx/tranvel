import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainvel/user/cubit/user_cubit.dart';

class IncidentCard extends StatefulWidget {
  const IncidentCard({
    super.key,
  });

  @override
  State<IncidentCard> createState() => _IncidentCardState();
}

class _IncidentCardState extends State<IncidentCard> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<List<String>> incidents = [];

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.watch<UserCubit>().state.user;

    return Card(
      child: Theme(
        data: theme.copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(8),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              incidents.isEmpty
                  ? Icons.check_circle_outline
                  : Icons.cancel_outlined,
              size: 32,
              color: incidents.isEmpty ? Colors.green : Colors.red,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('Trains are on time.',
              style: theme.textTheme.subtitle1,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '${incidents.length} incidents',
              style: theme.textTheme.headline5?.copyWith(
                color: incidents.isEmpty ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: incidents
              .map(
                (incident) => ListTile(
                  title: Text(incident[0]),
                  subtitle: Text(incident[1]),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
