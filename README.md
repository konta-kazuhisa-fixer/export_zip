# export_zip

## Feature

- このプラグインは既存のCSVダウンロード機能に履歴情報の記述追加と、チケット毎の添付ファイルをフォルダ毎にまとめてダウンロードする機能を追加したものです。  
This plug-in is a function that adds the description of history information to the existing CSV download function and the function to download the attached files for each ticket in a folder.

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

### 再起動のやり方(CentOS限定)

- Redmineのルートディレクトリから以下の操作をしていきます。  
  `tmp`ディレクトリに移動します。この階層で`restart.txt`という名前で空のテキストファイルを作成します。
  ```
  cd tmp
  touch restart.txt
  ```
  空の`restsart.txt`ファイルをトリガーにRedmineが再起動されるので、作成後にRedmineに再アクセスしてください。
  これで再起動が行われます。
  
## How To Use

- 導入しただけでは、表示されません。  
　表示するために、Redmineの管理者権限をもったユーザーでログインします。  
  管理者ユーザーの場合のみ表示されているメニューバーの`管理`からRedmineの管理画面を開きます。  
  It is not displayed just by introducing it.  
  Log in as a user with administrator privileges to view.  
  Open the Redmine management screen from the menu bar `Administration` which is displayed only for the admin user.  
  ![image](https://user-images.githubusercontent.com/49511424/62345879-ecf34600-b52e-11e9-874b-df4ae868ed59.png)
  
- 管理画面で`ロールと権限`を選択します。  
  Select `Role and Privilege` on the administration screen.  
  ![image](https://user-images.githubusercontent.com/49511424/62346285-87a05480-b530-11e9-8f5f-7cafa9c550b1.png)  
- 次にこのPluginを使用するユーザーのロールを選択します。  
  Then select the role of the user using this plugin.  
  ![image](https://user-images.githubusercontent.com/49511424/62346555-87548900-b531-11e9-9255-ac160b9bf2f9.png)  
- `権限 > プロジェクト`の中にある`Export zip`のチェックボックスにチェックを入れます。  
  Check the checkbox of `Export zip` in` Permission> Project`.  
  ![image](https://user-images.githubusercontent.com/49511424/62437993-75b4f080-b780-11e9-8367-1388dc2928e6.png)
- 変更を保存して、ダウンロードしたいプロジェクトのチケット一覧のページへ行くと右下にPluginが表示されます。  
  Save changes and go to the ticket list page for the project you want to download.  
  ![image](https://user-images.githubusercontent.com/49511424/62346199-2f695280-b530-11e9-9f4d-1477d9d28e5b.png)  
- `zipファイル出力`をクリックし、`エクスポート`をクリックするとダウンロードが始まります。  
  Click `zip file output` and click` Export` to start downloading.  
  ![image](https://user-images.githubusercontent.com/49511424/62440789-91be8f00-b78c-11e9-8b2a-4865b3b5d313.png)

## Example

- 例えば、以下のようなチケットの情報をダウンロードするとします。  
  `test2` `test3` `test_child2`が添付ファイルのあるチケットです。  
  For example, suppose you download the following ticket information:  
  `test2` ` test3` `test_child2` is a ticket with an attached file.  
  ![image](https://user-images.githubusercontent.com/49511424/62679427-6687aa00-b9ef-11e9-837f-97d2a3f358dc.png)  

- ダウンロードしたzipファイル内は以下のようになっています。  
  チケット毎にフォルダ分けされ、その中に履歴付きのチケットのcsvファイルと添付ファイルがあるチケットのフォルダには添付ファイルが入っています。  
  また、ダウンロードしたzipファイルの直下には全チケットの履歴付き詳細csvがあります。  
  The downloaded zip file is as follows.  
  Each ticket is divided into folders, and in the ticket folder there is a csv file and attached file of the ticket with history.  
  In addition, there is a detailed csv with history of all tickets directly under the downloaded zip file.  
  ![image](https://user-images.githubusercontent.com/49511424/62680856-33dfb080-b9f3-11e9-8336-797c79d20313.png)  
    ```
    10-4.zip/
       ├ total_issue.csv
       ├ [4]test1/
       │　   └ issue.csv
       ├ [5]test2/
       │　   ├ [5]190802141416_14bf74ff8036099e3c358bbf4e4f9cbe.txt
       │　   ├ [5]190802141416_77bc4b7cbce851f69fad073c9864561f.txt
       │　   ├ [5]190802141416_754e8177c3f7dd99f7ec0f475b191494.txt
       │　   ├ [5]190802141416_62053ae95d6e3092021809169fb36f38.txt
       │　   └ issue.csv
       ├ [6]test3/
       │　   ├ [6]190808151044_14bf74ff8036099e3c358bbf4e4f9cbe.txt
       │　   ├ [6]190808151044_77bc4b7cbce851f69fad073c9864561f.txt
       │　   └ issue.csv
       ├ [7]test_child/
       │　   └ issue.csv
       ├ [8]test_child2/
       │　   ├ [8]190808151200_7a426066492a2b39c0963f7f06a107d3.xls
       │　   └ issue.csv
       ├ [9]test4/
       │　   └ issue.csv
       └[10]test5/
            └ issue.csv
    ```
    
## How to delete

- このプラグインを削除する手段は、git cloneしてきたフォルダをすべて消すことです。  
  Redmineのルートディレクトリから以下の操作を行います。  
  プラグインのフォルダが存在するディレクトリに移動します。  
  `export_zip`という名前のディレクトリをディレクトリ丸ごと削除します。
  ```
  cd plugins
  rm -rf export_zip
  ```
  削除した後Redmineを再起動してPluginが表示されないことを確認してください。
