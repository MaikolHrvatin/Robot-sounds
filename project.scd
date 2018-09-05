(
// test synth
/*
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
*/

// first robot
// sinus signal + pulse
// base sound
(
SynthDef.new("base_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25; //base frequency
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// growl
(
SynthDef.new("growl_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/12;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,1.9,0,0,1.9,1.9,0,0,1.9,1.9,0,0,1.6,1.6],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_sin_pulse",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq), LFPulse.ar(freq,width: 0.4, mul: 0.5)])*env*amp/8;
	Out.ar(0,sig);
}).add;
);

// second robot
// sinus mix
// base sound
(
SynthDef.new("base_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1,1.5,1.5,3,3],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// growl
(
SynthDef.new("growl_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp*2;
	Out.ar(0,sig);
}).add;
);
//sos
(
SynthDef.new("sos_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,1.9,0,0,1.9,1.9,0,0,1.9,1.9,0,0,1.6,1.6],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new( Array.fill(8, { SinOsc.ar(5*freq + 500.0.rand, 0, 0.05) }) )*env*amp;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_sinus_mix",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2]/2,0),
	doneAction:2);
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
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0.8,0.1],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.4,0.4,1.6,1.6,6.4,6.4],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0]*2,
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur]*2,\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0]*2,
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur]*2,\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,-3,-3,-3,-3,-3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// growl
(
SynthDef.new("growl_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,0.5],[8*dur],[-3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
//sos
(
SynthDef.new("sos_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([1,1],[dur*20+0.6],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*4,0,0.1,0,dur*4,0,0.1,0,dur*4,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur],0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([1,1]*2,[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,1.9,0,0,1.9,1.9,0,0,1.9,1.9,0,0,0.8,0.8],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_bubble",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 64;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25]*2,[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2],0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/4;
	Out.ar(0,sig);
}).add;
);

// fourth robot
// bib_bop
// base sound
(
SynthDef.new("base_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.5,1.5,4,4],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0]*2,
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur]*2,\sine), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// growl
(
SynthDef.new("growl_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([0,1.4,1,0.5,0],[dur,3*dur,3*dur,dur],[-3,9,1,0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.5],[8*dur],[-3]), doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([1,1],[dur*10+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*4,0,0.1,0,dur*4,0,0.1,0,dur*4,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,1.9,0,0,1.9,1.9,0,0,1.9,1.9,0,0,1,1],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_bib_bop",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq, noiseHz = 8;
	env = EnvGen.kr(Env.new([1,1],[dur*16+0.4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[4,4,0,0,1,1,0,0,2,2],
		[dur*4,0,0.2,0,dur*4,0,0.2,0,dur*8],0),
	doneAction:2);
	freq = LFNoise0.kr(noiseHz).exprange(b_freq,b_freq+300)*env_freq;
	sig = SinOsc.ar(freq)*env*amp/2;
	Out.ar(0,sig);
}).add;
);

// fifth robot
// saw
// base sound
(
SynthDef.new("base_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,1,0],[dur,dur,dur,dur],[\sine,9,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[4*dur],[3]), doneAction:2);
	freq = LFSaw.kr(0.1, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = LFSaw.kr(16, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = LFSaw.kr(4, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.2,1.2,0,0,1.2,1.2,0,0,1.2,1.2,0,0,0.4,0.4],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = LFSaw.kr(8, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_saw",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2]/2,0),
	doneAction:2);
	freq = LFSaw.kr(2, 0, b_freq, 400)*env_freq;
	sig = LFSaw.ar(freq,0,0.1)*env*amp/2;
	Out.ar(0,sig);
}).add;
);

// sixth robot
// tremor
// base sound
(
SynthDef.new("base_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0.1,dur,0.1,dur,0.1,dur,0.1,dur,0.1,dur,0.1],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur+0.3,3*dur+0.3],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[3.5,3.5,2.9,2.9,2.5,2.5,2.2,2.2],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,1.9,0,0,1.9,1.9,0,0,1.9,1.9,0,0,1.6,1.6],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_tremor",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(SinOsc.ar(LFTri.kr(8), 0, 100, freq*2), 0, 0.5)*env*amp;
	Out.ar(0,sig);
}).add;
);

