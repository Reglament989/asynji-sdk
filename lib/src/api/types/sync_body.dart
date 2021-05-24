class SyncBody {
  late final List<RoomUpdate> roomUpdates;
  late final List<UserUpdate> userUpdates;

  SyncBody(this.roomUpdates, this.userUpdates);

  factory SyncBody.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> roomu = json['room_updates'];
    final List<Map<String, dynamic>> useru = json['user_updates'];
    final roomUpdates = <RoomUpdate>[];
    final userUpdates = <UserUpdate>[];
    roomu.forEach((element) {
      roomUpdates.add(RoomUpdate.fromJson(element));
    });
    useru.forEach((element) {
      userUpdates.add(UserUpdate.fromJson(element));
    });
    return SyncBody(roomUpdates, userUpdates);
  }
}

class Media {
  late final String url;
  Media(this.url);
}

class RoomUpdate {
  late final String from;
  late final String body;
  late final String forward;
  late final String reply;
  late final Media media;

  RoomUpdate(this.from, this.body, this.forward, this.reply, String mediaUrl) {
    media = Media(mediaUrl);
  }

  factory RoomUpdate.fromJson(Map<String, dynamic> json) {
    return RoomUpdate(
        json['from'] as String,
        json['body'] as String,
        json['forward'] as String,
        json['reply'] as String,
        json['media']['url'] as String);
  }
}

class Invite {
  late final String from;
  late final String to;
  late final String when;
  late final String inviteId;

  Invite(this.from, this.to, this.when, this.inviteId);
}

class UserUpdate {
  late final Invite invite;
  UserUpdate(this.invite);
  factory UserUpdate.fromJson(Map<String, dynamic> json) {
    return UserUpdate(Invite(json['from'] as String, json['to'] as String,
        json['when'] as String, json['inviteId'] as String));
  }
}
