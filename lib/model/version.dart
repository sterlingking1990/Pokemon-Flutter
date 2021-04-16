class Version {
	String name;
	String url;

	Version.fromJson(Map<String, dynamic> json)
			:	name = json['name'],
	url = json['url'];

	Map<String, dynamic> toJson() => {
				'name': this.name,
				'url': this.url,
			};
}
