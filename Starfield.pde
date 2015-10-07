Particle[] particles = new Particle[720];
void setup() {
	size(500,500);
	noStroke();
	for (int i = 0; i < particles.length; i ++) {
		particles[i] = new NormalParticle(i);
	}
}

void draw() {
	// background(210);
	fill(210,210,210,10);
	rect(0,0,width,height);
	for (int i = 0; i < particles.length; i ++) {
		particles[i].move();
		particles[i].show();
	}
}

interface Particle {
	public void show();
	public void move();
}

class NormalParticle implements Particle {
	double x,y,speed,angle;
	color myColor = color(255);

	NormalParticle(double angle) {
		// x = (int)(Math.random()*)
		x = width/2;
		y = height/2;
		speed = 3;
		this.angle = angle;
	}

	public void move() {
		x += (cos((float)angle)*speed);
		y += (sin((float)angle)*speed);
		if (x > width || x < 0 || y > height || y < 0) {
			x = width/2;
			y = height/2;
			if (speed < 2) {
				speed = 6;
			} else {
				speed -= 2.5;
			}
			if (angle == 360) {
				angle = 0;
			} else {
				angle += 1;
			}
		}
	}

	public void show() {
		fill(myColor);
		ellipse((float)x,(float)y,5,5);
	}
}

class OddballParticle implements Particle {
	double x,y,speed,angle;
	color myColor = color(255);

	public void move() {
		x += cos((float)angle)*speed;
		y += sin((float)angle)*speed;
	}

	public void show() {
		fill(myColor);
		ellipse((float)x,(float)y,5,5);
	}
}

class JumboParticle implements Particle {
	double x,y,speed,angle;
	color myColor = color(255);

	public void move() {
		x += cos((float)angle)*speed;
		y += sin((float)angle)*speed;
	}

	public void show() {
		fill(myColor);
		ellipse((float)x,(float)y,5,5);
	}
}

