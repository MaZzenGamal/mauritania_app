import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/Features/register/presentation/controller/documents_cubit/documents_cubit.dart';
import 'package:mauritania/Features/register/presentation/views/widgets/upload_documents_screen_body.dart';

class UploadDocumentsScreen extends StatelessWidget {
  const UploadDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DocumentsCubit(),
      child: Scaffold(
        body: UploadDocumentsScreenBody(),
      ),
    );
  }
}
