# ModChat Prototype - Quick Build Guide

## 🎯 Goal

Create an interactive, self-contained Flutter Web prototype of ModChat that demonstrates all key features without requiring Firebase, authentication, or backend services.

---

## 🏗️ Architecture

```
modchat-prototype/
├── lib/
│   ├── main.dart                    # Entry point with mock services
│   ├── models/
│   │   ├── user.dart
│   │   ├── message.dart
│   │   ├── chat.dart
│   │   └── call.dart
│   ├── services/
│   │   ├── mock_auth_service.dart   # Fake authentication
│   │   ├── mock_chat_service.dart   # Fake messages
│   │   └── mock_call_service.dart   # Fake calls
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── login_screen.dart
│   │   ├── chat_list_screen.dart
│   │   ├── chat_screen.dart
│   │   ├── group_chat_screen.dart
│   │   ├── call_screen.dart
│   │   ├── video_call_screen.dart
│   │   ├── profile_screen.dart
│   │   └── settings_screen.dart
│   └── widgets/
│       ├── message_bubble.dart
│       ├── chat_tile.dart
│       └── voice_message_player.dart
└── assets/
    ├── images/
    └── avatars/
```

---

## 📋 Step-by-Step Build Process

### Phase 1: Setup (15 minutes)

```bash
# 1. Create new Flutter project
flutter create modchat_prototype
cd modchat_prototype

# 2. Update pubspec.yaml
```

```yaml
name: modchat_prototype
description: Interactive ModChat demonstration prototype

dependencies:
  flutter:
    sdk: flutter
  intl: ^0.18.0              # Date formatting
  cached_network_image: ^3.3.0   # Avatar images
  flutter_svg: ^2.0.9         # Icons
  provider: ^6.1.1            # State management (lightweight)

flutter:
  assets:
    - assets/images/
    - assets/avatars/
  
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
```

```bash
# 3. Get dependencies
flutter pub get
```

---

### Phase 2: Data Models (30 minutes)

#### `lib/models/user.dart`

```dart
class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final bool isOnline;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    this.isOnline = false,
    this.status = 'Hey there! I am using ModChat',
  });
}
```

#### `lib/models/message.dart`

```dart
enum MessageType { text, voice, image, video, system }

class Message {
  final String id;
  final String chatId;
  final String senderId;
  final String senderName;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isRead;
  final bool isModerated;  // For AI moderation demo
  final List<String> reactions;

  Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.senderName,
    required this.content,
    this.type = MessageType.text,
    required this.timestamp,
    this.isRead = false,
    this.isModerated = false,
    this.reactions = const [],
  });
}
```

#### `lib/models/chat.dart`

```dart
class Chat {
  final String id;
  final String name;
  final String? avatar;
  final bool isGroup;
  final List<String> participantIds;
  final Message? lastMessage;
  final int unreadCount;
  final bool isMuted;
  final bool isPinned;

  Chat({
    required this.id,
    required this.name,
    this.avatar,
    this.isGroup = false,
    required this.participantIds,
    this.lastMessage,
    this.unreadCount = 0,
    this.isMuted = false,
    this.isPinned = false,
  });
}
```

---

### Phase 3: Mock Services (1 hour)

#### `lib/services/mock_data.dart`

