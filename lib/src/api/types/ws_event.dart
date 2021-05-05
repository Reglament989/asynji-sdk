enum EventActions {
  update,
  delete,
  insert,
}

enum EventSubject {
  room,
  user,
}

class Event {
  late final EventActions action;
  late final EventSubject subject;
  late final String rawBody;
  late final bool isBodyEncrypted;

  Event(this.action, this.subject, this.rawBody, this.isBodyEncrypted);

  factory Event.fromJson(Map<String, dynamic> json) {
    EventActions action;
    EventSubject subject;
    switch (json['action'] as int) {
      case 1:
        action = EventActions.update;
        break;
      case 2:
        action = EventActions.delete;
        break;
      case 3:
        action = EventActions.insert;
        break;
      default:
        throw Exception('Unknow type of event action event -> ${json["id"]}');
    }
    switch (json['subject'] as int) {
      case 1:
        subject = EventSubject.room;
        break;
      case 2:
        subject = EventSubject.user;
        break;
      default:
        throw Exception('Unknow type of event subject event -> ${json["id"]}');
    }
    return Event(action, subject, json['body'] as String,
        json['isBodyEncrypted'] as bool);
  }
}
