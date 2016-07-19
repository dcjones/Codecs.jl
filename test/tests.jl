n = [1, 4, 7, 9, 11, 17, 243, 5247, 9999999999]

print("Testing Base64 encode/decode ...")
@test reinterpret(Int, decode(Base64, encode(Base64, reinterpret(UInt8, n)))) == n
println("... [DONE]")

# TODO: Add ZLib tests

print("Testing BCD encode/decode ...")
for i in n
    @test decode(BCD, encode(BCD, i)) == i
    @test decode(BCD, encode(BCD, i, true), true) == i
end
println("... [DONE]")

print("Testing Base58 encode/decode ...")
for i in n
	@test decode(Base58, encode(Base58, i)) == i
end
println("... [DONE]")
