Particle[] particles = new Particle[50];
void setup() {
	size(500,500);
	noStroke();
	for (int i = 0; i < particles.length; i ++) {
		particles[i] = new NormalParticle();
	}
}

void draw() {
	for (int i = 0; i < particles.length; i ++) {
		NormalParticle[i].move();
		NormalParticle[i].show();
	}
}

interface Particle {
	public void show();
	public void move();
}

class NormalParticle implements Particle {
	double x,y,speed,angle;
	color myColor = color(255);

	NormalParticle() {
		// x = (int)(Math.random()*)
		x = width/2;
	}

	public void move() {
		x += cos(angle)*speed;
		y += sin(angle)*speed;
	}

	public void show() {
		fill(myColor);
		ellipse(x,y,5,5);
	}
}

class OddballParticle implements Particle {
	double x,y,speed,angle;
	color myColor = color(255);

	public void move() {
		x += cos(angle)*speed;
		y += sin(angle)*speed;
	}

	public void show() {
		fill(myColor);
		ellipse(x,y,5,5);
	}
}

class JumboParticle implements Particle {
	double x,y,speed,angle;
	color myColor = color(255);

	public void move() {
		x += cos(angle)*speed;
		y += sin(angle)*speed;
	}

	public void show() {
		fill(myColor);
		ellipse(x,y,5,5);
	}
}

