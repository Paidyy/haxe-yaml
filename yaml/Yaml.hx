package yaml;

import yaml.Renderer;
import yaml.Parser;

/**
	Facade for common YAML processing operations.
 */
class Yaml {
	/**
		Parse a yaml document into object form.
		 
		@param document     The yaml document to parse.
		@param ?options     Parsing options (optional).
		 
		@return The parsed yaml document in object form.
	 */
	public static function parse(document:String, ?options:ParserOptions):Dynamic {
		if (options == null)
			options = new ParserOptions();
		return new Parser().parse(document, options);
	}

	#if (sys || nodejs)
	/**
		Read a yaml document from disk and parse into object form.

		@param filePath     The path to read the yaml file.
		@param ?options     Parsing options (optional).

		@return The parsed yaml document in object form.
	 */
	public static function read(filePath:String, ?options:ParserOptions):Dynamic {
		return parse(sys.io.File.getContent(filePath), options);
	}
	#end

	/**
		Render a yaml object graph as a yaml text document.

		@param data The root object to render.

		@return The rendered yaml document.
	 */
	public static function render(data:Dynamic):String {
		return new Render().render(data);
	}

	#if (sys || nodejs)
	/**
		Render an object graph as a yaml text document and write it to disk.

		@param filePath     The path to write the yaml document.
		@param data         The root object to render.
	 */
	public static function write(filePath:String, data:Dynamic):Void {
		sys.io.File.saveContent(filePath, render(data));
	}
	#end

	private function new() {}
}
