const canvas = document.getElementsByTagName('canvas')[0];
const ctx = canvas.getContext('2d');

function distance(lhs, rhs) {
	return Math.sqrt(Math.pow(Math.abs(lhs.x - rhs.x), 2) + Math.pow(Math.abs(lhs.y - rhs.y), 2));
}

const mt = Random.engines.nativeMath; // mt19937().autoSeed();
const corners = Random.picker([{x: 0, y: 0}, {x: 0, y: canvas.height}, {x: canvas.width, y: canvas.height}, {x: canvas.width, y: 0}, {x: canvas.width / 2, y: canvas.height / 2}]);
const prev = [{x: Random.integer(0, canvas.width)(mt), y: Random.integer(0, canvas.height)(mt)}];
function canvasAddPoint() {
	const curcor = corners(mt);
	var prevelem = prev[prev.length - 1];
	const curelem = {x: prevelem.x - ((prevelem.x - curcor.x) / 2),
		               y: prevelem.y - ((prevelem.y - curcor.y) / 2)};
	prev.push(curelem);

	const R = curelem;
	const G = prevelem;
	const B = prev[prev.length - 3];
	const preB = prev[prev.length - 4];

	const dstR = distance(R, G);
	const dstG = distance(G, B);
	const dstB = distance(B, preB);
	const [dstMin, dstMid, dstMax] = [dstR, dstG, dstB].sort();
	//const colR = '00';
	const colG = Math.abs(0xFF - Math.round((dstMin / dstMax) * 0xFF));
	const colB = Math.abs(0xFF - Math.round((dstMid / dstMax) * 0xFF));

	ctx.fillStyle = '#00'/*'#' + colR.toString(16)*/ + colG.toString(16) + colB.toString(16);
	ctx.fillRect(curelem.x, curelem.y, 1, 1);
}

for(var i = 0; i < 4; ++i)
	try {
		canvasAddPoint();
	} catch(e) {}

ctx.clearRect(0, 0, canvas.width, canvas.height);
ctx.strokeStyle = '#C0C0C0';
ctx.lineWidth = 3;

ctx.rect(0, 0, canvas.width, canvas.height);

ctx.stroke();

function canvasClick() {
	canvasAddPoint();
	ctx.stroke();
}

function canvasDraw() {
	ctx.stroke();
}

const adderCache = {};
function onClickAdder(event) {
	const button = event.target;
	const id = parseInt(button.id);
	console.log('pre', adderCache);
	var func = adderCache[id];
	if(!func) {
		func = new Function('for(var i=0;i<10;++i){' + 'canvasAddPoint();'.repeat(id / 10) + '}canvasDraw();');
		adderCache[id] = func;
	}
	func();
	console.log('post', adderCache);
}
