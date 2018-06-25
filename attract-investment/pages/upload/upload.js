// upload.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    msg:null,
    tempFilePath:'/statics/images/upload.png',
    disabled:false
  },
  
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
  },

  chooseimage: function () {
    var that = this;
    wx.chooseImage({
      count: 1, // 默认9  
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
      success: function (res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片  
        that.setData({
          tempFilePath: res.tempFilePaths[0]
        });

      }
    });
  },
  next:function(){
    //开始上传
    var that = this;
    that.setData({
      disabled:true
    });
    var ctx = app.globalData.ctx;
    var tempFilePath = that.data.tempFilePath;
    if (tempFilePath.indexOf('upload.png') == -1){
      wx.uploadFile({
        url: ctx + '/phone/card/upload.json',
        filePath: tempFilePath,
        name: 'file',
        formData: {},
        success: function (res) {
          var data = JSON.parse(res.data);
          console.log(data);
          var code = data.code;
          if(code == 0){
            var picture = data.picture;
            that.setData({
              disabled: false
            });
            wx.navigateTo({
              url: '../savecard/savecard?picture=' + picture,
            });
          }else{
            that.setData({
              msg: '名片上传失败，请检查网络连接',
              disabled:false
            });
            that.errorfadeOut();
  
          }
         
        }
      });
      
      
    }else{
      this.setData({
        msg: '请选择名片',
        disabled: false
      });
      this.errorfadeOut();
    }

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