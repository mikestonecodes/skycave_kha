let project = new Project('SkyCave');
project.addAssets('Assets/**');
project.addShaders('Shaders/**');
project.addSources('Sources');
resolve(project);
