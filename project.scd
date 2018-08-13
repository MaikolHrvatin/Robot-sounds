(
// test synth - example
(
SynthDef.new("test",{
	arg noiseHz = 8;
	var freq, sig, amp;
	//chossess a random value 8 times per second between 200 and 1000
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);

	amp = LFNoise1.kr(12).exprange(0.02,1);
	sig = SinOsc.ar(freq)*amp; //signal-sound
	Out.ar(0,sig);//only in SynthDef, so you can play-stop sound
}).add;
);

// first robot
// sinus signal + pulse
// base sound
(
SynthDef.new("base_sin_pulse",{
	arg b_freq = 100, amp = 1; //base frequency
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[0.25,1.5,0.25],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[2],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_sin_pulse",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[0.25,0.25,0.25,0.25,0.25,0.25],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_sin_pulse",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.1,1,0.1,0],[0.25,0.25,0.25,0.25,0.1],[-3,-6,-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[2],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_sin_pulse",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[0.75,0.75],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_sin_pulse",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0],[0.25,0.25,0.25,0.25],[-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[2],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_sin_pulse",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0.8,0],[0.25,0.75,1],[-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,0.5],[2],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);

// second robot
// sinus mix
// base sound
(
SynthDef.new("base_sinus_mix",{
	arg b_freq = 100, amp = 2;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[0.25,1.5,0.25],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[2],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_sinus_mix",{
	arg b_freq = 100, amp = 2;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[0.25,0.25,0.25,0.25,0.25,0.25],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_sinus_mix",{
	arg b_freq = 100, amp = 2;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.1,1,0.1,0],[0.25,0.25,0.25,0.25,0.1],[-3,-6,-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[2],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_sinus_mix",{
	arg b_freq = 100, amp = 2;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[0.75,0.75],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_sinus_mix",{
	arg b_freq = 100, amp = 2;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0],[0.25,0.25,0.25,0.25],[-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[2],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp;
	Out.ar(0,sig);
}).add;
);
// growl
(
SynthDef.new("growl_sinus_mix",{
	arg b_freq = 100, amp = 2;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0.8,0],[0.25,0.75,1],[-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,0.5],[2],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp;
	Out.ar(0,sig);
}).add;
);

// third robot
// bubble
// base sound
(
SynthDef.new("base_bubble",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[0.25,1.5,0.25],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[2],[0]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_bubble",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[0.25,0.25,0.25,0.25,0.25,0.25],\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_bubble",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,0.8,0.1,1,0.1,0],[0.25,0.25,0.25,0.25,0.1],[-3,-6,-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[2],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_bubble",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[0.75,0.75],\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_bubble",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,1,0,1,0],[0.25,0.25,0.25,0.25],[-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[2],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// growl
(
SynthDef.new("growl_bubble",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,1,0.8,0],[0.25,0.75,1],[-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,0.5],[2],[-3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);

// fourth robot
// bib_bop
// base sound
(
SynthDef.new("base_bib_bop",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[0.25,1.5,0.25],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[2],[0]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_bib_bop",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[0.25,0.25,0.25,0.25,0.25,0.25],\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_bib_bop",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,0.8,0.1,1,0.1,0],[0.25,0.25,0.25,0.25,0.1],[-3,-6,-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[2],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_bib_bop",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[0.75,0.75],\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_bib_bop",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,1,0,1,0],[0.25,0.25,0.25,0.25],[-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[2],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// growl
(
SynthDef.new("growl_bib_bop",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,1,0.8,0],[0.25,0.75,1],[-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,0.5],[2],[-3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq*6)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);

// fift robot
// saw
// base sound
(
SynthDef.new("base_saw",{
	arg b_freq = 100, amp = 1; //base frequency
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[0.25,1.5,0.25],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[2],[0]), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_saw",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[0.25,0.25,0.25,0.25,0.25,0.25],\sine), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_saw",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.1,1,0.1,0],[0.25,0.25,0.25,0.25,0.1],[-3,-6,-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[2],[3]), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_saw",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[0.25,0,0.25,0,0.25,0,0.25,0,0.25,0,0.25,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[0.75,0.75],\sine), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_saw",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0],[0.25,0.25,0.25,0.25],[-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[2],[3]), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_saw",{
	arg b_freq = 100, amp = 1;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0.8,0],[0.25,0.75,1],[-3,9,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,0.5],[2],[-3]), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp;
	Out.ar(0,sig);
}).add;
);

s.waitForBoot({
	// GUI window with some SCPopUpMenus.
	var m_sound, m_dialog, m_mood, sound, dialog, mood; //menu and strings
	var w, f; //window and flow layout
	var funcs, snd; //funkcions and playing sound
	var startButton;
	var win_width = 600, win_height = 400;
	var characters = 4, dialogs = 6, moods = 4; //number of drop down elements

	// The window will allways be in the centar of the screen
	w = Window("Test window 2.0", Rect(
		Window.screenBounds.width/2 - (win_width/2),
		Window.screenBounds.height/2 - (win_height/2),
		win_width,
		win_height
	));
	w.view.decorator = f = FlowLayout(w.view.bounds);

	sound = ["Sinus+Pulse","Sinus mix", "Bubble", "Bib Bop", "Saw"];
	dialog = ["Base sound", "Cheering", "Ahaa", "Chat", "Alert", "Growl"];
	mood = ["Normal", "Happy", "Sad", "Surprised"];

	m_sound = PopUpMenu(w, Rect(0,0,160,24));
	m_sound.items = sound;

	m_dialog = PopUpMenu(w, Rect(0,0,160,24));
	m_dialog.items = dialog;

	m_mood = PopUpMenu(w, Rect(0,0,160,24));
	m_mood.items = mood;

	f.nextLine;

	funcs = [
		{ Synth("base_sin_pulse") },
		{ Synth("cheering_sin_pulse") },
		{ Synth("ahaa_sin_pulse") },
		{ Synth("chat_sin_pulse") },
		{ Synth("alert_sin_pulse") },
		{ Synth("growl_sin_pulse") },

		{ Synth("base_sinus_mix") },
		{ Synth("cheering_sinus_mix") },
		{ Synth("ahaa_sinus_mix") },
		{ Synth("chat_sinus_mix") },
		{ Synth("alert_sinus_mix") },
		{ Synth("growl_sinus_mix") },

		{ Synth("base_bubble") },
		{ Synth("cheering_bubble") },
		{ Synth("ahaa_bubble") },
		{ Synth("chat_bubble") },
		{ Synth("alert_bubble") },
		{ Synth("growl_bubble") },

		{ Synth("base_bib_bop") },
		{ Synth("cheering_bib_bop") },
		{ Synth("ahaa_bib_bop") },
		{ Synth("chat_bib_bop") },
		{ Synth("alert_bib_bop") },
		{ Synth("growl_bib_bop") },

		{ Synth("base_saw") },
		{ Synth("cheering_saw") },
		{ Synth("ahaa_saw") },
		{ Synth("chat_saw") },
		{ Synth("alert_saw") },
		{ Synth("growl_saw") }
	];

	startButton = Button(w, 75 @ 24)
	.states_([["Start", Color.black, Color.green]])
	.action_({
		//snd.release;
		snd = {funcs.at(m_sound.value*dialogs + m_dialog.value)}.play;
	});

	w.front;
	w.alwaysOnTop = true;
})
)

//gotov primjer - šablona
(
s.waitForBoot({

 var w, menu, snd, funcs, b;

 w = Window.new.front;

 menu = PopUpMenu(w, Rect(10, 10, 90, 20))
  .items_(["Sine", "Saw" , "Noise" , "Pulse"]);

 funcs = [
  { SinOsc.ar(440, 0, 0.3) },
  { Saw.ar(440, 0.3) },
  { WhiteNoise.ar(0.3) },
  { Pulse.ar(440, 0.2, 0.3) }
 ];

 b = Button(w, Rect(110, 10, 180, 20))
  .states_([["play", Color.black, Color.green]])
  .mouseDownAction_({
    snd = funcs.at(menu.value).play;
   })
  .action_({ arg butt, mod;
    snd.release;
   });

 w.front;

 p = CmdPeriod.add({ b.value_(0) }); // set button to 0 on hitting Cmd-period
 w.onClose_{ snd.release; CmdPeriod.removeAll }; // clean up when window is closed

})
)