// seventh robot
// ratio
// base sound
(
SynthDef.new("base_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,dur,10*dur],[\sine,0,0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq*8, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.1],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq*8, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq*8, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq*8, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq*8, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,1],[6*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq*8, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([8,8],[dur*7+0.3],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,0.1],[dur*8],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4]*2,
		[dur*2,0,dur*2,0,dur*2,0,dur*2],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,0.01],[dur*6+0.3],[1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,0,0,1.9,0,0,1.9,0,0,0.1,0],
		[dur,0.1,0,dur,0.1,0,dur,0.1,0,dur*3],
		[9,0,0,9,0,0,9,0,0,3]),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_ratio",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = SinOsc.ar(freq, SinOsc.ar(LFTri.kr(800), 0, 2pi), 0.2)*env*amp/4;
	Out.ar(0,sig);
}).add;
);

// eighth robot
// miser
// base sound
(
SynthDef.new("base_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * freq*2 + 400, 0, 0.1).sum*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * freq*2 + 400, 0, 0.1).sum*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * 200 + 100 + freq, 0, 0.1).sum*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * freq*2 + 400, 0, 0.1).sum*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * 200 + 300 + freq, 0, 0.1).sum*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * 200 + 300 + freq, 0, 0.1).sum*env*amp*2;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * freq*2 + 400, 0, 0.1).sum*env*amp*2;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * 200 + 300 + freq, 0, 0.1).sum*env*amp;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * 200 + 300 + freq, 0, 0.1).sum*env*amp;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,1.9,0,0,1.9,1.9,0,0,1.9,1.9,0,0,1.6,1.6],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * 200 + 300 + freq, 0, 0.1).sum*env*amp;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_miser",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = LFTri.ar(LFTri.kr(0.05, iphase: (0..3)) * 200 + 300 + freq, 0, 0.1).sum*env*amp;
	Out.ar(0,sig);
}).add;
);

// nineth robot
// ira
// sig = FBSineC.ar(LFNoise2.kr(1, 1e4, 1e4), LFNoise2.kr(1,16,17), 1, 1.005, 0.7)/16;
// base sound
(
SynthDef.new("base_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(LFNoise2.kr(freq/100, 1e4, 1e4), LFNoise2.kr(1,16,17), 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(80*freq, 20, 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(60*freq, 20, 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(80*freq, 20, 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(60*freq, 20, 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(60*freq, 20, 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(80*freq, 20, 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*2,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(80*freq, 20, 1, 1.005, 0.7)*env*amp/8;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4]/2,
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(80*freq, 20, 1, 1.005, 0.7)*env*amp/16;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1.9,1.9,0,0,1.9,1.9,0,0,1.9,1.9,0,0,0.8,0.8],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*4],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(80*freq, 20, 1, 1.005, 0.7)*env*amp/32;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_ira",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4+0.25],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,0,0,1.6,1.6,0,0,2.2,2.2,0,0,2.3,2.3,0,0,1.5,1.5,0,0,2.2,2.2],
		[dur,0,0.1,0,dur,0,0.1,0,dur*2,0,0.1,0,dur,0,0.1,0,dur,0,0.1,0,dur*2]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(80*freq, 20, 1, 1.005, 0.7)*env*amp/32;
	Out.ar(0,sig);
}).add;
);

// tenth robot
// fbsc
// base sound
(
SynthDef.new("base_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*7+0.3],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1]*4,
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp/4;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0],
		[dur/4,dur/4*3,dur/4,dur/4*3,dur/4,dur/4*3,dur/4,dur*4],9), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1.9,1.9,1.6,1.6],[dur/4*13,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_fbsc",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur/4,dur/4*3,dur/4,dur/4*3,dur/4,dur/4*7,dur/4,
			dur/4*3,dur/4,dur/4*3,dur/4,dur/4*7,dur/4], 9), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,1.6,1.6,2.2,2.2,2.3,2.3,1.5,1.5,2.2,2.2],
		[dur/4*5,0,dur,0,dur*2,0,dur,0,dur,0,dur*2],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = FBSineC.ar(freq*50) * 0.2*env*amp;
	Out.ar(0,sig);
}).add;
);

