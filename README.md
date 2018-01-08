# sdl2binding
SDL2 for Ruby

Fiddleのみで実装したSDL2のラッパー・ライブラリーです。
Rubyに標準添付されているFiddleとマルチプラットフォームで動作するSDL2を使用しています。
確認は取れていませんが、RubyとSDL2が動作する環境であればこのコードは動作します。

私はWindows10で開発し動作を確認しました。

使用するにあたって、まずSDL2のライブラリーを準備してください。
次に、SDL2モジュールのdlloadメソッドにSDL2ライブラリーへのパスを与えてください。
この手間を解消する方法を探しています。

将来的に、これはGEMになる予定です。
しかし、Cによる拡張コードを書くつもりはありません。
そのためコールバック関数を要求する関数は呼び出せないままになるでしょう。
（コールバック関数を必要とする関数は削除する予定です）

SDL2は主にゲーム作成のためのライブラリーです。ゲーム以外の用途にも使用できます。
私はRubyにマルチメディアの機能を与えたいためにこのコードを書いています。
もちろん、Rubyと同じようにマルチプラットフォーム、誰の手元でも動くことも望んでいます。
