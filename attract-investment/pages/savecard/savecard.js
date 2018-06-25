// savecard.js
var app = getApp();
Page({
  /**
   * 页面的初始数据
   */
  data: {
    msg:null,
    user:null,
    demands:[
      { name: '融资服务', value:'融资服务',checked:false},
      { name: '生产服务', value:'生产服务',checked:false},
      { name: '区域服务', value: '区域服务', checked: false}
    ],
    stages:[
      { name: '初创期', value:'初创期'},
      { name: '成长期', value:'成长期'},
      { name: '成熟期', value:'成熟期'}
    ],
    pindex:-1,
    cindex:-1,
    sindex:0,
    domains:null,
    parents:null,
    tempFilePath:null
  },
  checkboxChange:function(e){
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
  formSubmit:function(e){
    var ctx = app.globalData.ctx;
    var val = e.detail.value;
    val.name = val.name.toString().trim();
    val.telephone = val.telephone.toString().trim();
    val.job = val.job.toString().trim();
    val.companyName = val.companyName.toString().trim();
    val.email = val.email.toString().trim();
    val.websize = val.websize.toString().trim();
    val.demand = val.demand.join(',');
    val.projectName = val.projectName.toString().trim();
    val.projectBrief = val.projectBrief.toString().trim();

    if(val.name == null || val.name == ''){
      this.setData({
        msg : "姓名不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if(val.telephone == null || val.telephone == ''){
      this.setData({
        msg: "联系电话不能为空"
      });
      this.errorfadeOut();
      return;
    }
    if(!app.checkMobile(val.telephone)){
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
    if (val.companyName == null || val.companyName == '')   {
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
    if(val.domainId == null || val.domainId == ''){
      this.setData({
        msg : "相关领域不能为空"
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
      url: ctx+'/phone/card/save.json',
      data:val,
      header:{
        'content-type': 'application/json'
      },
      success:function(res){
        var data = res.data;
        if(data.code == 0){
          wx.redirectTo({
            url: '../success/success?url=index'
          });
        }else{
          this.setData({
            msg:data.message
          });
          this.errorfadeOut();
        }
      }
    });
    
  },
  errorfadeOut:function(){
    var fadeOutTimeout = setTimeout(() => {
      this.setData({
        msg : ""
      });
      clearTimeout(fadeOutTimeout);
    },3000);
  },
  setStageIndex:function(e){
    var that = this;
    var sindex = e.detail.value;
    that.setData({
      sindex:sindex
    });
  },
  getChildList:function(e){
    var that = this;
    var ctx = app.globalData.ctx;
    var pindex = e.detail.value;
    that.setData({
      pindex: pindex
    });
    var parentId = this.data.parents[pindex].id;
    //获取childs
    wx.request({
      url: ctx+'/phone/domain/childs.json',
      data:{parentId:parentId},
      header: {
        'content-type': 'application/json'
      },
      success:function(res){
        var childs = res.data.childs;
        that.setData({
          domains:childs,
          cindex:-1
        });
      }
    });
  },
  getDomain:function(e){
    var that = this;
    that.setData({
      cindex: e.detail.value
    });
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log('onLoad');
    var that = this;
    app.getUser(function(user){
      that.setData({
        user:user
      });
    });

    app.getDomainList(function (domains) {
      that.setData({
        parents: domains
      });
    });
    var ctx = app.globalData.ctx;
    var tempFilePath = ctx + "/" + options.picture;
    that.setData({
      picture:options.picture,
      tempFilePath: tempFilePath
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