require 'digest'

class Blockchain
	def initialize #초기화 함수 
		@number_of_blocks = 1 #골뱅이가 붙은 것들은 글로벌 변수 
		@chain = Array.new
	end

	def mining
		# history = []
		# @number_of_blocks += 1 #골뱅이가 붙은 것들은 글로벌 변수 
		#if @number_of_blocks <100
		# begin
		# 	nonce = rand(100000)
		# 	#hashed = Digest::SHA256.hexdigest(last_block.to_s)
		# 	hashed = Digest::SHA256.hexdigest(nonce.to_s)#.to_json
			
		# 	#
		# 	history << nonce #same as history.push(nonce)
		# end while hashed[0..2] != '000' #아니라서 한바뀌 더 돈다. 같으면 탈출 
		#0이랑 같은 경우에 마이닝 성공!
		#history
		#end
	bb ={:index=>@chain.length+1}
	# block = 
	#  {
	# # 	'index' => @chain.length + 1, #번호는 기존의 체인보다 하나더 많은 번호 
	# # 	'time' => Time.now.to_i,
	# # 	'nonce' => nonce,
	# # 	'previous_block'=>Digest::SHA256.hexdigest(JSON.dump(last_block))
	# }
    @chain.push(bb)

	end

	def my_blocks
		@number_of_blocks.to_s
	end
	def current_chain
		@chain
	end

	def last_block
		@chain[-1]
	end
end

# class Dog
# 	def initialize
# 		@weight = 0.5
# 	def eat
# 		puts "먹는다"
# 	end
# end