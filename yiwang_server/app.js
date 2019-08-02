//下载指令npm i express-session body-parser  multer mysql express cors

//1.引入第二模块 express mysql
const express=require("express");
const mysql=require("mysql");


//2.创建连接池
var pool=mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    port:3306,
    database:"yw",
    connectionLimit:15
})
//3.创建express对象
var server=express();

//4.指定静态的目录
server.use(express.static("public"))

//5.处理跨域请求
const cors=require("cors");
server.use(cors({
    origin:["http://127.0.0.1:8000","http://localhost:8000"],
    credentials:true
}));

//6.添加session功能
const session=require("express-session");
server.use(session({
    secret:"128位字符串",
    resave:true,
    saveUninitialized:true,
}));

//9.绑定监听端口
server.listen(3000);

//10.接收用户登录请求
//1:检查数据库t_login
//2.启动数据库启动node.js
//3.地址栏访问http://127.0.0.1:3000/login?uname=tom&upwd=123
server.get("/login",(req,res)=>{
    //1.接收脚手架
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    //2.sql
    var sql="SELECT id FROM yw_login WHERE uname=? AND upwd=?";
    //3.返回结果
    //{code:1,msg:"登录成功"}
    //{code:-1,msg:"用户名或密码有误"}
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err)throw err;
        if(result.length==0){
            res.send({code:-1,msg:"用户名或密码有误"})
        }else{//将当前登录用户uid保存session
            req.session.uid=result[0].id;//result=[{id:1}]
            console.log(1);
            console.log(req.session);
            res.send({code:1,msg:"登录成功"})
        }
    })
});

//功能二：商品列表
server.get("/product",(req,res)=>{
    //1.参数 pno pageSize
    var pno=req.query.pno;
    var ps=req.query.pageSize;
    //2.默认值
    if(!pno){pno=1};
    if(!ps){ps=4};
    //3.sql
    var sql="SELECT id,img_url,author,title,price  FROM  yw_list  LIMIT  ?,?";
    var offset=(pno-1)*ps;
    ps=parseInt(ps);
    //json
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
//功能三:查询指定用户购物车信息88~114
server.get("/cart",(req,res)=>{
    console.log(req.session.uid);
    var uid = req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    //sql
    var sql = "SELECT  id,author,art_title,ellipsis,artSize,price,art_img,count  FROM  yw_cart  WHERE uid = ?";
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result})
        console.log(result)
    });
    //json
    })


  //功能四:-删除指定购物车中一个商品
    server.get("/delItem",(req,res)=>{
    //参数:id
    var id = req.query.id;
    //sql:
    var sql = "DELETE FROM yw_cart WHERE id = ?";
    //json
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        console.log(result);
        res.send({code:1,msg:"删除成功"})
    })
    })

  //功能五：清空购物车
    server.get("/delAll",(req,res)=>{
      //参数
        var ids=req.query.ids;
        var sql=`DELETE  FROM yw_cart WHERE id IN(${ids})`;
        pool.query(sql,(err,result)=>{
            if(err)throw err;
            //insert updata delect
            //result不是数组，是一个对象
            if(result.affectedRows>0){
                res.send({code:1,msg:"删除成功"})
            }else{
                res.send({code:-1,msg:"删除失败"})
            }
        })
    })
















