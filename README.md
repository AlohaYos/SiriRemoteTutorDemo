SiriRemoteTutorDemo
=======

Provide simple animation tutor of Siri remote for tvOS apps (Apple TV).

<img src="https://github.com/AlohaYos/SiriRemoteTutorDemo/blob/master/SiriRemoteTutorDemo.gif"  />

<strong>How to use</strong>

Step 1 : Make property for SiriRemoteTutor class

    var remoteTutor : SiriRemoteTutor?
	
Step 2 : Initialize the class with position, size and SKScene where SiriRemoteTutor to be added.

    remoteTutor = SiriRemoteTutor.init(rect: CGRectMake(x, y, w, h), scene: demoScene)

Step 3: Call function to animate

    remoteTutor?.show()
	remoteTutor?.hide()
	remoteTutor?.swipeRight()
	remoteTutor?.swipeLeft()
	remoteTutor?.swipeUp()
	remoteTutor?.swipeDown()
	remoteTutor?.click()
	
Step 4 : Enjoy !

See "ViewController.swift" for detail.
