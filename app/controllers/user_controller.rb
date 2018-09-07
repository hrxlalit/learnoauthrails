class UserController < ApplicationController
	def index
     binding.pry
     response=%x{ twurl -H upload.twitter.com "/1.1/media/upload.json" -d "command=INIT&media_type=video/mp4&total_bytes=788493" }
     med_id=eval(response).values_at(:media_id)[0]
     binding.pry
     %x{twurl -H upload.twitter.com "/1.1/media/upload.json" -d "command=APPEND&media_id=#{med_id}&segment_index=0" --file /home/administrator/Downloads/s.mp4 --file-field "media"}
     %x{twurl -H upload.twitter.com "/1.1/media/upload.json" -d "command=FINALIZE&media_id=#{med_id}"}
	 binding.pry
	 responsemedia = %x{ twurl "/1.1/statuses/update.json" -d "media_ids=#{med_id}&status=Testing Twitter Api"}
	 p "======================================================================================================="
	 p responsemedia
	 p "======================================================================================================="
	end
end
