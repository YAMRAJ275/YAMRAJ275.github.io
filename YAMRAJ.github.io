<!DOCTYPE html>
<html>
<head>
<title>Happy Birthday</title>
<style>
body{
 margin:0;
 overflow:hidden;
 text-align:center;
 font-family:Segoe UI;
 color:white;
 background: radial-gradient(circle,#ff4d6d,#6a00f4,#00c9ff);
 height:100vh;
}

/* heading */
h1{
 font-size:70px;
 margin-top:10%;
 animation: glow 2s infinite alternate;
}
@keyframes glow{
 from{text-shadow:0 0 20px #fff,0 0 40px #ff0;}
 to{text-shadow:0 0 40px #fff,0 0 80px #ff0080;}
}

.name{
 font-size:40px;
 margin-top:20px;
 animation: float 3s ease-in-out infinite;
}
@keyframes float{
0%,100%{transform:translateY(0)}
50%{transform:translateY(-20px)}
}

/* balloons */
.balloon{
 position:absolute;
 bottom:-100px;
 font-size:40px;
 animation: rise linear infinite;
}
@keyframes rise{
 from{transform:translateY(0)}
 to{transform:translateY(-120vh)}
}

/* cake */
.cake{
 font-size:80px;
 margin-top:30px;
 animation: bounce 1.5s infinite;
}
@keyframes bounce{
0%,100%{transform:translateY(0)}
50%{transform:translateY(-20px)}
}

/* fireworks canvas */
canvas{
 position:fixed;
 top:0;
 left:0;
 pointer-events:none;
}
</style>
</head>
<body>

<canvas id="fireworks"></canvas>

<h1>Happy Birthday 🎉</h1>
<div class="name">Rishikesh Anand</div>
<div class="cake">🎂</div>

<script>
/* balloons */
for(let i=0;i<20;i++){
 let b=document.createElement("div");
 b.className="balloon";
 b.innerHTML="🎈";
 b.style.left=Math.random()*100+"%";
 b.style.animationDuration=(5+Math.random()*5)+"s";
 document.body.appendChild(b);
}

/* voice */
function speak(){
 let msg=new SpeechSynthesisUtterance("Happy Birthday Rishikesh Anand");
 msg.rate=0.85;
 msg.pitch=1.4;
 speechSynthesis.speak(msg);
}
setTimeout(speak,1500);

/* fireworks */
const canvas=document.getElementById("fireworks");
const ctx=canvas.getContext("2d");
canvas.width=innerWidth;
canvas.height=innerHeight;

let particles=[];

function firework(){
 let x=Math.random()*canvas.width;
 let y=Math.random()*canvas.height/2;
 for(let i=0;i<80;i++){
   particles.push({
     x:x,y:y,
     dx:(Math.random()-0.5)*6,
     dy:(Math.random()-0.5)*6,
     life:100
   });
 }
}
setInterval(firework,800);

function animate(){
 ctx.fillStyle="rgba(0,0,0,0.2)";
 ctx.fillRect(0,0,canvas.width,canvas.height);
 particles.forEach(p=>{
   p.x+=p.dx;
   p.y+=p.dy;
   p.life--;
   ctx.fillStyle="hsl("+Math.random()*360+",100%,50%)";
   ctx.fillRect(p.x,p.y,3,3);
 });
 particles=particles.filter(p=>p.life>0);
 requestAnimationFrame(animate);
}
animate();
</script>

</body>
</html>
