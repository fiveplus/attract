//index.js
//获取应用实例
var app = getApp();
Page({
  data: {
    motto: '欢迎回来...',
    userInfo: {},
    user:null
  },
  bindViewTap:function(){
    var that = this;
    app.getUser(function (user) {
      if(user != null){
        that.setData({
          user: user
        });
      }
    });
  },
  bindUserTap:function(){
    var that = this;
    /* 
    var id = app.globalData.user.id;
    wx.navigateTo({
      url: '../user/user?userId='+id
    });
    */
    wx.navigateTo({
      url: '../me/me'
    });
  },
  /*
  bindMessageTap:function(){
    var that = this;
    wx.navigateTo({
      url: '../messages/messages'
    });
  },
   */
  //事件处理函数
  saveCard: function() {
    wx.navigateTo({
      url: '../upload/upload'
    })
  },
  getCardList:function(){
    wx.navigateTo({
      url: '../cards/cards'
    });
  },
  getMyCardList:function(){
    wx.navigateTo({
      url: '../mycards/mycards'
    });
  },
  getHistoryList:function(){
    wx.navigateTo({
      url: '../historys/historys'
    });
  },
  onLoad: function () {
    console.log('onLoad');
    var that = this;
    //微信数据
    app.getUserInfo(function (userInfo) {
      //更新数据
      that.setData({
        userInfo: userInfo
      });
    });
    //用户数据
    app.getUser(function(user){
      if(user == null){
        wx.redirectTo({
          url: '../register/register'
        });
      }else{
        that.setData({
          user:user
        });
      }
    });
    
    
  }
});
