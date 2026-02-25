import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import 'download_controler.dart';
import 'package:provider/provider.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, });

  // TODO
  // get the icon for the download status
  IconData _downloadIcon(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.notDownloaded:
        return Icons.download;
      case DownloadStatus.downloading:
        return Icons.downloading_outlined;
      case DownloadStatus.downloaded:
        return Icons.folder;
    }
}

  @override
    // TODO

    Widget build(BuildContext context) {
    final DownloadController controller = context.watch<DownloadController>();

    String title = controller.ressource.name;
    String subTitle = controller.status == DownloadStatus.downloading || controller.status == DownloadStatus.downloaded
        ? "${controller.progress * 100} % completed - ${controller.downloadSize} of ${controller.ressource.size}"
        : "";
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: TextStyle(color: AppColors.text)),
        subtitle: Text(subTitle, style: TextStyle(color: AppColors.textLight)),
        trailing: IconButton(
          onPressed: () => controller.startDownload(),
          icon: Icon(_downloadIcon(controller.status), color: AppColors.iconNormal),
        ),
      ),
    );
  }
}
  

