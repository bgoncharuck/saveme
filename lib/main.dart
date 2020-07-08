import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/loading_bloc.dart';
import 'routes.dart';

void main() => runApp(SaveMe());

class SaveMe extends StatefulWidget {
  @override
  _SaveMeState createState() => _SaveMeState();
}

class _SaveMeState extends State<SaveMe> {
  final loadingBloc = LoadingBloc();

  @override
  void initState() {
    super.initState();
    loadingActions(loadingBloc);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder(
        bloc: loadingBloc,
        builder: (BuildContext context, LoadingState state) {
          if (state is LoadingError) return AppError(state.error, "");
          if (state is LoadingSuccess) return AppNormal(noNumbers: false);
          if (state is LoadingNoNumbers) return AppNormal(noNumbers: true);

          return AppLoading();
        },
      );
}
