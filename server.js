const express = require('express');
const app = express();
const PORT = 8080;
const path = require('path');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const session = require('express-session');


const cors = require('cors');
app.use(cors());  // 允许跨域请求

app.set('view engine', 'ejs');   // 使用 EJS 模板引擎


// 配置bodyParser，以便解析POST请求的JSON数据
app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '0000',
    database: 'webgame'
});



// 配置 session 中间件
app.use(session({
    secret: 'your-secret-key',  // 用来加密 session 的密钥
    resave: false,              // 是否每次请求都重新保存 session
    saveUninitialized: true,    // 是否保存未初始化的 session
    cookie: { maxAge: 300000 }  // 设置 session cookie 过期时间为 5 分钟（300000 毫秒）
}));




// 连接数据库
db.connect((err) => {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }
    console.log('Connected as id ' + db.threadId);
});

// 提供静态文件服务
app.use(express.static('/home/ubuntu/webgame')); // 设置静态文件的路径
app.use(express.json());

app.use(express.static(path.join(__dirname, 'public'), {
    setHeaders: function (res, filePath) {
        // 只对图片和 CSS 文件设置缓存
        if (filePath.endsWith('.jpg') || filePath.endsWith('.jpeg') || filePath.endsWith('.png') || filePath.endsWith('.css')|| filePath.endsWith('.webp')) {
            res.set('Cache-Control', 'public, max-age=86400,s-maxage=864000');  // 缓存 
        }
    }
}));


//登录接口
app.post('/login', (req, res) => {
    const { username, password } = req.body;

    const sql = 'SELECT * FROM users WHERE username = ? AND password = ?';
    db.execute(sql, [username, password], (err, results) => {
        if (err) {
            console.error('Error executing query', err);
            return res.status(500).json({ success: false, message: 'Database query failed' });
        }

        if (results.length > 0) {
            req.session.user = { username };
            return res.json({ success: true, message: 'Login successful' });
        } 
        
        return res.json({ success: false, message: 'Invalid username or password' });
    });
});


//注册接口
app.post('/register', (req, res) => {
    const { username, password, email } = req.body;

    // 检查用户名或邮箱是否已存在
    const checkSql = 'SELECT * FROM users WHERE username = ? OR email = ?';
    db.execute(checkSql, [username, email], (err, results) => {
        if (err) {
            console.error('Error executing query', err);
            return res.status(500).json({ success: false, message: '数据库查询失败' });
        }

        if (results.length > 0) {
            return res.json({ success: false, message: '用户名或邮箱已被注册' });
        }

        // 插入新用户数据
        const insertSql = 'INSERT INTO users (username, password, email) VALUES (?, ?, ?)';
        db.execute(insertSql, [username, password, email], (err, results) => {
            if (err) {
                console.error('Error executing query', err);
                return res.status(500).json({ success: false, message: '数据库插入失败' });
            }

            return res.json({ success: true, message: '注册成功' });
        });
    });
});





// 如果没有匹配到的路由，则返回 index.html
app.get('/', (req, res) => {
    
    res.sendFile(path.join(__dirname, '/index.html'));
    res.set('Cache-Control', 'public, max-age=3600, s-maxage=86400');
});

//管理者界面
app.get('/admin', (req, res) => {
    res.sendFile('/home/ubuntu/webgame/admin.html');            //第一种方式
});

//目录大厅
app.get('/navigation', (req, res) => {
    res.setHeader('Cache-Control', 'no-store');  // 禁用缓存
    if (!req.session.user) {
        return res.redirect('/');  // 如果没有登录，重定向到登录页
    }
    const username = req.session.user.username;

    // 将用户名通过查询字符串传递给前端
    res.redirect(`/navigation.html?username=${username}`);
});

app.get('/combined-snake', (req, res) => {
    res.sendFile(path.join(__dirname, '/combined-snake.html'));    
});


