import json
import urllib.parse
import boto3
import gzip
import csv
import urllib.parse as urllib3
from ua_parser import user_agent_parser
from collections import defaultdict, Counter

print('Loading function')

s3 = boto3.client('s3')
CRAWLER_UAS = {
	'Tiny%2520Tiny': 'TTRSS',
	'ltx': 'LTX71.com',
	'PocketParser': 'Pocket',
	'Screaming%2520Frog': 'ScreamingFrogSEOSpider',
	'Ruby,%2520Twurly': 'Twurly.org',
	'elefent': 'Elefent',
	'Java': 'Java',
	'HTTPClient': 'HTTPClient',
	'WhatsApp': 'WhatsApp',
	'Slack-ImgProxy': 'Slack',
	'newspaper': 'codelucas/newspaper',
	'node-superagent': 'node-superagent',
	'Wget': 'Wget',
	'uclassify.com': 'uclassify.com',
	'Google-AMPHTML': 'Google-AMP',
	'Ocarinabot': 'Ocarinabot',
	'WordPress': 'WordPress',
	'TelegramBot': 'TelegramBot',
	'unfurlist': 'https://github.com/Doist/unfurlist',
	'CCBot': 'commoncrawl.org',
	'LivelapBot': 'LivelapBot',
	'curl': 'curl',
	'python-requests': 'python-requests',
	'SMUrlExpander': 'SMUrlExpander',
	'Microsoft%2520Office': 'MS Office',
	'Apache-Http': 'Apache-Http',
	'AppleNews': 'AppleNewsBot',
	'CakePHP': 'CakePHP',
	'Confluence': 'Confluence',
	'Crowsnest': 'Crowsnest.tv',
	'Digg': 'Digg',
	'Iframely': 'Iframely',
	'Mechanize': 'sparklemotion/Mechanize',
	'Faraday': 'lostisland/Faraday',
	'MetaInspector': 'jaimeiniesta/metainspector',
	'xURL': 'xURL',
	'Trendsmap': 'Trendsmap.com',
	'GigablastOpenSource': 'GigablastOpenSource',
	'Friendica': 'Friendica',
	'HubSpot': 'HubSpot',
	'Go-http-client': 'Go http',
	'GuzzleHttp': 'GuzzleHttp (php)',
	'GNU%2520social': 'GNU social',
	'simplereach': 'simplereach.com',
	'hackney': 'benoitc/hackney',
	'postActiv': 'postActiv.com',
	'XING': 'XING bot',
	'Pearltrees': 'Pearltrees',
	'okhttp': 'square/okhttp',
	'KOCMOHABT': 'kozmonavt.tk',
	'topicaxis': 'topicaxis.com',
	'Mediametric': 'Mediametric',
	'Upflow': 'Upflow.co',
	'Mention': 'Mention',
	'NetTrack': 'NetTrack.info',
	'git': 'git',
	'Hatena': 'Hatena',
	'node-fetch': 'node-fetch',
	'Grammarly': 'Grammarly',
	'mozilla': 'mozilla',
	'-': 'unspecified',
	'Ruby': 'Ruby',
	'request.js': 'request.js',
	'Feedly': 'Feedly',
	'Nuzzel': 'Nuzzel.com',
}

def parse_crawlers(ua):
	# detect common crawling software
	decoded_ua = urllib3.unquote(urllib3.unquote(ua))
	ua_parts = user_agent_parser.Parse(decoded_ua)
	if ua_parts['device']['family'] == 'Spider':
		return ua_parts['user_agent']['family']
	if ua.startswith('http.rb'):
		if 'Mastodon' in ua:
			return 'Mastodon'
		return 'ruby'
	for prefix, agent in CRAWLER_UAS.items():
		if ua.startswith(prefix):
			return agent
	if 'aiohttp' in ua:
		return 'aiohttp'
	return ''

def read_file_content(log_file):
	organized_file_content={}
	with gzip.open(log_file, 'rt') as csv_file:
		firstline = csv_file.readline()
		if firstline == '#Version: 1.0\n':
			FieldLine = csv_file.readline().split(' ')
			fieldnames = FieldLine[1:]
			csv_reader = csv.DictReader(csv_file, delimiter= "\t", fieldnames=fieldnames)
			row_count = 0
			for row in csv_reader:
				row_count += 1
				organized_file_content[row_count] = row
		else:
			raise ValueError('First line of the file does not follow log format, check files')
	return organized_file_content

def get_stats(file_content):
	stats = defaultdict(list)
	stats['Hits'] = 0
	stats['Bot Hits'] = 0
	stats['Human_Hits'] = 0
	visits = []
	referers = []
	countries = []
	for item, value in file_content.items():
		Status = value['sc-status']
		if Status == '200':
			UserAgent = value['cs(User-Agent)']
			Referer = value['cs(Referer)']
			Page = value['cs-uri-stem']
			Country = value['x-edge-location']
			if '/static' in Page or '/favicon' in Page:
				pass
			else:
				if '/static' not in Page and '/favicon'not in Page:
					visits.append(Page)
				if '/static' not in Referer and '/favicon' not in Referer:	
					referers.append(Referer)
				countries.append(Country)
				stats['Hits'] +=1
				if parse_crawlers(UserAgent) != '':
					stats['Bot Hits']+=1
				else:
					stats['Human_Hits']+=1  
	stats['Visits'] = Counter(visits)
	stats['Referers'] = Counter(referers)
	stats['Countries']= Counter(countries)
	liststats = defaultdict(int)
	for i in stats:
		if isinstance(stats[i], int):
			k ,v =i, stats[i]
			liststats[k] = v
		else:
			for s in stats[i]:
				k,v = i+"_"+s, stats[i][s]
				liststats[k] = v
	return liststats

def transform_stats(stats):
	metric_list = []
	for k,v in stats.items():
		my_dict = {  'MetricName': k,
			'Unit': 'None',
			'Value':  v  
		}
		metric_list.append(my_dict)
	return metric_list

def get_logs(bucket,key):
	response = s3.get_object(Bucket=bucket, Key=key)
	print("CONTENT TYPE: " + response['ContentType'])
	file_name = '/tmp/logs.gz'
	file = s3.download_file(bucket,key,file_name)
	file_content = read_file_content(file_name)
	parsed = get_stats(file_content)
	data_string = json.dumps(transform_stats(parsed), sort_keys=True,indent=4)
	data_list = json.loads(data_string)
	print(data_list)
	return data_list

def put_cloudwatch_metric(data_list):
	batches = create_batches(data_list, 15)
	for batch in batches:
		metric = cloudwatch.put_metric_data(
			MetricData = batch,
			Namespace = 'WhoTracksMe'
		)
	return metric

def delete_logs(bucket,key):
	response = s3.delete_object(Bucket=bucket, Key=key)
	return response

def create_batches(iterable,size):
	for i in range(0, len(iterable), size):
		yield iterable[i:i+size]

def lambda_handler(event, context):	
	# Get the object from the event, add metrics and delete the object
	bucket = event['Records'][0]['s3']['bucket']['name']
	key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
	cloudwatch = boto3.client('cloudwatch')
	try:
		log_entry = get_logs(bucket,key)
		put_cloudwatch_metric(log_entry)
		delete_logs(bucket,key)
		return True
	except Exception as e:
		print(e)
		print('Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.'.format(key, bucket))
		raise e 