class SendMessageBody {
  String? chat;
  String? content;

  SendMessageBody({this.chat, this.content});

  SendMessageBody.fromJson(Map<String, dynamic> json) {
    chat = json['chat'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat'] = chat;
    data['content'] = content;
    return data;
  }
}