app.get('/minesweeper', (req, res) => {
    res.sendFile(path.join(__dirname, '/minesweeper.html'));    
});
app.get('/tetris', (req, res) => {
    res.sendFile(path.join(__dirname, '/tetris.html'));    
});
app.get('/shooting-game', (req, res) => {
    res.sendFile(path.join(__dirname, '/shooting-game.html'));    
});
app.get('/balance-ball', (req, res) => {
    res.sendFile(path.join(__dirname, '/balance-ball.html'));    
});

// 获取排行榜数据
// 获取排行榜数据
app.get("/leaderboard/:game", (req, res) => {
    const game = req.params.game; // 获取请求的游戏名称
    let sql;

    // 如果是扫雷游戏，查询得分最小的玩家
    if (game === "saolei") {
        sql = `SELECT username, score FROM ${game} ORDER BY score ASC LIMIT 3`; // 按分数升序排序并限制前 3 名
    } else {
        sql = `SELECT username, score FROM ${game} ORDER BY score DESC LIMIT 3`; // 默认按分数降序排序并限制前 3 名
    }

    db.query(sql, (err, result) => {
        if (err) {
            return res.status(500).json({ error: "数据库查询失败" });
        }
        res.json(result);
    });
});



// 登录接口
app.post('/api/login', (req, res) => {
    const token = req.headers['authorization'];

    if (!token || token !== SECRET_TOKEN) {
        return res.status(403).json({ success: false, message: "❌ 无效的请求！" });
    }

    res.json({ success: true, message: "✅ 登录成功！" });
});
// 贪吃蛇-提交分数接口
app.post('/submit-score', (req, res) => {
    const { username, score } = req.body;

    // 贪吃蛇表单提交
    const sql = 'INSERT INTO snake (username, score) VALUES (?, ?)';
    db.execute(sql, [username, score], (err, results) => {
        if (err) {
            console.error('Error inserting score into database', err);
            return res.status(500).json({ success: false, message: '数据库插入失败' });
        }

        return res.json({ success: true, message: '分数提交成功' });
    });
});

// 俄罗斯方块-提交分数接口
app.post('/submit-score-fangkuai', (req, res) => {
    const { username, score } = req.body;

    // 表单提交
    const sql = 'INSERT INTO fangkuai (username, score) VALUES (?, ?)';
    db.execute(sql, [username, score], (err, results) => {
        if (err) {
            console.error('Error inserting score into database', err);
            return res.status(500).json({ success: false, message: '数据库插入失败' });
        }

        return res.json({ success: true, message: '分数提交成功' });
    });
});
// shoot-提交分数接口
app.post('/submit-score-shoot', (req, res) => {
    const { username, score } = req.body;

    // 表单提交
    const sql = 'INSERT INTO shoot (username, score) VALUES (?, ?)';
    db.execute(sql, [username, score], (err, results) => {
        if (err) {
            console.error('Error inserting score into database', err);
            return res.status(500).json({ success: false, message: '数据库插入失败' });
        }

        return res.json({ success: true, message: '分数提交成功' });
    });
});

app.post('/submit-score-saolei', (req, res) => {
    const { username, score } = req.body;

    // 表单提交
    const sql = 'INSERT INTO saolei (username, score) VALUES (?, ?)';
    db.execute(sql, [username, score], (err, results) => {
        if (err) {
            console.error('Error inserting score into database', err);
            return res.status(500).json({ success: false, message: '数据库插入失败' });
        }

        return res.json({ success: true, message: '分数提交成功' });
    });
});

app.post('/submit-score-ball', (req, res) => {
    const { username, score } = req.body;

    // 表单提交
    const sql = 'INSERT INTO Balanceball (username, score) VALUES (?, ?)';
    db.execute(sql, [username, score], (err, results) => {
        if (err) {
            console.error('Error inserting score into database', err);
            return res.status(500).json({ success: false, message: '数据库插入失败' });
        }

        return res.json({ success: true, message: '分数提交成功' });
    });
});

app.listen(PORT, () => {
    console.log(`🚀 服务器运行在 http://127.0.0.1:${PORT}`);
});
