# export_zip

## Feature

- Redmineのチケット情報をCSVでダウンロードする既存の機能に加えて、CSVに履歴情報の記述追加と、チケット毎の添付ファイルをファルダ毎にまとめてダウンロードできるようにしました。  
In addition to the existing function of downloading ticket information of Redmine in CSV format, added description of history information to CSV, and attached file for each ticket can be downloaded collectively by folder.

## Introduction Method

- Redmineのルートディレクトリ内にあるpluginsディレクトリの階層でこのリポジトリをクローンします。  
  Clone this repository in the hierarchy of plugins directory in Redmine's root directory.
  ```
  cd [Redmine_root_directory]/plugins
  git clone https://github.com/tomimoto-yusuke-fixer/export_zip.git
  ```
- 次に、Redmineのルートディレクトリに移動して必要なパッケージをインストールします。  
  Next, move to the root directory of Redmine and install the necessary packages.
  ```
  cd ..
  bundle
  ```
- 問題なくインストールが完了したら、Redmineを再起動させて下さい。以上で導入は終了です。  
  If installation is complete without problems, please restart Redmine. This is the end of the introduction.
  
## How To Use

- 導入しただけでは、表示されません。  
　表示するために、管理者権限をもったユーザーでログインします。  
  管理者ユーザーの場合のみ表示されているメニューバーの`管理`からRedmineの管理画面を開きます。
  ![image](https://user-images.githubusercontent.com/49511424/62345879-ecf34600-b52e-11e9-874b-df4ae868ed59.png)
  
- 管理画面で`ロールと権限`を選択します。  
  ![image](https://user-images.githubusercontent.com/49511424/62346285-87a05480-b530-11e9-8f5f-7cafa9c550b1.png)  
  次にこのPluginを使用するユーザーのロールを選択します。  
  ![image](https://user-images.githubusercontent.com/49511424/62346555-87548900-b531-11e9-9255-ac160b9bf2f9.png)  
  `権限 > プロジェクト`の中にある`Export zip`のチェックボックスにチェックを入れます。  
  ![image](https://user-images.githubusercontent.com/49511424/62437993-75b4f080-b780-11e9-8367-1388dc2928e6.png)
  変更を保存して、ダウンロードしたいプロジェクトのチケット一覧のページへ行くと右下にPluginが表示されます。  
  ![image](https://user-images.githubusercontent.com/49511424/62346199-2f695280-b530-11e9-9f4d-1477d9d28e5b.png)  
  `zipファイル出力`をクリックし、`エクスポート`をクリックするとダウンロードが始まります。
  ![image](https://user-images.githubusercontent.com/49511424/62440789-91be8f00-b78c-11e9-8b2a-4865b3b5d313.png)