```dart
import '../models/user.dart';
import '../models/message.dart';
import '../models/chat.dart';

class MockData {
  static final currentUser = User(
    id: 'user_1',
    name: 'You',
    email: 'you@modchat.app',
    avatar: 'https://i.pravatar.cc/150?img=1',
    isOnline: true,
  );

  static final users = [
    User(
      id: 'user_2',
      name: 'Alice Johnson',
      email: 'alice@example.com',
      avatar: 'https://i.pravatar.cc/150?img=2',
      isOnline: true,
      status: 'Working on a new project 🚀',
    ),
    User(
      id: 'user_3',
      name: 'Bob Smith',
      email: 'bob@example.com',
      avatar: 'https://i.pravatar.cc/150?img=3',
      isOnline: false,
      status: 'Busy | Do not disturb',
    ),
    User(
      id: 'user_4',
      name: 'Carol White',
      email: 'carol@example.com',
      avatar: 'https://i.pravatar.cc/150?img=4',
      isOnline: true,
    ),
    // Add 5-10 more sample users
  ];

  static List<Chat> getChats() {
    return [
      Chat(
        id: 'chat_1',
        name: 'Alice Johnson',
        avatar: users[0].avatar,
        participantIds: ['user_1', 'user_2'],
        lastMessage: Message(
          id: 'msg_1',
          chatId: 'chat_1',
          senderId: 'user_2',
          senderName: 'Alice Johnson',
          content: 'Hey! How are you doing?',
          timestamp: DateTime.now().subtract(Duration(minutes: 5)),
          isRead: false,
        ),
        unreadCount: 2,
        isPinned: true,
      ),
      Chat(
        id: 'chat_2',
        name: 'Bob Smith',
        avatar: users[1].avatar,
        participantIds: ['user_1', 'user_3'],
        lastMessage: Message(
          id: 'msg_2',
          chatId: 'chat_2',
          senderId: 'user_1',
          senderName: 'You',
          content: 'See you tomorrow!',
          timestamp: DateTime.now().subtract(Duration(hours: 2)),
          isRead: true,
        ),
        unreadCount: 0,
      ),
      Chat(
        id: 'chat_3',
        name: 'Team Flutter 🚀',
        isGroup: true,
        participantIds: ['user_1', 'user_2', 'user_3', 'user_4'],
        lastMessage: Message(
          id: 'msg_3',
          chatId: 'chat_3',
          senderId: 'user_4',
          senderName: 'Carol White',
          content: 'Anyone up for a call?',
          timestamp: DateTime.now().subtract(Duration(minutes: 30)),
          isRead: true,
        ),
        unreadCount: 5,
      ),
      // Add more chats
    ];
  }

  static List<Message> getMessages(String chatId) {
    return [
      Message(
        id: 'msg_${chatId}_1',
        chatId: chatId,
        senderId: 'user_2',
        senderName: 'Alice Johnson',
        content: 'Hey! How are you?',
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
        isRead: true,
      ),
      Message(
        id: 'msg_${chatId}_2',
        chatId: chatId,
        senderId: 'user_1',
        senderName: 'You',
        content: 'I\'m good! Working on the ModChat prototype',
        timestamp: DateTime.now().subtract(Duration(hours: 2, minutes: 30)),
        isRead: true,
      ),
      Message(
        id: 'msg_${chatId}_3',
        chatId: chatId,
        senderId: 'user_2',
        senderName: 'Alice Johnson',
        content: 'That sounds exciting! Need any help?',
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
        isRead: true,
      ),
      Message(
        id: 'msg_${chatId}_4',
        chatId: chatId,
        senderId: 'user_1',
        senderName: 'You',
        content: 'Thanks! I\'m making good progress 🎉',
        timestamp: DateTime.now().subtract(Duration(minutes: 45)),
        isRead: true,
      ),
      Message(
        id: 'msg_${chatId}_5',
        chatId: chatId,
        senderId: 'user_2',
        senderName: 'Alice Johnson',
        content: 'Hey! How are you doing?',
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
        isRead: false,
      ),
      // Add 10-15 more messages for realistic scroll
    ];
  }
}
```

#### `lib/services/mock_chat_service.dart`

```dart
import 'dart:async';
import '../models/message.dart';
import '../models/chat.dart';
import 'mock_data.dart';

class MockChatService {
  final _messagesController = StreamController<List<Message>>.broadcast();
  final _chatsController = StreamController<List<Chat>>.broadcast();
  
  List<Message> _messages = [];
  List<Chat> _chats = [];

  MockChatService() {
    _chats = MockData.getChats();
    _chatsController.add(_chats);
  }

  Stream<List<Chat>> getChats() {
    return _chatsController.stream;
  }

  Stream<List<Message>> getMessages(String chatId) async* {
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network
    _messages = MockData.getMessages(chatId);
    yield _messages;
    
    // Simulate new message after 3 seconds
    await Future.delayed(Duration(seconds: 3));
    _messages.add(Message(
      id: 'msg_new_${DateTime.now().millisecondsSinceEpoch}',
      chatId: chatId,
      senderId: 'user_2',
      senderName: 'Alice Johnson',
      content: 'This is a simulated new message!',
      timestamp: DateTime.now(),
      isRead: false,
    ));
    yield _messages;
  }

  Future<void> sendMessage(String chatId, String content) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate send delay
    
    _messages.add(Message(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      chatId: chatId,
      senderId: 'user_1',
      senderName: 'You',
      content: content,
      timestamp: DateTime.now(),
      isRead: true,
    ));
    
    _messagesController.add(_messages);
  }

  void dispose() {
    _messagesController.close();
    _chatsController.close();
  }
}
```

---

### Phase 4: Core Screens (3-4 hours)

