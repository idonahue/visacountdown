# COUNTRY_LIST = YAML.load_file("#{Rails.root}/config/countries.yml")
POLICIES = YAML.load_file("#{Rails.root}/config/policies.yml")

COUNTRIES = (["None"] + POLICIES["Schengen area"]["policies"].keys.sort - ["None"])
SCHENGEN = %w(Austria Belgium Czech\ Republic Denmark Estonia Finland France Germany Greece Hungary Iceland Italy Latvia Lithuania Luxembourg Malta Netherlands Norway Poland Portugal Slovakia Slovenia Spain Sweden Switzerland Liechtenstein)
ZONES = POLICIES.keys.sort
