  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('97670ef69b8d32bf0fe5a7044e7168a0');
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      channelPublicId: '_xkAFpxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
    });
  //]]>