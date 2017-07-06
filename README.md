# iOSSampleArchitecture
* VC只负责页面布局／数据的显示／渲染
* Model只负责提供数据／数据处理（网络／本地）
* 所有的 Request／Response 应该是一个 Entity
* 所有的网络业务操作应该是一个对应业务类的 Cateogry，例如：User 类，User相关的Category就会有Info／Action／Sync...
* 那么所有的业务 Action 就应该写在对应的 Category