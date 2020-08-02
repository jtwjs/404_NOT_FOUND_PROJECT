var grain =  document.getElementById('grain'),
	vegetable = document.getElementById('vegetable'),
	fruit = document.getElementById('fruit'),
	liveStock = document.getElementById('liveStock'),
	aquatic = document.getElementById('aquatic'),
	processedFood = document.getElementById('processedFood'),
	kimchi = document.getElementById('kimchi'),
	jang = document.getElementById('jang'),
	health = document.getElementById('health'),
	tea = document.getElementById('tea');

grain.addEventListener('click',function(){
	grain.classList.add('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
vegetable.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.add('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
fruit.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.add('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
liveStock.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.add('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
aquatic.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.add('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
processedFood.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.add('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
kimchi.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.add('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
jang.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.add('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
});
health.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.add('selected');
	tea.classList.remove('selected');
});
tea.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.add('selected');
});


	