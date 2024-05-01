using Test, Aqua, LibAwsS3, LibAwsCommon

@testset "LibAwsS3" begin
    @testset "aqua" begin
        Aqua.test_all(LibAwsS3, ambiguities=false)
        Aqua.test_ambiguities(LibAwsS3)
    end
    @testset "basic usage to test the library loads" begin
        alloc = aws_default_allocator() # important! this shouldn't need to be qualified! if we generate a definition for it in LibAwsS3 that is a bug.
        aws_s3_library_init(alloc)
    end
end
