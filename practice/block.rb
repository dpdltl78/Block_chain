
require 'securerandom' #for wallet address 

class BlockChain #클래스 선언시 반드시 대문자 
	#BlockChain 
	#transaction
	def initialize
		@chain=[]
		@transaction=[]
		@wallet = {}#해쉬 
	end

	def make_wallet #만드는데 시간이 오래걸리면 안된다.
		new_wallet_address=SecureRandom.uuid
		@wallet[new_wallet_address]= 1000
		#@wallet
		new_wallet_address
	end


	def trans(sender,recv,amount)
		if @wallet[sender].nil?
			"없는 발신자 지갑입니다."
		elsif @wallet[recv].nil?
			"없는 수신자 지갑입니다."
		elsif @wallet[sender].to_f < amount.to_f
			"잔액이 부족합니다."
		else
		t={
			"sender"=>sender,
			"receiver"=>recv,
			"amount"=>amount
		}
		@wallet[recv]=@wallet[recv]-amount.to_f
		@wallet[sender]=@wallet[sender]+amount.to_f
		
		@transaction <<t
		"거래완료"
		end
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
			"time" => Time.now.to_i,
			"transaction"=>@transaction,
			"wallet"=>@wallet
		}
		puts block
		@chain<<block
		@transaction=[]
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
	def show_all_wallet
		@wallet
	end
end