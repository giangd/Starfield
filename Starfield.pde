Particle[] particles = new Particle[380]; //dotn change this size and not update for loop that initializes particles
void setup() {
	size(500,500);
	noStroke();
	for (int i = 0; i < particles.length; i ++) {
		double angle = 0;
		if (i <= 360) {
			particles[i] = new NormalParticle(i,5);
        }
        else  {
        	particles[i] = new OddballParticle(angle,5);
        }
        angle ++;
        // } else if (i == 371) {
        //  	particles[i] = new JumboParticle(i,100);
        //  	println("hi");
        // }
	}
}

void draw() {
	// background(210);
	fill(210,210,210,25);
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
		//myColor = (int)(Math.random()*256);
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
			if (angle >= 360) {
				angle = 0;
			} else {
				angle += 0.141;
			}
		}
	}

	public void show() {
		fill(myColor);
		ellipse((float)x,(float)y,(float)mySize,(float)mySize);
	}
}

class OddballParticle implements Particle {
	double x,y,speed,angle,mySize;
	color myColor;

	OddballParticle(double angle, double mySize) {
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
			if (angle >= 360) {
				angle = 0;
			} else {
				angle += 0.5;
			}
		}
	}

	public void show() {
		fill(myColor);
		ellipse((float)x,(float)y,(float)mySize,(float)mySize);
	}
}

class JumboParticle implements Particle {
	double x,y,speed,angle,mySize;
	color myColor;

	JumboParticle (double angle, double mySize) {
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
		ellipse((float)x,(float)y,(float)mySize,(float)mySize);
	}
}

