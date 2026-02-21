{...}:
{
	services.gammastep = {
		enable = true;
		provider = "manual";

		latitude = -38.0;
		longitude = -57.5;

		temperature = {
			day = 4000;
			night = 3500;
		};

		settings = {
			general = {
				adjustment-method = "randr";
				brightness-day = 1.0;
				brightness-night = 0.8;
			};
		};
	};
}
