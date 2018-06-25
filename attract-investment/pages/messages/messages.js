// messages.js
//获取应用实例
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    messages: [],
    page: 1,
    loading: false,
    nomore: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    app.getMessageList(that.data.page, function (messages) {
      that.setData({
        messages: messages
      });
    });
  },

  pullDownRefresh: function (e) {
    console.log("下拉刷新....");
  },
  pullUpLoad: function (e) {
    console.log("上拉拉加载更多....");
    var that = this;
    var loading = that.data.loading;
    //防止重复加载
    if (!loading) {
      var oldmsgs = that.data.messages;
      var page = that.data.page;
      that.setData({
        loading: true,
        nomore: false
      });
      app.getMessageList(page + 1, function (messages) {
        if (messages != null && messages.length > 0) {
          oldmsgs.concat(messages);
          that.setData({
            page: page + 1,
            messages: oldmsgs,
            loading: false,
            nomore: false
          });
        } else {
          that.setData({
            loading: false,
            nomore: true
          });
        }

      });
    }
  },
  getMessage:function(){},
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})