// mycards.js
var WxSearch = require('../../wxSearch/wxSearch.js');
//获取应用实例
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    cards: [],
    page: 1,
    projectName: '',
    loading: false,
    nomore: false
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
      var oldcards = that.data.cards;
      var page = that.data.page;
      that.setData({
        loading: true,
        nomore: false
      });
      app.getMyCardList(page + 1, that.data.projectName, function (cards) {
        if (cards != null && cards.length > 0) {
          for (var i = 0; i < cards.length; i++) {
            oldcards.push(cards[i]);
          }
          that.setData({
            page: page + 1,
            cards: oldcards,
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

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    //初始化的时候渲染wxSearchdata 第二个为你的search高度
    WxSearch.init(that, 43, []);
    WxSearch.initMindKeys([]);
    //cards初始化
    app.getMyCardList(that.data.page, that.data.projectName, function (cards) {
      if (cards != null && cards.length > 0) {
        that.setData({
          cards: cards
        });
      }else{
        that.setData({
          loading: false,
          nomore: true
        });
      }
      
    });

    //高度计算
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          clientHeight: res.windowHeight - 80
        });
      }
    });

  },

  getCard:function(e){
    var id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../mycard/mycard?id='+id
    })
  },

  searchCard: function (e) {
    var that = this;
    WxSearch.wxSearchAddHisKey(that);
    var value = e.detail.value;
    that.setData({
      page: 1,
      projectName: value
    });
    app.getMyCardList(that.data.page, that.data.projectName, function (cards) {
      that.setData({
        cards: cards
      });
    });
  },
  wxSearchFn: function (e) {
    //搜索事件
    var that = this;
    WxSearch.wxSearchAddHisKey(that);
    console.log(e);
  },
  wxSearchInput: function (e) {
    var that = this
    WxSearch.wxSearchInput(e, that);
  },
  wxSerchFocus: function (e) {
    var that = this
    WxSearch.wxSearchFocus(e, that);
  },
  wxSearchBlur: function (e) {
    var that = this
    WxSearch.wxSearchBlur(e, that);
  },
  wxSearchKeyTap: function (e) {
    var that = this
    WxSearch.wxSearchKeyTap(e, that);
  },
  wxSearchDeleteKey: function (e) {
    var that = this
    WxSearch.wxSearchDeleteKey(e, that);
  },
  wxSearchDeleteAll: function (e) {
    var that = this;
    WxSearch.wxSearchDeleteAll(that);
  },
  wxSearchTap: function (e) {
    var that = this
    WxSearch.wxSearchHiddenPancel(that);
  },

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