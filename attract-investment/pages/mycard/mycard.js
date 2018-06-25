// mycard.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    msg: null,
    user: null,
    demands: [
      { name: '融资服务', value: '融资服务', checked: false },
      { name: '生产服务', value: '生产服务', checked: false },
      { name: '区域服务', value: '区域服务', checked: false }
    ],
    stages: [
      { name: '初创期', value: '初创期' },
      { name: '成长期', value: '成长期' },
      { name: '成熟期', value: '成熟期' }
    ],
    sindex:0,
    pindex: -1,
    cindex: -1,
    domains: null,
    parents: null,
    card: null,
    flag:false,
    picture:'/statics/images/default.png',
    disabled:true
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var id = options.id;
    var that = this;
    var ctx = app.globalData.ctx;
    app.getCard(id, function (card) {
      if (card != null) {
        if (card.remark == null) card.remark = "";
        if (card.picture == null || card.picture == "") {
          //card.picture = that.data.picture
        } else {
          that.setData({
            picture: ctx + "/" + card.picture
          });
        }
        that.setData({
          card: card
        });
        if(card.status == 'N'){
          that.setData({
            flag:true
          });
        }

        //stage
        var stages = that.stages;
        for(var i = 0;i<stages.length;i++){
          if(stages[i].name == card.projectStage){
            that.setData({
              sindex:i
            });
            break;
          }
        }

        //demand
        var checkeds = card.demand.split(',');
        var demands = that.data.demands;
        for(var i = 0;i<demands.length;i++){
          for(var j = 0;j<checkeds.length;j++){
            if (demands[i].name == checkeds[j]){
              demands[i].checked = true;
              break;
            }
          }
        }
        that.setData({
          demands:demands
        });
        //domain
        app.getDomainList(function (domains) {
          that.setData({
            parents: domains
          });
          for(var i = 0;i<domains.length;i++){
            if(card.parent == domains[i].name){
              that.setData({
                pindex:i
              });
              break;
            }
          }
          var pindex = that.data.pindex;
          var parentId = that.data.parents[pindex].id;
          
          //获取childs
          wx.request({
            url: ctx + '/phone/domain/childs.json',
            data: { parentId: parentId },
            header: {
              'content-type': 'application/json'
            },
            success: function (res) {
              var childs = res.data.childs;
              that.setData({
                domains: childs
              });
              for(var i = 0;i<childs.length;i++){
                if(card.domain == childs[i].name){
                  that.setData({
                    cindex:i
                  });
                  break;
                }
              }
              
            }
          });

        });

      }
    });


    
    
  },

  getChildList: function (e) {
    var that = this;
    var ctx = app.globalData.ctx;
    var pindex = e.detail.value;
    that.setData({
      pindex: pindex
    });
    var parentId = this.data.parents[pindex].id;
    //获取childs
    wx.request({
      url: ctx + '/phone/domain/childs.json',
      data: { parentId: parentId },
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        var childs = res.data.childs;
        that.setData({
          domains: childs,
          cindex: -1
        });
      }
    });
  },
  getDomain: function (e) {
    var that = this;
    that.setData({
      cindex: e.detail.value
    });
  },

  checkboxChange: function (e) {
    var demands = this.data.demands;
    var values = e.detail.value;
    for (var i = 0, lenI = demands.length; i < lenI; ++i) {
      demands[i].checked = false;

      for (var j = 0, lenJ = values.length; j < lenJ; ++j) {
        if (demands[i].value == values[j]) {
          demands[i].checked = true;
          break;
        }
      }
    }
    this.setData({
      demands: demands
    });
  },

  setStageIndex: function (e) {
    var that = this;
    var sindex = e.detail.value;
    that.setData({
      sindex: sindex
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

  formSubmit:function(e){
    var ctx = app.globalData.ctx;
    var val = e.detail.value;
    console.log(val);
    val.name = val.name.toString().trim();
    val.telephone = val.telephone.toString().trim();
    val.job = val.job.toString().trim();
    val.companyName = val.companyName.toString().trim();
    val.email = val.email.toString().trim();
    val.websize = val.websize.toString().trim();
    val.demand = val.demand.join(',');
    val.projectName = val.projectName.toString().trim();
    val.projectBrief = val.projectBrief.toString().trim();
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
    if (val.job == null || val.job == '') {
      this.setData({
        msg: "职位不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if (val.companyName == null || val.companyName == '') {
      this.setData({
        msg: "公司名称不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if (val.email == null || val.email == '') {
      this.setData({
        msg: "E-mail不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if (!app.checkEmail(val.email)) {
      this.setData({
        msg: "E-mail格式错误"
      });
      this.errorfadeOut();
      return;
    }

    if (val.websize == null || val.websize == '') {
      this.setData({
        msg: "官方网站不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if (val.domainId == null || val.domainId == '') {
      this.setData({
        msg: "相关领域不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if (val.demand == null || val.demand == '') {
      this.setData({
        msg: "所需服务不能为空"
      });
      this.errorfadeOut();
      return;
    }

    if (val.projectName == null || val.projectName == '') {
      this.setData({
        msg: "项目名称不能为空"
      });
      this.errorfadeOut();
      return;
    }

    if (val.projectStage == null || val.projectStage == '') {
      this.setData({
        msg: "项目阶段不能为空"
      });
      this.errorfadeOut();
      return;
    }

    var cindex = this.data.cindex;
    val.domainId = this.data.domains[cindex].id;

    var sindex = this.data.sindex;
    val.projectStage = this.data.stages[sindex].name;

    wx.request({
      url: ctx + '/phone/card/update.json',
      data: val,
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        var data = res.data;
        if (data.code == 0) {
          wx.redirectTo({
            url: '../success/success?url=index'
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

  chooseimage:function(){
    var that = this;
    wx.chooseImage({
      count: 1, // 默认9  
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
      success: function (res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片  
        var picture = res.tempFilePaths[0];
        that.setData({
          picture:picture,
          disabled:false
        });
      }
    });
  },
  upload:function(){
    var that = this;
    that.setData({
      disabled: true
    });
    var ctx = app.globalData.ctx;
    var picture = that.data.picture;
    if (picture.indexOf('default.jpg') == -1) {
      wx.uploadFile({
        url: ctx + '/phone/card/upload.json',
        filePath: picture,
        name: 'file',
        formData: {},
        success: function (res) {
          var data = JSON.parse(res.data);
          var code = data.code;
          if (code == 0) {
            var card = that.data.card;
            card.picture = data.picture;
            that.setData({
              card: card,
              disabled: false
            });
            wx.showToast({
              title: '提交成功',
              icon: 'success',
              duration: 3000
            });
          } else {
            that.setData({
              msg: '名片上传失败，请检查网络连接',
              disabled: false
            });
            that.errorfadeOut();
          }
        }
      });


    } else {
      this.setData({
        msg: '请选择名片'
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