// eleventh robot
// crackle
// base sound
(
SynthDef.new("base_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0.8,0],[dur,10*dur,dur],[\sine,0,\sine]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,1],[12*dur],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// greetings
(
SynthDef.new("greetings_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0.8,0.4],[dur*12],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.8,1.6,1.6,3.2,3.2],[dur*4,0,dur*4,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// cheering
(
SynthDef.new("cheering_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[0,0,0,0,0,0,0,0,0,0,0,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1,4,1,4,1],[dur,dur,dur,dur,dur,dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// ahaa
(
SynthDef.new("ahaa_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,0.8,0,0,1,0],[dur,dur,dur,dur,dur],[\sine,9,0,\sine,9]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,3],[5*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// chat
(
SynthDef.new("chat_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur,0,dur,0,dur,0,dur,0,dur,0,dur,0],
		[3,0,3,0,3,0,3,0,3,0,3,0]),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([1,4,1],[3*dur,3*dur],\sine), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// alert
(
SynthDef.new("alert_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1,0,1,0,1,0],[dur,dur,dur,dur,dur,dur],[-3,3,-3,3,-3,3]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([4,4],[6*dur],[3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
//growl
(
SynthDef.new("growl_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([0,1.4,1,0],[dur,3*dur,4*dur],[-3,9,1]), doneAction:2);
	env_freq = EnvGen.kr(Env.new([0.8,0.4],[8*dur],[-3]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp;
	Out.ar(0,sig);
}).add;
);
// sos
(
SynthDef.new("sos_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1],
		[dur,0,0.1,0,dur,0,0.1,0,dur,0,dur,0,
			dur*2,0,0.1,0,dur*2,0,0.1,0,dur*2,0,dur,0,
			dur,0,0.1,0,dur,0,0.1,0,dur]/2,0),
	doneAction:2);
	env_freq = EnvGen.kr(Env.new([8,8],[dur*7+0.3],[0]), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// agree
(
SynthDef.new("agree_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new([1,1],[dur*4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[7,7,5.9,5.9,4.9,4.9,4.4,4.4],
		[dur,0,dur,0,dur,0,dur],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// disagree
(
SynthDef.new("disagree_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0],
		[dur/4,dur/4*3,dur/4,dur/4*3,dur/4,dur/4*3,dur/4,dur*4],0), doneAction:2);
	env_freq = EnvGen.kr(Env.new([1.9,1.9,1.6,1.6],[dur/4*13,0,dur*4],0), doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp/2;
	Out.ar(0,sig);
}).add;
);
// goodbye
(
SynthDef.new("bye_crackle",{
	arg b_freq = 100, amp = 1, dur = 0.25;
	var sig, env_freq, env, freq;
	env = EnvGen.kr(Env.new(
		[0,1,0,1,0,1,0,1,0,1,0,1,0],
		[dur/4,dur/4*3,dur/4,dur/4*3,dur/4,dur/4*7,dur/4,
			dur/4*3,dur/4,dur/4*3,dur/4,dur/4*7,dur/4],[0]), doneAction:2);
	env_freq = EnvGen.kr(Env.new(
		[2.3,2.3,1.6,1.6,2.2,2.2,2.3,2.3,1.5,1.5,2.2,2.2],
		[dur/4*5,0,dur,0,dur*2,0,dur,0,dur,0,dur*2],0),
	doneAction:2);
	freq = b_freq*env_freq;
	sig = Mix.new([SinOsc.ar(freq*2), Crackle.ar(1.95, 0.5)])*env*amp/2;
	Out.ar(0,sig);
}).add;
);

//close other windows
Window.closeAll;

//main window
s.waitForBoot({
	// GUI window with some SCPopUpMenus.
	var m_sound, m_dial, m_mood, sound, dialogue, mood; //menu and strings
	var w, f; //window and flow layout
	var funcs, snd; //funkcions and playing sound
	var startButton, randomButton;
	var sampleB_1, sampleB_2, sampleB_3, sampleB_4, sampleB_5;
	var win_width = 600, win_height = 400;
	var characters = 11, dialogues = 11, moods = 8; //number of drop down elements
	var l_sound, l_dial, l_mood; //labels
	var sprite, spButton, spView; //sprite
	var spPath, spNum = 0, spVisible = 1.0; //path to sprites
	var drawFunction;

	// The window will allways be in the centar of the screen
	w = Window("Test window 3.0", Rect(
		Window.screenBounds.width/2 - (win_width/2),
		Window.screenBounds.height/2 - (win_height/2),
		win_width,
		win_height
	));
	w.view.decorator = f = FlowLayout(w.view.bounds, 10@10, 10@10);

	sound = ["Sinus+Pulse","Sinus mix", "Bubble", "Bib Bop", "Saw", "Tremor", "Ratio", "Miser", "Ira", "FBSC", "Crackle"];
	dialogue = ["Base sound", "Greetings", "Cheering", "Ahaa", "Chat", "Alert", "Growl", "SOS", "Agree", "Disagree", "Goodbye"];
	mood = ["Normal", "Happy", "Sad", "Surprised", "Angry", "Fearfull", "Disgusted", "Bored"];

	spPath = [
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_0.jpg",
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_1.jpg",
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_2.jpg",
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_3.jpg",
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_4.jpg",
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_5.jpg",
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_6.jpg",
		"C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_7.jpg"
	];

	//draw sprite
	drawFunction = {
		sprite = Image.new(spPath[spNum].value);
		w.drawFunc_({
			sprite.drawInRect(Rect(12,12,128,128), fraction: spVisible);
		});
		w.refresh;
	};

	//place for the sprite
	spView = CompositeView(w, 150@150);
	spView.decorator_(FlowLayout(spView.bounds, 5@5, 5@5));

	f.nextLine;

	l_sound = StaticText(w, Rect(0,0,80,24));
	l_sound.string = "Select robot:";
	m_sound = PopUpMenu(w, Rect(0,0,240,24));
	m_sound.items = sound;
	f.nextLine;

	l_dial = StaticText(w, Rect(0,0,80,24));
	l_dial.string = "Select dialogue:";
	m_dial = PopUpMenu(w, Rect(0,0,240,24));
	m_dial.items = dialogue;
	f.nextLine;

	l_mood = StaticText(w, Rect(0,0,80,24));
	l_mood.string = "Select mood:";
	m_mood = PopUpMenu(w, Rect(0,0,240,24));
	m_mood.items = mood;
	m_mood.action = { arg menu;
		spNum = menu.value.postln;

		drawFunction.value;
	};

	f.nextLine;

	funcs = [
		{ "base_sin_pulse" },
		{ "greetings_sin_pulse" },
		{ "cheering_sin_pulse" },
		{ "ahaa_sin_pulse" },
		{ "chat_sin_pulse" },
		{ "alert_sin_pulse" },
		{ "growl_sin_pulse" },
		{ "sos_sin_pulse" },
		{ "agree_sin_pulse" },
		{ "disagree_sin_pulse" },
		{ "bye_sin_pulse" },

		{ "base_sinus_mix" },
		{ "greetings_sinus_mix" },
		{ "cheering_sinus_mix" },
		{ "ahaa_sinus_mix" },
		{ "chat_sinus_mix" },
		{ "alert_sinus_mix" },
		{ "growl_sinus_mix" },
		{ "sos_sinus_mix" },
		{ "agree_sinus_mix" },
		{ "disagree_sinus_mix" },
		{ "bye_sinus_mix" },

		{ "base_bubble" },
		{ "greetings_bubble" },
		{ "cheering_bubble" },
		{ "ahaa_bubble" },
		{ "chat_bubble" },
		{ "alert_bubble" },
		{ "growl_bubble" },
		{ "sos_bubble" },
		{ "agree_bubble" },
		{ "disagree_bubble" },
		{ "bye_bubble" },

		{ "base_bib_bop" },
		{ "greetings_bib_bop" },
		{ "cheering_bib_bop" },
		{ "ahaa_bib_bop" },
		{ "chat_bib_bop" },
		{ "alert_bib_bop" },
		{ "growl_bib_bop" },
		{ "sos_bib_bop" },
		{ "agree_bib_bop" },
		{ "disagree_bib_bop" },
		{ "bye_bib_bop" },

		{ "base_saw" },
		{ "greetings_saw" },
		{ "cheering_saw" },
		{ "ahaa_saw" },
		{ "chat_saw" },
		{ "alert_saw" },
		{ "growl_saw" },
		{ "sos_saw" },
		{ "agree_saw" },
		{ "disagree_saw" },
		{ "bye_saw" },

		{ "base_tremor" },
		{ "greetings_tremor" },
		{ "cheering_tremor" },
		{ "ahaa_tremor" },
		{ "chat_tremor" },
		{ "alert_tremor" },
		{ "growl_tremor" },
		{ "sos_tremor" },
		{ "agree_tremor" },
		{ "disagree_tremor" },
		{ "bye_tremor" },

		{ "base_ratio" },
		{ "greetings_ratio" },
		{ "cheering_ratio" },
		{ "ahaa_ratio" },
		{ "chat_ratio" },
		{ "alert_ratio" },
		{ "growl_ratio" },
		{ "sos_ratio" },
		{ "agree_ratio" },
		{ "disagree_ratio" },
		{ "bye_ratio" },

		{ "base_miser" },
		{ "greetings_miser" },
		{ "cheering_miser" },
		{ "ahaa_miser" },
		{ "chat_miser" },
		{ "alert_miser" },
		{ "growl_miser" },
		{ "sos_miser" },
		{ "agree_miser" },
		{ "disagree_miser" },
		{ "bye_miser" },

		{ "base_ira" },
		{ "greetings_ira" },
		{ "cheering_ira" },
		{ "ahaa_ira" },
		{ "chat_ira" },
		{ "alert_ira" },
		{ "growl_ira" },
		{ "sos_ira" },
		{ "agree_ira" },
		{ "disagree_ira" },
		{ "bye_ira" },

		{ "base_fbsc" },
		{ "greetings_fbsc" },
		{ "cheering_fbsc" },
		{ "ahaa_fbsc" },
		{ "chat_fbsc" },
		{ "alert_fbsc" },
		{ "growl_fbsc" },
		{ "sos_fbsc" },
		{ "agree_fbsc" },
		{ "disagree_fbsc" },
		{ "bye_fbsc" },

		{ "base_crackle" },
		{ "greetings_crackle" },
		{ "cheering_crackle" },
		{ "ahaa_crackle" },
		{ "chat_crackle" },
		{ "alert_crackle" },
		{ "growl_crackle" },
		{ "sos_crackle" },
		{ "agree_crackle" },
		{ "disagree_crackle" },
		{ "bye_crackle" }
	];

	startButton = Button(w, 75 @ 24)
	.states_([["Start", Color.black, Color.green]])
	.action_({
		snd.free;
		snd = Synth.new(funcs.at(m_sound.value*dialogues + m_dial.value).value);
		snd.set("b_freq",
			switch( m_mood.value,
				1, { 130 }, //happy
				2, { 70 }, //sad
				3, { 130 }, //surprised
				4, { 150 }, //angry //or 85
				5, { 150 }, //fearfull
				6, { 60 }, //disgusted
				7, { 50 }, //bored
				0, { 100 } //normal
			),
			"amp",
			switch( m_mood.value,
				1, { 1.2 }, //happy
				2, { 0.5 }, //sad
				3, { 1 }, //surprised
				4, { 1.4 }, //angry
				5, { 0.8 }, //fearfull
				6, { 0.8 }, //disgusted
				7, { 0.6 }, //bored
				0, { 1 } //normal
			),
			"dur",
			switch( m_mood.value,
				1, { 0.20 }, //happy
				2, { 0.35 }, //sad
				3, { 0.25 }, //surprised
				4, { 0.18 }, //angry
				5, { 0.22 }, //fearfull
				6, { 0.20 }, //disgusted
				7, { 0.45 }, //bored
				0, { 0.25 } //normal
			)
		);
		//snd.play;
    });

	randomButton = Button(w, 75 @ 24)
	.states_([["Random", Color.black, Color.green]])
	.action_({
		snd.free;
		snd = Synth.new(funcs.at((characters*dialogues).rand).value);
		snd.set("b_freq", rrand(50, 150), "amp", rrand(0.5, 1.5), "dur", rrand(0.18, 0.40));
	});

	spButton = Button(w, 128 @ 24)
	.states_([["Hide image", Color.black, Color.yellow],["Show image", Color.black, Color.green]])
	.action_({
		arg obj;
		if(
			obj.value == 1,{
				spVisible = 0.0;
			},
			{ spVisible = 1.0; }
		);
		drawFunction.value;
	});

	f.nextLine;

	//sample for sad/bored
	//test to recognise emotion
	sampleB_1 = Button(w, 75 @ 24)
	.states_([["Sample 1", Color.black, Color.cyan]])
	.action_({
		snd.free;
		snd = Synth.new("cheering_miser");
		snd.set("b_freq", 70, "amp", 0.5, "dur", 0.35);
	});
	//sample for happy
	//test to recognise emotion
	//test compare with sample above (sad & happy)
	sampleB_2 = Button(w, 75 @ 24)
	.states_([["Sample 2", Color.black, Color.cyan]])
	.action_({
		snd.free;
		snd = Synth.new("cheering_miser");
		snd.set("b_freq", 130, "amp", 1.2, "dur", 0.2);
	});
	//sample for angry
	//test compare with sample above (happy & angry)
	sampleB_3 = Button(w, 75 @ 24)
	.states_([["Sample 3", Color.black, Color.cyan]])
	.action_({
		snd.free;
		snd = Synth.new("cheering_miser");
		snd.set("b_freq", 150, "amp", 1.4, "dur", 0.18);
	});
	//sample for goodbye
	//test to recognise speech
	//test compare with sample above (goodby & cheering)
	sampleB_4 = Button(w, 75 @ 24)
	.states_([["Sample 4", Color.black, Color.cyan]])
	.action_({
		snd.free;
		snd = Synth.new("bye_miser");
		//snd.set("b_freq", 130, "amp", 1.2, "dur", 0.2);
	});
	//sample
	sampleB_5 = Button(w, 75 @ 24)
	.states_([["Sample 5", Color.black, Color.cyan]])
	.action_({
		snd.free;
		snd = Synth.new(funcs.at((characters*dialogues).rand).value);
		snd.set("b_freq", rrand(50, 150), "amp", rrand(0.5, 1.5), "dur", rrand(0.2, 0.35));
	});

	drawFunction.value;

	//what didn't work
	//i = Image.new(SCDoc.helpSourceDir +/+ "images/Swamp.png");
	//sprite = Image.new(128@128);
	//sprite = Image.new("C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_0.jpg");
	//sprite = Image.new("C:/Users/Maikol/Desktop/superCollider/sprites/sp_socket_" +m_mood.value+ ".jpg");
	//sprite.scalesWhenResized_(true);
	//sprite.setSize(256,256);
	/*
	w.drawHook_({
        //sprite.drawAtPoint(10@10);
		//sprite.drawInRect(Rect(12,12,128,128));
    });
	*/
	/*
	z = CompositeView(w, Rect(0, 0, 128, 128));
	a = Plotter("plot", parent: z).value_([0, 1, 2, 3, 4].scramble * 100);
	*/

	w.front;
	w.alwaysOnTop = true;
})
)