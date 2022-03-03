class StatusModel {
  final String timestamp;
  final int errorCode;
  final String errorMessage;
  final int elapsed;
  final int creditCount;
  final String notice;
  final int totalCount;

  StatusModel(this.timestamp, this.errorCode, this.errorMessage, this.elapsed,
      this.creditCount, this.notice, this.totalCount);
  StatusModel.fromJson(Map<String, dynamic> json)
      : timestamp = json["timestamp"] ?? "",
        errorCode = json["error_code"] ?? 0,
        errorMessage = json["error_message"] ?? "",
        elapsed = json["elapsed"] ?? 0,
        creditCount = json["credit_count"] ?? 0,
        notice = json["notice"] ?? "",
        totalCount = json["total_count"] ?? 0;
}
