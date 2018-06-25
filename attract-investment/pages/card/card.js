// card.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    card:null,
    checked:false,
    picture:'/statics/images/default.png'
  },

  bindSearch:function(){
    var that = this;
    var user = app.globalData.user;
    var card = that.data.card;
    wx.showModal({
      title: '提示信息',
      content: '是否确认查看？确认后查看次数-1。',
      success:function(res){
        if(res.confirm){
          //OK 
          app.searchCard(user.id,card.id,function(res){
            if(res.code == 0){
              that.setData({
                checked:true
              });
              user.readCount -= 1;
              app.globalData.setData({
                user:user
              });
            }else{
              //res.message
              wx.navigateTo({
                url: '../recharge/recharge'
              });
            }
          });
        }
      }
    });
  },

  callMe:function(){
    var that = this;
    var telephone = that.data.card.telephone.trim();
    if(telephone != null && telephone != ''){
      wx.makePhoneCall({
        phoneNumber: telephone
      });
    }
    
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var id = options.id;
    var that = this;
    var user = app.globalData.user;
    var ctx = app.globalData.ctx;
    app.getCard(id,function(card){
      if(card != null){
        if(card.remark == null) card.remark = "";
        if(card.picture == null || card.picture == ""){
          card.picture = that.data.picture
        }else{
          card.picture = ctx + "/" + card.picture;
        }
        that.setData({
          card:card
        });
        if (card.registerId == user.id) {
          that.setData({
            checked: true
          });
          return;
        }
        app.checkCard(user.id,card.id,function(res){
          //console.log(res);
          if(res.code == 0){
            that.setData({
              checked:true
            });
          }
        });
      }
    });

   
    
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