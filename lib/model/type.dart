class Type {
	String name;
	String url;

	Type.fromJson(Map<String, dynamic> json)
			:	name = json['name'],
	url = json['url'];

	Map<String, dynamic> toJson() => {
				'name': this.name,
				'url': this.url,
			};
}
