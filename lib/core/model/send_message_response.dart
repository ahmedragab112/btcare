class SendMessageResponse {
  int? id;
  int? chat;
  int? sender;
  String? content;
  String? image;
  String? voice;
  String? cameraCapture;
  String? timestamp;
  bool? isRead;

  SendMessageResponse(
      {this.id,
      this.chat,
      this.sender,
      this.content,
      this.image,
      this.voice,
      this.cameraCapture,
      this.timestamp,
      this.isRead});

  SendMessageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chat = json['chat'];
    sender = json['sender'];
    content = json['content'];
    image = json['image'];
    voice = json['voice'];
    cameraCapture = json['camera_capture'];
    timestamp = json['timestamp'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chat'] = this.chat;
    data['sender'] = this.sender;
    data['content'] = this.content;
    data['image'] = this.image;
    data['voice'] = this.voice;
    data['camera_capture'] = this.cameraCapture;
    data['timestamp'] = this.timestamp;
    data['is_read'] = this.isRead;
    return data;
  }
}