#### `lib/screens/splash_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    
    _controller.forward();
    
    // Navigate after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your ModChat logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF6366F1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.chat, size: 60, color: Colors.white),
              ),
              SizedBox(height: 24),
              Text(
                'ModChat',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Secure messaging, reimagined',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

#### `lib/screens/login_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'chat_list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'demo@modchat.app');
  final _passwordController = TextEditingController(text: 'password123');
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() => _isLoading = true);
    
    // Simulate login delay
    await Future.delayed(Duration(seconds: 1));
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => ChatListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Icon(Icons.chat, size: 80, color: Color(0xFF6366F1)),
              SizedBox(height: 16),
              Text(
                'Welcome to ModChat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 48),
              
              // Email field
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Color(0xFF1A1F3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              
              // Password field
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Color(0xFF1A1F3A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              
              // Login button
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6366F1),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
              SizedBox(height: 16),
              
              Text(
                'Demo credentials pre-filled',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

#### `lib/screens/chat_list_screen.dart`

```dart
import 'package:flutter/material.dart';
import '../models/chat.dart';
import '../services/mock_data.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chats = MockData.getChats();

    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F3A),
        title: Text('ModChat', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {/* Search functionality */},
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(MockData.currentUser.avatar),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return _ChatTile(chat: chat);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6366F1),
        onPressed: () {/* New chat */},
        child: Icon(Icons.edit),
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  final Chat chat;
  
  const _ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(chat: chat),
          ),
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: chat.avatar != null
                ? NetworkImage(chat.avatar!)
                : null,
            child: chat.avatar == null
                ? Icon(chat.isGroup ? Icons.group : Icons.person)
                : null,
          ),
          if (chat.unreadCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFF6366F1),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  chat.unreadCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        chat.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: chat.unreadCount > 0 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        chat.lastMessage?.content ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: chat.unreadCount > 0 ? Colors.white70 : Colors.white54,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            _formatTime(chat.lastMessage?.timestamp),
            style: TextStyle(
              color: chat.unreadCount > 0 ? Color(0xFF6366F1) : Colors.white54,
              fontSize: 12,
            ),
          ),
          if (chat.isPinned)
            Icon(Icons.push_pin, size: 16, color: Colors.white54),
        ],
      ),
    );
  }

  String _formatTime(DateTime? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final diff = now.difference(time);
    
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${diff.inDays}d';
  }
}
```

**Continue with:**
- `chat_screen.dart` (message list + input)
- `call_screen.dart` (voice call UI)
- `video_call_screen.dart` (video call UI)
- `profile_screen.dart`
- `settings_screen.dart`

---

### Phase 5: Build & Bundle (30 minutes)

```bash
# 1. Build for web
flutter build web --release --web-renderer html

# 2. Test locally
flutter run -d chrome

# 3. Bundle into single HTML (choose method):

# Option A: Using single-file CLI
npm install -g single-file-cli
single-file build/web/index.html modchat.html

# Option B: Manual copy (temporary testing)
# Just copy build/web folder contents

# 4. Copy to portfolio
cp modchat.html ../polymorphism-main/web/prototypes/
```

---

### Phase 6: Integrate into Portfolio (10 minutes)

Edit `polymorphism-main/lib/data/portfolio_data.dart`:

```dart
const Project(
  id: 'modchat',
  name: 'ModChat',
  // ... existing fields ...
  prototypeUrl: 'prototypes/modchat.html',  // 👈 Add this line
  isFeatured: true,
)
```

Test:
```bash
cd ../polymorphism-main
flutter run -d chrome
# Navigate to ModChat → Click "Launch live prototype"
```

---

## 🎨 Design Tips

### Colors
```dart
// lib/theme/colors.dart
class ModChatColors {
  static const background = Color(0xFF0A0E27);
  static const surface = Color(0xFF1A1F3A);
  static const primary = Color(0xFF6366F1);
  static const accent = Color(0xFF8B5CF6);
  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFFB8B8B8);
}
```

### Animations
```dart
// Smooth page transitions
PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => NextScreen(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0.1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        )),
        child: child,
      ),
    );
  },
)
```

---

## ✅ Final Checklist

- [ ] Splash screen with logo animation
- [ ] Login screen (pre-filled credentials)
- [ ] Chat list with 8+ sample chats
- [ ] Individual chat with scrollable messages
- [ ] Message input with send button
- [ ] Voice call screen with timer
- [ ] Video call screen with controls
- [ ] Profile screen
- [ ] Settings screen
- [ ] Smooth transitions between screens
- [ ] Realistic timestamps
- [ ] Unread count badges
- [ ] Online/offline indicators
- [ ] Dark theme throughout
- [ ] Responsive to screen size
- [ ] No console errors
- [ ] Builds successfully for web
- [ ] Bundles into single HTML
- [ ] Works in portfolio iframe
- [ ] Tested on desktop and mobile viewport

---

## 🚀 Estimated Timeline

- **Setup**: 15 min
- **Models**: 30 min
- **Mock services**: 1 hour
- **Splash + Login**: 30 min
- **Chat list**: 1 hour
- **Chat screen**: 2 hours
- **Call screens**: 1 hour
- **Profile + Settings**: 1 hour
- **Polish + animations**: 1 hour
- **Build + bundle**: 30 min
- **Integration**: 10 min

**Total**: 8-9 hours of focused work

---

## 💡 Pro Tips

1. **Don't overthink it** - This is a demo, not production
2. **Reuse widgets** - Build once, use everywhere
3. **Focus on visuals** - Make it look real
4. **Add delays** - `Future.delayed()` makes interactions feel authentic
5. **Use placeholders** - https://i.pravatar.cc for avatars
6. **Test often** - Run on web frequently
7. **Keep it simple** - Fewer features, better polish

---

**Ready to build? Start with Phase 1 and work through sequentially. You've got this! 🚀**
