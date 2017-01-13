package com.caihong.core.template;

import com.caihong.common.developer.ModuleGenerator;

public class CoreModuleGenerator {
	private static String packName = "com.caihong.core.template";
	private static String fileName = "jeecore.properties";

	public static void main(String[] args) {
		new ModuleGenerator(packName, fileName).generate();
	}
}
