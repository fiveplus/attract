// cards.js
var WxSearch = require('../../wxSearch/wxSearch.js');
//获取应用实例
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    pcards:[
      { cards: [], page: 1, projectName:'',loading:false,nomore:false },
      { cards: [], page: 1, projectName: '', loading: false, nomore: false },
      { cards: [], page: 1, projectName: '', loading: false, nomore: false },
      { cards: [], page: 1, projectName: '', loading: false, nomore: false },
      { cards: [], page: 1, projectName: '', loading: false, nomore: false }
    ],
    // tab切换
    currentTab: 0,
    parentId:null,
    tabs: [
      { id: null, name: "全部" },
      { id: 1, name: "药物" },
      { id: 6, name: "医疗器械" },
      { id: 9, name: "移动医疗" },
      { id: 11, name: "其他类别" }
    ]
  },
  switchNav:function(e){
    var that = this;
    var tabs = that.data.tabs;
    if(that.data.currentTab == e.target.dataset.current){
      return false;
    }else{
      var pcards = that.data.pcards;
      that.setData({
        currentTab:e.target.dataset.current,
        parentId: tabs[e.target.dataset.current].id
      });
      that.initCards();
    }
  },
  swiperChange:function(e){
    var that = this;
    var tabs = that.data.tabs;
    that.setData({
      currentTab:e.detail.current,
      parentId: tabs[e.detail.current].id
    });
    that.initCards();
  },

  getCard : function(e){
    var id = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../card/card?id='+id,
    })
  },
  pullDownRefresh:function(e){
    var parentId = e.currentTarget.dataset.parentid;
    console.log("下拉刷新....:"+parentId);
  },
  pullUpLoad:function(e){
    console.log("上拉拉加载更多....");
    var that = this;
    var currentTab = that.data.currentTab;
    var loading = that.data.pcards[currentTab].loading;
    //防止重复加载
    if (!loading) {
      var oldcards = that.data.pcards[currentTab].cards;
      var page = that.data.pcards[currentTab].page;
      var pcards = that.data.pcards;
      pcards[currentTab].loading = true;
      pcards[currentTab].nomore = false;
      that.setData({
        pcards:pcards
      });
      var parentId = that.data.parentId;
      var projectName = that.data.pcards[currentTab].projectName;
      app.getCardList(page + 1, parentId, projectName, function (cards) {
        if(cards != null && cards.length > 0){
          for(var i = 0;i<cards.length;i++){
            oldcards.push(cards[i]);
          }
          var pcards = that.data.pcards;
          pcards[currentTab].page = page + 1;
          pcards[currentTab].cards = oldcards;
          pcards[currentTab].loading = false;
          pcards[currentTab].nomore = false;
          that.setData({
            pcards:pcards
          });
        }else{
          var pcards = that.data.pcards;
          pcards[currentTab].loading = false;
          pcards[currentTab].nomore = true;
          that.setData({
            pcards:pcards
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

    that.initCards();

    //高度计算
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          clientHeight: res.windowHeight - 80
        });
      }
    });

  },
  initCards:function(){
    var that = this;
    var currentTab = that.data.currentTab;
    var length = that.data.pcards[currentTab].cards.length;
    if (length > 0) {
      return;
    }
    var page = that.data.pcards[currentTab].page;
    var parentId = that.data.tabs[currentTab].id;
    var projectName = that.data.pcards[currentTab].projectName;
    //cards初始化
    app.getCardList(page, parentId, projectName, function (cards) {
      var pcards = that.data.pcards;
      pcards[currentTab].cards = cards;
      that.setData({
        pcards: pcards
      });
    });
  },
  searchCard:function(e){
    var that = this;
    WxSearch.wxSearchAddHisKey(that);
    var value = e.detail.value;
    var parentId = that.data.parentId;
    var currentTab = that.data.currentTab;
   
    app.getCardList(1, parentId, value, function (cards) {
      var pcards = that.data.pcards;
      pcards[currentTab].page = 1;
      pcards[currentTab].projectName = value;
      pcards[currentTab].cards = cards;
      that.setData({
        pcards
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