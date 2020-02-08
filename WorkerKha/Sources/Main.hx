package;

import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {
	static function update(): Void {

	}

	static function render(framebuffer: Framebuffer): Void {
		var g = framebuffer.g2;
		g.begin();
		g.color = kha.Color.Green;
		g.fillRect(100,100,100,100);
		g.end();
	}

	public static function main() {
		System.init({title: "Kode Project", width: 800, height: 600}, function () {
			trace("what it do");
			// Just loading everything is ok for small projects
			Assets.loadEverything(function () {
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
				System.notifyOnRender(function (framebuffer) { render(framebuffer); });
			});
		});
	}
}
