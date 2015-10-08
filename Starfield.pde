Particle[] particles = new Particle[375];
void setup() {
	size(500,500);
	noStroke();
	for (int i = 0; i < particles.length; i ++) {
		if (i <= 360) {
			particles[i] = new NormalParticle(i,5);
        } else if (i <= 370) {
        	particles[i] = new OddballParticle(i,5);
        } else {
        	particles[i] = new JumboParticle(i,10);
        }
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
	double x,y,speed,angle,mySize;
	color myColor;

	NormalParticle(double angle, double mySize) {
		// x = (int)(Math.random()*)
		x = width/2;
		y = height/2;
		speed = 5;
		this.angle = angle;
		myColor = (int)(Math.random()*256);
		this.mySize = mySize;
	}

	public void move() {
		x += (cos((float)angle)*speed);
		y += (sin((float)angle)*speed);
		if (x > width || x < 0 || y > height || y < 0) {
			x = width/2;
			y = height/2;
			if (speed < 3) { 
				speed = 5;
			} else {
				speed -= 1.5;
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
	double x,y,speed,angle,mySize;
	color myColor;

	OddballParticle(double angle, double size) {
		// x = (int)(Math.random()*)
		x = width/2;
		y = height/2;
		speed = 5;
		this.angle = angle;
		myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		this.mySize = mySize;
	}

	public void move() {
		x += (cos((float)angle)*speed);
		y += (sin((float)angle)*speed);
		if (x > width || x < 0 || y > height || y < 0) {
			x = width/2;
			y = height/2;
			myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
			if (speed < 3) { 
				speed = 5;
			} else {
				speed -= 1.5;
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

class JumboParticle extends NormalParticle {
	JumboParticle (double angle, double mySize) {
		x = width/2;
		y = height/2;
		speed = 5;
		this.angle = angle;
		myColor = (int)(Math.random()*256);
		this.mySize = mySize;
	}
}

