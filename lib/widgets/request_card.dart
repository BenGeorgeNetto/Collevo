import 'package:collevo/models/request.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final Request request;
  const RequestCard({
    Key? key,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var requestIdSplit = request.requestId.split('_');
    final requestIdSubstring = requestIdSplit[2];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${request.activity} - ${request.activityLevel}'),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Request ID:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  requestIdSubstring,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.black87,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    request.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created at:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '${request.createdAt}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Activity Type:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          request.activityType,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Activity:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          request.activity,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Activity Level:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          request.activityLevel,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Activity ID:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          request.activityId,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
