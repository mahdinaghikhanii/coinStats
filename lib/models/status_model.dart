class StatusModel {
  final String timestamp;
  final int errorcode;
  final String errormessage;
  final int elapsed;
  final int creditcount;
  final String notice;
  final int fotalcount;

  StatusModel(
    this.timestamp,
    this.errorcode,
    this.errormessage,
    this.elapsed,
    this.creditcount,
    this.notice,
    this.fotalcount,
  );
}
