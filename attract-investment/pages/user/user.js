// user.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    user:null
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    var userId = options.userId;
    app.getUserToId(userId,function(user){
      that.setData({
        user:user
      });
    });
  },
  formSubmit: function (e) {
    var val = e.detail.value;
    if (val.name == null || val.name == '') {
      this.setData({
        msg: "姓名不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if (val.telephone == null || val.telephone == '') {
      this.setData({
        msg: "联系电话不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if (!app.checkMobile(val.telephone)) {
      this.setData({
        msg: "联系电话格式错误"
      });
      this.errorfadeOut();
      return;
    }
    if (val.park == null || val.park == '') {
      this.setData({
        msg: "所属园区不能为空"
      });
      this.errorfadeOut();
      return;
    }
    wx.request({
      url: 'https://attract.bridgebiomed.com/phone/register/update.json',
      data: val,
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        var data = res.data;
        if (data.code == 0) {
          wx.redirectTo({
            url: '../success/success?url=index',
          });
        } else {
          this.setData({
            msg: data.message
          });
          this.errorfadeOut();
        }
      }
    });


  },
  errorfadeOut: function () {
    var fadeOutTimeout = setTimeout(() => {
      this.setData({
        msg: ""
      });
      clearTimeout(fadeOutTimeout);
    }, 3000);
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