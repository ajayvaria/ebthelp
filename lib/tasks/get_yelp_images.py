import csv
import rauth


def get_search_parameters(address, zipcode):
  #See the Yelp API for more details
  params = {}
  params["location"] = "{},San Francisco, CA {}".format(str(address),str(zipcode))
  params["radius_filter"] = "1"
  params["limit"] = "20" 
  return params


def get_results(params):
  consumer_key = "wV-vxRevtHiwwPSCtyMa9g"
  consumer_secret = "PLsbGN00G5fkrCZWouBtFS8ibM0"
  token = "YIgyQjZ4SifLAwXivDMCJcAs3hgGI3GT"
  token_secret = "-6-Hn_Sv_8-I_2VwYLeIrj2hycE"
   
  session = rauth.OAuth1Session(
    consumer_key = consumer_key
    ,consumer_secret = consumer_secret
    ,access_token = token
    ,access_token_secret = token_secret)
     
  request = session.get("http://api.yelp.com/v2/search",params=params)
   
  data = request.json()
  session.close()
   
  return data


locations = []
with open('datafiles/foodlocations.csv', 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        locations.append([row['Address'], row['Zip'], row['Id'], row['Name']])

api_calls = []
i = 0
for address, zipcode, id_num, name in locations:
    params = get_search_parameters(address,zipcode)
    res = get_results(params)
    try:
        businesses = res['businesses']

        for business in businesses:
            image_url = business['image_url']
            yelp_id = business['id']
            if name.split()[0].lower() in yelp_id:
                print ",".join([yelp_id, image_url, address, zipcode, name])
                break
            # print ",".join([yelp_id, image_url, address, zipcode, name])

        i += 1
        if i % 20 == 0:
            sleep(2)
    except:
        continue
