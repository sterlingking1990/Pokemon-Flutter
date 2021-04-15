class Results {
	String name;
	String url;

	Results.fromJson(Map<String, dynamic> json)
			:	name = json['name'],
	url = json['url'];

	Map<String, dynamic> toJson() => {
				'name': this.name,
				'url': this.url,
			};
}
