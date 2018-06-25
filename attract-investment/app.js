//app.js
App({
  onLaunch: function () {
    //调用API从本地缓存中获取数据
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)
  },
  getUserInfo:function(cb){
    var that = this;
    if(this.globalData.userInfo){
      typeof cb == "function" && cb(this.globalData.userInfo);
    }else{
      //调用登录接口
      wx.login({
        success: function () {
          wx.getUserInfo({
            success: function (res) {
              that.globalData.userInfo = res.userInfo;
              typeof cb == "function" && cb(that.globalData.userInfo);
            }
          });
        }
      });
    }
  },
  getUser:function(cb){
    var that = this;
    var ctx = this.globalData.ctx;
    if (this.globalData.user){
      typeof cb == "function" && cb(this.globalData.user);
    }else{
      //调用查询接口
      wx.login({
        success:function(res){
          var appid = 'wxa3bf65d2b063e272';
          var secret = '9ab6de99610ba65974daf1a39d329f9c';
          var url = 'https://api.weixin.qq.com/sns/jscode2session?appid=' + appid + '&secret=' + secret + '&grant_type=authorization_code&js_code=' + res.code;
          wx.request({
            url: url,
            header: {
              'content-type': 'application/json'
            },
            success: function (result) {
              var openid = result.data.openid; //获取openid 
              that.globalData.openid = openid;
              wx.request({
                url: ctx+'/phone/register/get.json',
                data:{wechatId:openid},
                header:{
                  'content-type': 'application/json'
                },
                success:function(val){
                  var user = val.data.user; 
                  that.globalData.user = user;
                  typeof cb == "function" && cb(that.globalData.user);
                }
              });
            }
          });  

        }
      });
    }
  },
  getUserToId(id,cb){
    var that = this;
    var ctx = this.globalData.ctx;
    wx.request({
      url: ctx + '/phone/register/select.json',
      data: { id:id },
      header: {
        'content-type': 'application/json'
      },
      success: function (val) {
        var user = val.data.user; 
        typeof cb == "function" && cb(user);
      }
    });
  },
  getDomainList:function(cb){
    var that = this;
    var ctx = this.globalData.ctx;
    if (this.globalData.domains) {
      typeof cb == "function" && cb(this.globalData.domains);
    } else {
      wx.request({
        url: ctx+'/phone/domain/parents.json',
        header:{
          'content-type': 'application/json'
        },
        success:function(res){
          var domains = res.data.parents;
          that.globalData.domains = domains;
          typeof cb == "function" && cb(that.globalData.domains);
        }
      });
    }
  },
  getCardList:function(page,parentId,projectName,cb){
    var that = this;
    var ctx = this.globalData.ctx;
    var datas = { page: page, projectName: projectName };
    if(parentId != null){
      datas = { page: page, parentId: parentId, projectName: projectName};
    }
    wx.request({
      url: ctx+'/phone/card/list.json',
      data: datas,
      header:{
        'content-type': 'application/json'
      },
      success:function(res){
        var cards = res.data.pu.list;
        typeof cb == "function" && cb(cards);
      }
    });

  },
  getMyCardList: function (page, projectName, cb) {
    var that = this;
    var ctx = this.globalData.ctx;
    var user = this.globalData.user;
    wx.request({
      url: ctx + '/phone/card/mylist.json',
      data: { page: page, registerId: user.id, projectName: projectName },
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        var cards = res.data.pu.list;
        typeof cb == "function" && cb(cards);
      }
    });

  },
  getHistoryCardList: function (page, projectName,cb){
    var that = this;
    var ctx = this.globalData.ctx;
    var user = this.globalData.user;
    wx.request({
      url: ctx + '/phone/card/historys.json',
      data: { page: page, registerId: user.id, projectName: projectName },
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        var cards = res.data.pu.list;
        typeof cb == "function" && cb(cards);
      }
    });
  },
  getCard:function(id,cb){
    var that = this;
    var ctx = this.globalData.ctx;

    wx.request({
      url: ctx+'/phone/card/get.json',
      data:{id:id},
       header: {
        'content-type': 'application/json'
      },
      success:function(res){
        var card = res.data.card;
        typeof cb == "function" && cb(card);
      }
    });

  },
  searchCard:function(registerId,cardId,cb){
    var that = this;
    var ctx = this.globalData.ctx;
    wx.request({
      url: ctx+'/phone/card/search.json',
      data:{registerId:registerId,cardId:cardId},
      header: {
        'content-type': 'application/json'
      },
      success:function(res){
        var data = res.data;
        typeof cb == "function" && cb(data);
      }
    })
  },
  checkCard: function (registerId, cardId, cb){
    var that = this;
    var ctx = this.globalData.ctx;
    wx.request({
      url: ctx+'/phone/searchlog/check.json',
      data: { registerId: registerId, cardId: cardId },
      header: {
        'content-type': 'application/json'
      },
      success:function(res){
        var data = res.data;
        typeof cb == "function" && cb(data);
      }
    })
  },

  getMessageList: function (page, cb) {
    var that = this;
    var ctx = this.globalData.ctx;
    var user = this.globalData.user;
    wx.request({
      url: ctx + '/phone/message/list.json',
      data: { page: page, registerId: user.id },
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        var messages = res.data.pu.list;
        typeof cb == "function" && cb(messages);
      }
    });

  },

  checkMobile:function(str){
    var re = /^1\d{10}$/;
    if(re.test(str)){
      return true;
    }else{
      return false;
    }
  },
  checkEmail:function(str){
    var re = /^\w+((\.\w+){0,3})@\w+(\.\w{2,3}){1,3}$/;
    if (re.test(str)) {
      return true;
    } else {
      return false;
    }
  },

  globalData:{
    userInfo:null,
    openid:null,
    user:null,
    domains:null,
    ctx:"https://attract.bridgebiomed.com"
  }
});