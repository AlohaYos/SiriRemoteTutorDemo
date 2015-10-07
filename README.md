SiriRemoteTutorDemo
=======

Provide simple animation tutor of Siri remote for tvOS apps (Apple TV).

<img src="https://github.com/AlohaYos/SiriRemoteTutorDemo/blob/master/SiriRemoteTutorDemo.gif"  />

#How to use

Step 1 : Make property for SiriRemoteTutor class

    var remoteTutor : SiriRemoteTutor?
	
Step 2 : Initialize the class with position, size and SKScene where SiriRemoteTutor to be added.

    remoteTutor = SiriRemoteTutor.init(rect: CGRectMake(x, y, w, h), scene: demoScene)

Step 3 : Call function to animate

    remoteTutor?.show()
	remoteTutor?.hide()
	remoteTutor?.swipeRight()
	remoteTutor?.swipeLeft()
	remoteTutor?.swipeUp()
	remoteTutor?.swipeDown()
	remoteTutor?.click()
	
Step 4 : Enjoy !

See <a href="https://github.com/AlohaYos/SiriRemoteTutorDemo/blob/master/SiriRemoteTutorDemo/ViewController.swift" target=_blank>ViewController.swift</a> for detail.

#Design parts

If you need illustration data of Siri Remote, <a href="https://github.com/AlohaYos/SiriRemoteDesign" target=_blank>visit here</a> to get them in Photoshop and Illustrator format.
