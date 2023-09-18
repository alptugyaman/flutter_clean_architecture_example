import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/usecases/vcs_usecase.dart';
import 'package:flutter_clean_architecture/src/features/vcs/presentation/cubits/get_vc/get_vc_data_cubit.dart';
import 'package:flutter_clean_architecture/src/features/vcs/presentation/widgets/portfolio_widget.dart';
import 'package:flutter_clean_architecture/src/injector.dart';

@RoutePage()
class VcView extends StatelessWidget {
  const VcView({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetVcDataCubit(injector<VcsUsecase>()),
      child: _VcView(id: id),
    );
  }
}

class _VcView extends StatefulWidget {
  const _VcView({required this.id});

  final String id;

  @override
  State<_VcView> createState() => __VcViewState();
}

class __VcViewState extends State<_VcView> {
  String get vcId => widget.id;

  @override
  void initState() {
    super.initState();
    context.read<GetVcDataCubit>().getVc(id: vcId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.a16zPortfolio,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<GetVcDataCubit, GetVcDataState>(
        builder: (context, state) {
          if (state is GetVcDataSuccess) {
            return PortfolioWidget(state: state);
          } else if (state is GetVcDataEmpty) {
            return Center(child: Text(context.l10n.emptyList));
          } else if (state is GetVcDataError) {
            return Center(child: Text(state.errorMessage));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
