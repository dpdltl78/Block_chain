
class BlockChain #클래스 선언시 반드시 대문자 
	#BlockChain 
	#transaction
	def initialize
		@chain=[]
	end

	def mining

		nonce = 0
		begin
			nonce = nonce+1
			hashed = Digest::SHA256.hexdigest(nonce.to_s)
		end while hashed[0..3]!="0000"

		block={
			"nonce"=>nonce,
			"index"=>all_chain.length+1,
			"previous_address"=> Digest::SHA256.hexdigest(last_block.to_s),
			"time" => Time.now.to_i
		}
		puts block
		puts "hohoho"
		@chain<<block
		nonce
	end

	def all_chain
		@chain
	end

	def last_block
		@chain[-1]
	end
	def my_blocks
		@number_of_blocks.to_s
	end

		# def all_chain_length
		# 	@chain.length
		# end
end