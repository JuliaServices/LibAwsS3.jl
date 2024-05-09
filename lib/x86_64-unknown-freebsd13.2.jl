using CEnum

"""
    __JL_Ctag_54

Documentation not found.
"""
struct __JL_Ctag_54
    use_double_uri_encode::UInt32
    should_normalize_uri_path::UInt32
    omit_session_token::UInt32
end
function Base.getproperty(x::Ptr{__JL_Ctag_54}, f::Symbol)
    f === :use_double_uri_encode && return (Ptr{UInt32}(x + 0), 0, 1)
    f === :should_normalize_uri_path && return (Ptr{UInt32}(x + 0), 1, 1)
    f === :omit_session_token && return (Ptr{UInt32}(x + 0), 2, 1)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_54, f::Symbol)
    r = Ref{__JL_Ctag_54}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_54}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_54}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


"""
    aws_s3_errors

Documentation not found.
"""
@cenum aws_s3_errors::UInt32 begin
    AWS_ERROR_S3_MISSING_CONTENT_RANGE_HEADER = 14336
    AWS_ERROR_S3_INVALID_CONTENT_RANGE_HEADER = 14337
    AWS_ERROR_S3_MISSING_CONTENT_LENGTH_HEADER = 14338
    AWS_ERROR_S3_INVALID_CONTENT_LENGTH_HEADER = 14339
    AWS_ERROR_S3_MISSING_ETAG = 14340
    AWS_ERROR_S3_INTERNAL_ERROR = 14341
    AWS_ERROR_S3_SLOW_DOWN = 14342
    AWS_ERROR_S3_INVALID_RESPONSE_STATUS = 14343
    AWS_ERROR_S3_MISSING_UPLOAD_ID = 14344
    AWS_ERROR_S3_PROXY_PARSE_FAILED = 14345
    AWS_ERROR_S3_UNSUPPORTED_PROXY_SCHEME = 14346
    AWS_ERROR_S3_CANCELED = 14347
    AWS_ERROR_S3_INVALID_RANGE_HEADER = 14348
    AWS_ERROR_S3_MULTIRANGE_HEADER_UNSUPPORTED = 14349
    AWS_ERROR_S3_RESPONSE_CHECKSUM_MISMATCH = 14350
    AWS_ERROR_S3_CHECKSUM_CALCULATION_FAILED = 14351
    AWS_ERROR_S3_PAUSED = 14352
    AWS_ERROR_S3_LIST_PARTS_PARSE_FAILED = 14353
    AWS_ERROR_S3_RESUMED_PART_CHECKSUM_MISMATCH = 14354
    AWS_ERROR_S3_RESUME_FAILED = 14355
    AWS_ERROR_S3_OBJECT_MODIFIED = 14356
    AWS_ERROR_S3_NON_RECOVERABLE_ASYNC_ERROR = 14357
    AWS_ERROR_S3_METRIC_DATA_NOT_AVAILABLE = 14358
    AWS_ERROR_S3_INCORRECT_CONTENT_LENGTH = 14359
    AWS_ERROR_S3_REQUEST_TIME_TOO_SKEWED = 14360
    AWS_ERROR_S3_FILE_MODIFIED = 14361
    AWS_ERROR_S3_EXCEEDS_MEMORY_LIMIT = 14362
    AWS_ERROR_S3_INVALID_MEMORY_LIMIT_CONFIG = 14363
    AWS_ERROR_S3EXPRESS_CREATE_SESSION_FAILED = 14364
    AWS_ERROR_S3_INTERNAL_PART_SIZE_MISMATCH_RETRYING_WITH_RANGE = 14365
    AWS_ERROR_S3_REQUEST_HAS_COMPLETED = 14366
    AWS_ERROR_S3_END_RANGE = 15359
end

"""
    aws_s3_subject

Documentation not found.
"""
@cenum aws_s3_subject::UInt32 begin
    AWS_LS_S3_GENERAL = 14336
    AWS_LS_S3_CLIENT = 14337
    AWS_LS_S3_CLIENT_STATS = 14338
    AWS_LS_S3_REQUEST = 14339
    AWS_LS_S3_META_REQUEST = 14340
    AWS_LS_S3_ENDPOINT = 14341
    AWS_LS_S3_LAST = 15359
end

"""
    aws_s3_cpu_group_info

Documentation not found.
"""
struct aws_s3_cpu_group_info
    cpu_group::UInt16
    nic_name_array::Ptr{aws_byte_cursor}
    nic_name_array_length::Csize_t
    cpus_in_group::Csize_t
end

"""
    aws_s3_platform_info

Documentation not found.
"""
struct aws_s3_platform_info
    instance_type::aws_byte_cursor
    max_throughput_gbps::Cdouble
    cpu_group_info_array::Ptr{aws_s3_cpu_group_info}
    cpu_group_info_array_length::Csize_t
    has_recommended_configuration::Bool
end

"""
    aws_s3_library_init(allocator)

Initializes internal datastructures used by aws-c-s3. Must be called before using any functionality in aws-c-s3.

### Prototype
```c
void aws_s3_library_init(struct aws_allocator *allocator);
```
"""
function aws_s3_library_init(allocator)
    ccall((:aws_s3_library_init, libaws_c_s3), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_s3_library_clean_up()

Shuts down the internal datastructures used by aws-c-s3.

### Prototype
```c
void aws_s3_library_clean_up(void);
```
"""
function aws_s3_library_clean_up()
    ccall((:aws_s3_library_clean_up, libaws_c_s3), Cvoid, ())
end

"""
    aws_s3_get_current_platform_info()

Documentation not found.
### Prototype
```c
const struct aws_s3_platform_info *aws_s3_get_current_platform_info(void);
```
"""
function aws_s3_get_current_platform_info()
    ccall((:aws_s3_get_current_platform_info, libaws_c_s3), Ptr{aws_s3_platform_info}, ())
end

"""
    aws_s3_get_current_platform_ec2_intance_type(cached_only)

Documentation not found.
### Prototype
```c
struct aws_byte_cursor aws_s3_get_current_platform_ec2_intance_type(bool cached_only);
```
"""
function aws_s3_get_current_platform_ec2_intance_type(cached_only)
    ccall((:aws_s3_get_current_platform_ec2_intance_type, libaws_c_s3), aws_byte_cursor, (Bool,), cached_only)
end

"""
    aws_s3_get_platforms_with_recommended_config()

Documentation not found.
### Prototype
```c
struct aws_array_list aws_s3_get_platforms_with_recommended_config(void);
```
"""
function aws_s3_get_platforms_with_recommended_config()
    ccall((:aws_s3_get_platforms_with_recommended_config, libaws_c_s3), aws_array_list, ())
end

"""
Documentation not found.
"""
mutable struct aws_s3_client end

"""
Documentation not found.
"""
mutable struct aws_s3_request end

"""
Documentation not found.
"""
mutable struct aws_s3_meta_request end

"""
Documentation not found.
"""
mutable struct aws_s3_request_metrics end

"""
    aws_s3_meta_request_type

A Meta Request represents a group of generated requests that are being done on behalf of the original request. For example, one large GetObject request can be transformed into a series of ranged GetObject requests that are executed in parallel to improve throughput.

The [`aws_s3_meta_request_type`](@ref) is a hint of transformation to be applied.
"""
@cenum aws_s3_meta_request_type::UInt32 begin
    AWS_S3_META_REQUEST_TYPE_DEFAULT = 0
    AWS_S3_META_REQUEST_TYPE_GET_OBJECT = 1
    AWS_S3_META_REQUEST_TYPE_PUT_OBJECT = 2
    AWS_S3_META_REQUEST_TYPE_COPY_OBJECT = 3
    AWS_S3_META_REQUEST_TYPE_MAX = 4
end

"""
    aws_s3_request_type

The type of a single S3 HTTP request. Used by metrics. A meta-request can make multiple S3 HTTP requests under the hood.

For example, AWS\\_S3\\_META\\_REQUEST\\_TYPE\\_PUT\\_OBJECT for a large file will do multipart upload, resulting in 3+ HTTP requests: AWS\\_S3\\_REQUEST\\_TYPE\\_CREATE\\_MULTIPART\\_UPLOAD, one or more AWS\\_S3\\_REQUEST\\_TYPE\\_UPLOAD\\_PART, and finally AWS\\_S3\\_REQUEST\\_TYPE\\_COMPLETE\\_MULTIPART\\_UPLOAD.

[`aws_s3_request_type_operation_name`](@ref)() returns the S3 operation name for types that map (e.g. AWS\\_S3\\_REQUEST\\_TYPE\\_HEAD\\_OBJECT -> "HeadObject"), or empty string for types that don't map (e.g. AWS\\_S3\\_REQUEST\\_TYPE\\_UNKNOWN -> "").
"""
@cenum aws_s3_request_type::UInt32 begin
    AWS_S3_REQUEST_TYPE_UNKNOWN = 0
    AWS_S3_REQUEST_TYPE_HEAD_OBJECT = 1
    AWS_S3_REQUEST_TYPE_GET_OBJECT = 2
    AWS_S3_REQUEST_TYPE_LIST_PARTS = 3
    AWS_S3_REQUEST_TYPE_CREATE_MULTIPART_UPLOAD = 4
    AWS_S3_REQUEST_TYPE_UPLOAD_PART = 5
    AWS_S3_REQUEST_TYPE_ABORT_MULTIPART_UPLOAD = 6
    AWS_S3_REQUEST_TYPE_COMPLETE_MULTIPART_UPLOAD = 7
    AWS_S3_REQUEST_TYPE_UPLOAD_PART_COPY = 8
    AWS_S3_REQUEST_TYPE_COPY_OBJECT = 9
    AWS_S3_REQUEST_TYPE_PUT_OBJECT = 10
    AWS_S3_REQUEST_TYPE_MAX = 11
    AWS_S3_REQUEST_TYPE_DEFAULT = 0
end

# typedef int ( aws_s3_meta_request_headers_callback_fn ) ( struct aws_s3_meta_request * meta_request , const struct aws_http_headers * headers , int response_status , void * user_data )
"""
Invoked to provide response headers received during execution of the meta request, both for success and error HTTP status codes.

Return AWS\\_OP\\_SUCCESS to continue processing the request.

Return aws\\_raise\\_error(E) to cancel the request. The error you raise will be reflected in `[`aws_s3_meta_request_result`](@ref).error\\_code`. If you're not sure which error to raise, use AWS\\_ERROR\\_S3\\_CANCELED.
"""
const aws_s3_meta_request_headers_callback_fn = Cvoid

# typedef int ( aws_s3_meta_request_receive_body_callback_fn ) ( /* The meta request that the callback is being issued for. */ struct aws_s3_meta_request * meta_request , /* The body data for this chunk of the object. */ const struct aws_byte_cursor * body , /* The byte index of the object that this refers to. For example, for an HTTP message that has a range header, the
#       first chunk received will have a range_start that matches the range header's range-start.*/ uint64_t range_start , /* User data specified by aws_s3_meta_request_options.*/ void * user_data )
"""
Invoked to provide the response body as it is received.

Note: If you set `enable_read_backpressure` true on the S3 client, you must maintain the flow-control window. The flow-control window shrinks as you receive body data via this callback. Whenever the flow-control window reaches 0 you will stop downloading data. Use [`aws_s3_meta_request_increment_read_window`](@ref)() to increment the window and keep data flowing. Maintain a larger window to keep up a high download throughput, parts cannot download in parallel unless the window is large enough to hold multiple parts. Maintain a smaller window to limit the amount of data buffered in memory.

If `manual_window_management` is false, you do not need to maintain the flow-control window. No back-pressure is applied and data arrives as fast as possible.

Return AWS\\_OP\\_SUCCESS to continue processing the request.

Return aws\\_raise\\_error(E) to cancel the request. The error you raise will be reflected in `[`aws_s3_meta_request_result`](@ref).error\\_code`. If you're not sure which error to raise, use AWS\\_ERROR\\_S3\\_CANCELED.
"""
const aws_s3_meta_request_receive_body_callback_fn = Cvoid

# typedef void ( aws_s3_meta_request_finish_fn ) ( struct aws_s3_meta_request * meta_request , const struct aws_s3_meta_request_result * meta_request_result , void * user_data )
"""
Invoked when the entire meta request execution is complete.
"""
const aws_s3_meta_request_finish_fn = Cvoid

"""
    aws_s3_meta_request_progress

Information sent in the meta\\_request progress callback.
"""
struct aws_s3_meta_request_progress
    bytes_transferred::UInt64
    content_length::UInt64
end

# typedef void ( aws_s3_meta_request_progress_fn ) ( struct aws_s3_meta_request * meta_request , const struct aws_s3_meta_request_progress * progress , void * user_data )
"""
Invoked to report progress of a meta-request. For PutObject, progress refers to bytes uploaded. For CopyObject, progress refers to bytes copied. For GetObject, progress refers to bytes downloaded. For anything else, progress refers to response body bytes received.
"""
const aws_s3_meta_request_progress_fn = Cvoid

# typedef void ( aws_s3_meta_request_telemetry_fn ) ( struct aws_s3_meta_request * meta_request , struct aws_s3_request_metrics * metrics , void * user_data )
"""
Invoked to report the telemetry of the meta request once a single request finishes. Note: *metrics is only valid for the duration of the callback. If you need to keep it around, use [`aws_s3_request_metrics_acquire`](@ref)
"""
const aws_s3_meta_request_telemetry_fn = Cvoid

# typedef void ( aws_s3_meta_request_shutdown_fn ) ( void * user_data )
"""
Documentation not found.
"""
const aws_s3_meta_request_shutdown_fn = Cvoid

# typedef void ( aws_s3_client_shutdown_complete_callback_fn ) ( void * user_data )
"""
Documentation not found.
"""
const aws_s3_client_shutdown_complete_callback_fn = Cvoid

"""
    aws_s3_meta_request_tls_mode

Documentation not found.
"""
@cenum aws_s3_meta_request_tls_mode::UInt32 begin
    AWS_MR_TLS_ENABLED = 0
    AWS_MR_TLS_DISABLED = 1
end

"""
    aws_s3_meta_request_compute_content_md5

Documentation not found.
"""
@cenum aws_s3_meta_request_compute_content_md5::UInt32 begin
    AWS_MR_CONTENT_MD5_DISABLED = 0
    AWS_MR_CONTENT_MD5_ENABLED = 1
end

"""
    aws_s3_checksum_algorithm

Documentation not found.
"""
@cenum aws_s3_checksum_algorithm::UInt32 begin
    AWS_SCA_NONE = 0
    AWS_SCA_INIT = 1
    AWS_SCA_CRC32C = 1
    AWS_SCA_CRC32 = 2
    AWS_SCA_SHA1 = 3
    AWS_SCA_SHA256 = 4
    AWS_SCA_END = 4
end

"""
    aws_s3_checksum_location

Documentation not found.
"""
@cenum aws_s3_checksum_location::UInt32 begin
    AWS_SCL_NONE = 0
    AWS_SCL_HEADER = 1
    AWS_SCL_TRAILER = 2
end

"""
    aws_s3_upload_part_review

Info about a single part, for you to review before the upload completes.
"""
struct aws_s3_upload_part_review
    size::UInt64
    checksum::aws_byte_cursor
end

"""
    aws_s3_upload_review

Info for you to review before an upload completes.

WARNING: This feature is experimental/unstable. At this time, review is only available for multipart upload (when Content-Length is above the `multipart_upload_threshold`, or Content-Length not specified).
"""
struct aws_s3_upload_review
    checksum_algorithm::aws_s3_checksum_algorithm
    part_count::Csize_t
    part_array::Ptr{aws_s3_upload_part_review}
end

# typedef int ( aws_s3_meta_request_upload_review_fn ) ( struct aws_s3_meta_request * meta_request , const struct aws_s3_upload_review * review , void * user_data )
"""
Optional callback, for you to review an upload before it completes. For example, you can review each part's checksum and fail the upload if you do not agree with them.

Return AWS\\_OP\\_SUCCESS to continue processing the request.

Return aws\\_raise\\_error(E) to cancel the request. The error you raise will be reflected in `[`aws_s3_meta_request_result`](@ref).error\\_code`. If you're not sure which error to raise, use AWS\\_ERROR\\_S3\\_CANCELED.

WARNING: This feature is experimental/unstable. At this time, the callback is only invoked for multipart upload (when Content-Length is above the `multipart_upload_threshold`, or Content-Length not specified).

# Arguments
* `meta_request`: pointer to the [`aws_s3_meta_request`](@ref) of the upload.
* `info`: Detailed info about the upload.
"""
const aws_s3_meta_request_upload_review_fn = Cvoid

# typedef struct aws_s3express_credentials_provider * ( aws_s3express_provider_factory_fn ) ( struct aws_allocator * allocator , struct aws_s3_client * client , aws_simple_completion_callback on_provider_shutdown_callback , void * shutdown_user_data , void * factory_user_data )
"""
The factory function for S3 client to create a S3 Express credentials provider. The S3 client will be the only owner of the S3 Express credentials provider.

During S3 client destruction, S3 client will start the destruction of the provider, and wait the on\\_provider\\_shutdown\\_callback to be invoked before the S3 client finish destruction.

Note to implement the factory properly: - Make sure `on_provider_shutdown_callback` will be invoked after the provider finish shutdown, otherwise, leak will happen. - The provider must not acquire a reference to the client; otherwise, a circular reference will cause a deadlock. - The `client` provided CANNOT be used within the factory function call or the destructor.

# Arguments
* `allocator`: memory allocator to create the provider.
* `client`: The S3 client uses and owns the provider.
* `on_provider_shutdown_callback`: The callback to be invoked when the provider finishes shutdown.
* `shutdown_user_data`: The user data to invoke shutdown callback with
* `user_data`: The user data with the factory
# Returns
The [`aws_s3express_credentials_provider`](@ref).
"""
const aws_s3express_provider_factory_fn = Cvoid

"""
    aws_s3_tcp_keep_alive_options

Documentation not found.
"""
struct aws_s3_tcp_keep_alive_options
    keep_alive_interval_sec::UInt16
    keep_alive_timeout_sec::UInt16
    keep_alive_max_failed_probes::UInt16
end

"""
    aws_s3_client_config

Documentation not found.
"""
struct aws_s3_client_config
    max_active_connections_override::UInt32
    region::aws_byte_cursor
    client_bootstrap::Ptr{aws_client_bootstrap}
    tls_mode::aws_s3_meta_request_tls_mode
    tls_connection_options::Ptr{aws_tls_connection_options}
    signing_config::Ptr{aws_signing_config_aws}
    part_size::UInt64
    max_part_size::UInt64
    multipart_upload_threshold::UInt64
    throughput_target_gbps::Cdouble
    memory_limit_in_bytes::UInt64
    retry_strategy::Ptr{aws_retry_strategy}
    compute_content_md5::aws_s3_meta_request_compute_content_md5
    shutdown_callback::Ptr{aws_s3_client_shutdown_complete_callback_fn}
    shutdown_callback_user_data::Ptr{Cvoid}
    proxy_options::Ptr{aws_http_proxy_options}
    proxy_ev_settings::Ptr{proxy_env_var_settings}
    connect_timeout_ms::UInt32
    tcp_keep_alive_options::Ptr{aws_s3_tcp_keep_alive_options}
    monitoring_options::Ptr{aws_http_connection_monitoring_options}
    enable_read_backpressure::Bool
    initial_read_window::Csize_t
    enable_s3express::Bool
    s3express_provider_override_factory::Ptr{aws_s3express_provider_factory_fn}
    factory_user_data::Ptr{Cvoid}
end

"""
    aws_s3_checksum_config

Documentation not found.
"""
struct aws_s3_checksum_config
    location::aws_s3_checksum_location
    checksum_algorithm::aws_s3_checksum_algorithm
    validate_response_checksum::Bool
    validate_checksum_algorithms::Ptr{aws_array_list}
end

"""
Documentation not found.
"""
mutable struct aws_s3_meta_request_resume_token end

"""
    aws_s3_meta_request_options

Options for a new meta request, ie, file transfer that will be handled by the high performance client.

There are several ways to pass the request's body data: 1) If the data is already in memory, set the body-stream on `message`. 2) If the data is on disk, set `send_filepath` for best performance. 3) If the data is available, but copying each chunk is asynchronous, set `send_async_stream`. 4) If you're not sure when each chunk of data will be available, use `send_using_async_writes`.
"""
struct aws_s3_meta_request_options
    type::aws_s3_meta_request_type
    operation_name::aws_byte_cursor
    signing_config::Ptr{aws_signing_config_aws}
    message::Ptr{aws_http_message}
    send_filepath::aws_byte_cursor
    send_async_stream::Ptr{aws_async_input_stream}
    send_using_async_writes::Bool
    checksum_config::Ptr{aws_s3_checksum_config}
    part_size::UInt64
    multipart_upload_threshold::UInt64
    user_data::Ptr{Cvoid}
    headers_callback::Ptr{aws_s3_meta_request_headers_callback_fn}
    body_callback::Ptr{aws_s3_meta_request_receive_body_callback_fn}
    finish_callback::Ptr{aws_s3_meta_request_finish_fn}
    shutdown_callback::Ptr{aws_s3_meta_request_shutdown_fn}
    progress_callback::Ptr{aws_s3_meta_request_progress_fn}
    telemetry_callback::Ptr{aws_s3_meta_request_telemetry_fn}
    upload_review_callback::Ptr{aws_s3_meta_request_upload_review_fn}
    endpoint::Ptr{aws_uri}
    resume_token::Ptr{aws_s3_meta_request_resume_token}
    object_size_hint::Ptr{UInt64}
end

"""
    aws_s3_meta_request_result

Documentation not found.
"""
struct aws_s3_meta_request_result
    error_response_headers::Ptr{aws_http_headers}
    error_response_body::Ptr{aws_byte_buf}
    error_response_operation_name::Ptr{aws_string}
    response_status::Cint
    did_validate::Bool
    validation_algorithm::aws_s3_checksum_algorithm
    error_code::Cint
end

"""
    aws_s3_client_new(allocator, client_config)

Documentation not found.
### Prototype
```c
struct aws_s3_client *aws_s3_client_new( struct aws_allocator *allocator, const struct aws_s3_client_config *client_config);
```
"""
function aws_s3_client_new(allocator, client_config)
    ccall((:aws_s3_client_new, libaws_c_s3), Ptr{aws_s3_client}, (Ptr{aws_allocator}, Ptr{aws_s3_client_config}), allocator, client_config)
end

"""
    aws_s3_client_acquire(client)

Add a reference, keeping this object alive. The reference must be released when you are done with it, or it's memory will never be cleaned up. You must not pass in NULL. Always returns the same pointer that was passed in.

### Prototype
```c
struct aws_s3_client *aws_s3_client_acquire(struct aws_s3_client *client);
```
"""
function aws_s3_client_acquire(client)
    ccall((:aws_s3_client_acquire, libaws_c_s3), Ptr{aws_s3_client}, (Ptr{aws_s3_client},), client)
end

"""
    aws_s3_client_release(client)

Release a reference. When the reference count drops to 0, this object will be cleaned up. It's OK to pass in NULL (nothing happens). Always returns NULL.

### Prototype
```c
struct aws_s3_client *aws_s3_client_release(struct aws_s3_client *client);
```
"""
function aws_s3_client_release(client)
    ccall((:aws_s3_client_release, libaws_c_s3), Ptr{aws_s3_client}, (Ptr{aws_s3_client},), client)
end

"""
    aws_s3_client_make_meta_request(client, options)

Documentation not found.
### Prototype
```c
struct aws_s3_meta_request *aws_s3_client_make_meta_request( struct aws_s3_client *client, const struct aws_s3_meta_request_options *options);
```
"""
function aws_s3_client_make_meta_request(client, options)
    ccall((:aws_s3_client_make_meta_request, libaws_c_s3), Ptr{aws_s3_meta_request}, (Ptr{aws_s3_client}, Ptr{aws_s3_meta_request_options}), client, options)
end

"""
    aws_s3_meta_request_write(meta_request, data, eof)

Write the next chunk of data.

You must set `[`aws_s3_meta_request_options`](@ref).send\\_using\\_async\\_writes` to use this function.

This function is asynchronous, and returns a future (see <aws/io/future.h>). You may not call write() again until the future completes.

If the future completes with an error code, then write() did not succeed and you should not call it again. If the future contains any error code, the meta request is guaranteed to finish soon (you don't need to worry about canceling the meta request yourself after a failed write). A common error code is AWS\\_ERROR\\_S3\\_REQUEST\\_HAS\\_COMPLETED, indicating the meta request completed for reasons unrelated to the write() call (e.g. CreateMultipartUpload received a 403 Forbidden response). AWS\\_ERROR\\_INVALID\\_STATE usually indicates that you're calling write() incorrectly (e.g. not waiting for previous write to complete).

You MUST keep the data in memory until the future completes. If you need to free the memory early, call [`aws_s3_meta_request_cancel`](@ref)(). cancel() will synchronously complete the future from any pending write with error code AWS\\_ERROR\\_S3\\_REQUEST\\_HAS\\_COMPLETED.

You can wait any length of time between calls to write(). If there's not enough data to upload a part, the data will be copied to a buffer and the future will immediately complete.

This function never returns NULL.

WARNING: This feature is experimental.

# Arguments
* `meta_request`: Meta request
* `data`: The data to send. The data can be any size.
* `eof`: Pass true to signal EOF (end of file). Do not call write() again after passing true.
### Prototype
```c
struct aws_future_void *aws_s3_meta_request_write( struct aws_s3_meta_request *meta_request, struct aws_byte_cursor data, bool eof);
```
"""
function aws_s3_meta_request_write(meta_request, data, eof)
    ccall((:aws_s3_meta_request_write, libaws_c_s3), Ptr{aws_future_void}, (Ptr{aws_s3_meta_request}, aws_byte_cursor, Bool), meta_request, data, eof)
end

"""
    aws_s3_meta_request_increment_read_window(meta_request, bytes)

Increment the flow-control window, so that response data continues downloading.

If the client was created with `enable_read_backpressure` set true, each meta request has a flow-control window that shrinks as response body data is downloaded (headers do not affect the size of the window). The client's `initial_read_window` determines the starting size of each meta request's window. If a meta request's flow-control window reaches 0, no further data will be downloaded. If the `initial_read_window` is 0, the request will not start until the window is incremented. Maintain a larger window to keep up a high download throughput, parts cannot download in parallel unless the window is large enough to hold multiple parts. Maintain a smaller window to limit the amount of data buffered in memory.

If `enable_read_backpressure` is false this call will have no effect, no backpressure is being applied and data is being downloaded as fast as possible.

WARNING: This feature is experimental. Currently, backpressure is only applied to GetObject requests which are split into multiple parts, and you may still receive some data after the window reaches 0.

### Prototype
```c
void aws_s3_meta_request_increment_read_window(struct aws_s3_meta_request *meta_request, uint64_t bytes);
```
"""
function aws_s3_meta_request_increment_read_window(meta_request, bytes)
    ccall((:aws_s3_meta_request_increment_read_window, libaws_c_s3), Cvoid, (Ptr{aws_s3_meta_request}, UInt64), meta_request, bytes)
end

"""
    aws_s3_meta_request_cancel(meta_request)

Documentation not found.
### Prototype
```c
void aws_s3_meta_request_cancel(struct aws_s3_meta_request *meta_request);
```
"""
function aws_s3_meta_request_cancel(meta_request)
    ccall((:aws_s3_meta_request_cancel, libaws_c_s3), Cvoid, (Ptr{aws_s3_meta_request},), meta_request)
end

"""
    aws_s3_meta_request_pause(meta_request, out_resume_token)

Note: pause is currently only supported on upload requests. In order to pause an ongoing upload, call [`aws_s3_meta_request_pause`](@ref)() that will return resume token. Token can be used to query the state of operation at the pausing time. To resume an upload that was paused, supply resume token in the meta request options structure member [`aws_s3_meta_request_options`](@ref).resume\\_token. The upload can be resumed either from the same client or a different one. Corner cases for resume upload are as follows: - upload is not MPU - fail with AWS\\_ERROR\\_UNSUPPORTED\\_OPERATION - pausing before MPU is created - NULL resume token returned. NULL resume token is equivalent to restarting upload - pausing in the middle of part transfer - return resume token. scheduling of new part uploads stops. - pausing after completeMPU started - return resume token. if s3 cannot find find associated MPU id when resuming with that token and num of parts uploaded equals to total num parts, then operation is a no op. Otherwise operation fails. Note: for no op case the call will succeed and finish/shutdown request callbacks will fire, but on headers callback will not fire. Note: similar to cancel pause does not cancel requests already in flight and and parts might complete after pause is requested.

# Arguments
* `meta_request`: pointer to the [`aws_s3_meta_request`](@ref) of the upload to be paused
* `resume_token`: resume token
# Returns
either AWS\\_OP\\_ERR or AWS\\_OP\\_SUCCESS
### Prototype
```c
int aws_s3_meta_request_pause( struct aws_s3_meta_request *meta_request, struct aws_s3_meta_request_resume_token **out_resume_token);
```
"""
function aws_s3_meta_request_pause(meta_request, out_resume_token)
    ccall((:aws_s3_meta_request_pause, libaws_c_s3), Cint, (Ptr{aws_s3_meta_request}, Ptr{Ptr{aws_s3_meta_request_resume_token}}), meta_request, out_resume_token)
end

"""
    aws_s3_upload_resume_token_options

Documentation not found.
"""
struct aws_s3_upload_resume_token_options
    upload_id::aws_byte_cursor
    part_size::UInt64
    total_num_parts::Csize_t
    num_parts_completed::Csize_t
end

"""
    aws_s3_meta_request_resume_token_new_upload(allocator, options)

Create upload resume token from persisted data. Note: Data required for resume token varies per operation.

### Prototype
```c
struct aws_s3_meta_request_resume_token *aws_s3_meta_request_resume_token_new_upload( struct aws_allocator *allocator, const struct aws_s3_upload_resume_token_options *options);
```
"""
function aws_s3_meta_request_resume_token_new_upload(allocator, options)
    ccall((:aws_s3_meta_request_resume_token_new_upload, libaws_c_s3), Ptr{aws_s3_meta_request_resume_token}, (Ptr{aws_allocator}, Ptr{aws_s3_upload_resume_token_options}), allocator, options)
end

"""
    aws_s3_meta_request_resume_token_acquire(resume_token)

Documentation not found.
### Prototype
```c
struct aws_s3_meta_request_resume_token *aws_s3_meta_request_resume_token_acquire( struct aws_s3_meta_request_resume_token *resume_token);
```
"""
function aws_s3_meta_request_resume_token_acquire(resume_token)
    ccall((:aws_s3_meta_request_resume_token_acquire, libaws_c_s3), Ptr{aws_s3_meta_request_resume_token}, (Ptr{aws_s3_meta_request_resume_token},), resume_token)
end

"""
    aws_s3_meta_request_resume_token_release(resume_token)

Documentation not found.
### Prototype
```c
struct aws_s3_meta_request_resume_token *aws_s3_meta_request_resume_token_release( struct aws_s3_meta_request_resume_token *resume_token);
```
"""
function aws_s3_meta_request_resume_token_release(resume_token)
    ccall((:aws_s3_meta_request_resume_token_release, libaws_c_s3), Ptr{aws_s3_meta_request_resume_token}, (Ptr{aws_s3_meta_request_resume_token},), resume_token)
end

"""
    aws_s3_meta_request_resume_token_type(resume_token)

Documentation not found.
### Prototype
```c
enum aws_s3_meta_request_type aws_s3_meta_request_resume_token_type( struct aws_s3_meta_request_resume_token *resume_token);
```
"""
function aws_s3_meta_request_resume_token_type(resume_token)
    ccall((:aws_s3_meta_request_resume_token_type, libaws_c_s3), aws_s3_meta_request_type, (Ptr{aws_s3_meta_request_resume_token},), resume_token)
end

"""
    aws_s3_meta_request_resume_token_part_size(resume_token)

Documentation not found.
### Prototype
```c
uint64_t aws_s3_meta_request_resume_token_part_size(struct aws_s3_meta_request_resume_token *resume_token);
```
"""
function aws_s3_meta_request_resume_token_part_size(resume_token)
    ccall((:aws_s3_meta_request_resume_token_part_size, libaws_c_s3), UInt64, (Ptr{aws_s3_meta_request_resume_token},), resume_token)
end

"""
    aws_s3_meta_request_resume_token_total_num_parts(resume_token)

Documentation not found.
### Prototype
```c
size_t aws_s3_meta_request_resume_token_total_num_parts(struct aws_s3_meta_request_resume_token *resume_token);
```
"""
function aws_s3_meta_request_resume_token_total_num_parts(resume_token)
    ccall((:aws_s3_meta_request_resume_token_total_num_parts, libaws_c_s3), Csize_t, (Ptr{aws_s3_meta_request_resume_token},), resume_token)
end

"""
    aws_s3_meta_request_resume_token_num_parts_completed(resume_token)

Documentation not found.
### Prototype
```c
size_t aws_s3_meta_request_resume_token_num_parts_completed(struct aws_s3_meta_request_resume_token *resume_token);
```
"""
function aws_s3_meta_request_resume_token_num_parts_completed(resume_token)
    ccall((:aws_s3_meta_request_resume_token_num_parts_completed, libaws_c_s3), Csize_t, (Ptr{aws_s3_meta_request_resume_token},), resume_token)
end

"""
    aws_s3_meta_request_resume_token_upload_id(resume_token)

Documentation not found.
### Prototype
```c
struct aws_byte_cursor aws_s3_meta_request_resume_token_upload_id( struct aws_s3_meta_request_resume_token *resume_token);
```
"""
function aws_s3_meta_request_resume_token_upload_id(resume_token)
    ccall((:aws_s3_meta_request_resume_token_upload_id, libaws_c_s3), aws_byte_cursor, (Ptr{aws_s3_meta_request_resume_token},), resume_token)
end

"""
    aws_s3_meta_request_acquire(meta_request)

Add a reference, keeping this object alive. The reference must be released when you are done with it, or it's memory will never be cleaned up. You must not pass in NULL. Always returns the same pointer that was passed in.

### Prototype
```c
struct aws_s3_meta_request *aws_s3_meta_request_acquire(struct aws_s3_meta_request *meta_request);
```
"""
function aws_s3_meta_request_acquire(meta_request)
    ccall((:aws_s3_meta_request_acquire, libaws_c_s3), Ptr{aws_s3_meta_request}, (Ptr{aws_s3_meta_request},), meta_request)
end

"""
    aws_s3_meta_request_release(meta_request)

Release a reference. When the reference count drops to 0, this object will be cleaned up. It's OK to pass in NULL (nothing happens). Always returns NULL.

### Prototype
```c
struct aws_s3_meta_request *aws_s3_meta_request_release(struct aws_s3_meta_request *meta_request);
```
"""
function aws_s3_meta_request_release(meta_request)
    ccall((:aws_s3_meta_request_release, libaws_c_s3), Ptr{aws_s3_meta_request}, (Ptr{aws_s3_meta_request},), meta_request)
end

"""
    aws_s3_init_default_signing_config(signing_config, region, credentials_provider)

Initialize the configuration for a default S3 signing.

### Prototype
```c
void aws_s3_init_default_signing_config( struct aws_signing_config_aws *signing_config, const struct aws_byte_cursor region, struct aws_credentials_provider *credentials_provider);
```
"""
function aws_s3_init_default_signing_config(signing_config, region, credentials_provider)
    ccall((:aws_s3_init_default_signing_config, libaws_c_s3), Cvoid, (Ptr{aws_signing_config_aws}, aws_byte_cursor, Ptr{aws_credentials_provider}), signing_config, region, credentials_provider)
end

"""
    aws_s3_request_type_operation_name(type)

Return operation name for [`aws_s3_request_type`](@ref), or empty string if the type doesn't map to an actual operation. For example: AWS\\_S3\\_REQUEST\\_TYPE\\_HEAD\\_OBJECT -> "HeadObject" AWS\\_S3\\_REQUEST\\_TYPE\\_UNKNOWN -> "" AWS\\_S3\\_REQUEST\\_TYPE\\_MAX -> ""

### Prototype
```c
const char *aws_s3_request_type_operation_name(enum aws_s3_request_type type);
```
"""
function aws_s3_request_type_operation_name(type)
    ccall((:aws_s3_request_type_operation_name, libaws_c_s3), Ptr{Cchar}, (aws_s3_request_type,), type)
end

"""
    aws_s3_request_metrics_acquire(metrics)

Add a reference, keeping this object alive. The reference must be released when you are done with it, or it's memory will never be cleaned up. Always returns the same pointer that was passed in.

### Prototype
```c
struct aws_s3_request_metrics *aws_s3_request_metrics_acquire(struct aws_s3_request_metrics *metrics);
```
"""
function aws_s3_request_metrics_acquire(metrics)
    ccall((:aws_s3_request_metrics_acquire, libaws_c_s3), Ptr{aws_s3_request_metrics}, (Ptr{aws_s3_request_metrics},), metrics)
end

"""
    aws_s3_request_metrics_release(metrics)

Release a reference. When the reference count drops to 0, this object will be cleaned up. It's OK to pass in NULL (nothing happens). Always returns NULL.

### Prototype
```c
struct aws_s3_request_metrics *aws_s3_request_metrics_release(struct aws_s3_request_metrics *metrics);
```
"""
function aws_s3_request_metrics_release(metrics)
    ccall((:aws_s3_request_metrics_release, libaws_c_s3), Ptr{aws_s3_request_metrics}, (Ptr{aws_s3_request_metrics},), metrics)
end

"""
    aws_s3_request_metrics_get_request_id(metrics, out_request_id)

*********************************** Getters for s3 request metrics ***********************************************

Get the request ID from [`aws_s3_request_metrics`](@ref). If unavailable, AWS\\_ERROR\\_S3\\_METRIC\\_DATA\\_NOT\\_AVAILABLE will be raised. If available, out\\_request\\_id will be set to a string. Be warned this string's lifetime is tied to the metrics object.

### Prototype
```c
int aws_s3_request_metrics_get_request_id( const struct aws_s3_request_metrics *metrics, const struct aws_string **out_request_id);
```
"""
function aws_s3_request_metrics_get_request_id(metrics, out_request_id)
    ccall((:aws_s3_request_metrics_get_request_id, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{Ptr{aws_string}}), metrics, out_request_id)
end

"""
    aws_s3_request_metrics_get_start_timestamp_ns(metrics, out_start_time)

Documentation not found.
### Prototype
```c
void aws_s3_request_metrics_get_start_timestamp_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_start_time);
```
"""
function aws_s3_request_metrics_get_start_timestamp_ns(metrics, out_start_time)
    ccall((:aws_s3_request_metrics_get_start_timestamp_ns, libaws_c_s3), Cvoid, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_start_time)
end

"""
    aws_s3_request_metrics_get_end_timestamp_ns(metrics, out_end_time)

Documentation not found.
### Prototype
```c
void aws_s3_request_metrics_get_end_timestamp_ns(const struct aws_s3_request_metrics *metrics, uint64_t *out_end_time);
```
"""
function aws_s3_request_metrics_get_end_timestamp_ns(metrics, out_end_time)
    ccall((:aws_s3_request_metrics_get_end_timestamp_ns, libaws_c_s3), Cvoid, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_end_time)
end

"""
    aws_s3_request_metrics_get_total_duration_ns(metrics, out_total_duration)

Documentation not found.
### Prototype
```c
void aws_s3_request_metrics_get_total_duration_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_total_duration);
```
"""
function aws_s3_request_metrics_get_total_duration_ns(metrics, out_total_duration)
    ccall((:aws_s3_request_metrics_get_total_duration_ns, libaws_c_s3), Cvoid, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_total_duration)
end

"""
    aws_s3_request_metrics_get_send_start_timestamp_ns(metrics, out_send_start_time)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_send_start_timestamp_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_send_start_time);
```
"""
function aws_s3_request_metrics_get_send_start_timestamp_ns(metrics, out_send_start_time)
    ccall((:aws_s3_request_metrics_get_send_start_timestamp_ns, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_send_start_time)
end

"""
    aws_s3_request_metrics_get_send_end_timestamp_ns(metrics, out_send_end_time)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_send_end_timestamp_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_send_end_time);
```
"""
function aws_s3_request_metrics_get_send_end_timestamp_ns(metrics, out_send_end_time)
    ccall((:aws_s3_request_metrics_get_send_end_timestamp_ns, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_send_end_time)
end

"""
    aws_s3_request_metrics_get_sending_duration_ns(metrics, out_sending_duration)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_sending_duration_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_sending_duration);
```
"""
function aws_s3_request_metrics_get_sending_duration_ns(metrics, out_sending_duration)
    ccall((:aws_s3_request_metrics_get_sending_duration_ns, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_sending_duration)
end

"""
    aws_s3_request_metrics_get_receive_start_timestamp_ns(metrics, out_receive_start_time)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_receive_start_timestamp_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_receive_start_time);
```
"""
function aws_s3_request_metrics_get_receive_start_timestamp_ns(metrics, out_receive_start_time)
    ccall((:aws_s3_request_metrics_get_receive_start_timestamp_ns, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_receive_start_time)
end

"""
    aws_s3_request_metrics_get_receive_end_timestamp_ns(metrics, out_receive_end_time)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_receive_end_timestamp_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_receive_end_time);
```
"""
function aws_s3_request_metrics_get_receive_end_timestamp_ns(metrics, out_receive_end_time)
    ccall((:aws_s3_request_metrics_get_receive_end_timestamp_ns, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_receive_end_time)
end

"""
    aws_s3_request_metrics_get_receiving_duration_ns(metrics, out_receiving_duration)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_receiving_duration_ns( const struct aws_s3_request_metrics *metrics, uint64_t *out_receiving_duration);
```
"""
function aws_s3_request_metrics_get_receiving_duration_ns(metrics, out_receiving_duration)
    ccall((:aws_s3_request_metrics_get_receiving_duration_ns, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{UInt64}), metrics, out_receiving_duration)
end

"""
    aws_s3_request_metrics_get_response_status_code(metrics, out_response_status)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_response_status_code( const struct aws_s3_request_metrics *metrics, int *out_response_status);
```
"""
function aws_s3_request_metrics_get_response_status_code(metrics, out_response_status)
    ccall((:aws_s3_request_metrics_get_response_status_code, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{Cint}), metrics, out_response_status)
end

"""
    aws_s3_request_metrics_get_response_headers(metrics, out_response_headers)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_response_headers( const struct aws_s3_request_metrics *metrics, struct aws_http_headers **out_response_headers);
```
"""
function aws_s3_request_metrics_get_response_headers(metrics, out_response_headers)
    ccall((:aws_s3_request_metrics_get_response_headers, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{Ptr{aws_http_headers}}), metrics, out_response_headers)
end

"""
    aws_s3_request_metrics_get_request_path_query(metrics, out_request_path_query)

Get the path and query of the request. If unavailable, AWS\\_ERROR\\_S3\\_METRIC\\_DATA\\_NOT\\_AVAILABLE will be raised. If available, out\\_request\\_path\\_query will be set to a string. Be warned this string's lifetime is tied to the metrics object.

### Prototype
```c
void aws_s3_request_metrics_get_request_path_query( const struct aws_s3_request_metrics *metrics, const struct aws_string **out_request_path_query);
```
"""
function aws_s3_request_metrics_get_request_path_query(metrics, out_request_path_query)
    ccall((:aws_s3_request_metrics_get_request_path_query, libaws_c_s3), Cvoid, (Ptr{aws_s3_request_metrics}, Ptr{Ptr{aws_string}}), metrics, out_request_path_query)
end

"""
    aws_s3_request_metrics_get_host_address(metrics, out_host_address)

Get the host\\_address of the request. If unavailable, AWS\\_ERROR\\_S3\\_METRIC\\_DATA\\_NOT\\_AVAILABLE will be raised. If available, out\\_host\\_address will be set to a string. Be warned this string's lifetime is tied to the metrics object.

### Prototype
```c
void aws_s3_request_metrics_get_host_address( const struct aws_s3_request_metrics *metrics, const struct aws_string **out_host_address);
```
"""
function aws_s3_request_metrics_get_host_address(metrics, out_host_address)
    ccall((:aws_s3_request_metrics_get_host_address, libaws_c_s3), Cvoid, (Ptr{aws_s3_request_metrics}, Ptr{Ptr{aws_string}}), metrics, out_host_address)
end

"""
    aws_s3_request_metrics_get_ip_address(metrics, out_ip_address)

Get the IP address of the request connected to. If unavailable, AWS\\_ERROR\\_S3\\_METRIC\\_DATA\\_NOT\\_AVAILABLE will be raised. If available, out\\_ip\\_address will be set to a string. Be warned this string's lifetime is tied to the metrics object.

### Prototype
```c
int aws_s3_request_metrics_get_ip_address( const struct aws_s3_request_metrics *metrics, const struct aws_string **out_ip_address);
```
"""
function aws_s3_request_metrics_get_ip_address(metrics, out_ip_address)
    ccall((:aws_s3_request_metrics_get_ip_address, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{Ptr{aws_string}}), metrics, out_ip_address)
end

"""
    aws_s3_request_metrics_get_connection_id(metrics, out_connection_id)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_connection_id(const struct aws_s3_request_metrics *metrics, size_t *out_connection_id);
```
"""
function aws_s3_request_metrics_get_connection_id(metrics, out_connection_id)
    ccall((:aws_s3_request_metrics_get_connection_id, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{Csize_t}), metrics, out_connection_id)
end

"""
    aws_s3_request_metrics_get_thread_id(metrics, out_thread_id)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_thread_id(const struct aws_s3_request_metrics *metrics, aws_thread_id_t *out_thread_id);
```
"""
function aws_s3_request_metrics_get_thread_id(metrics, out_thread_id)
    ccall((:aws_s3_request_metrics_get_thread_id, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{aws_thread_id_t}), metrics, out_thread_id)
end

"""
    aws_s3_request_metrics_get_request_stream_id(metrics, out_stream_id)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_request_stream_id(const struct aws_s3_request_metrics *metrics, uint32_t *out_stream_id);
```
"""
function aws_s3_request_metrics_get_request_stream_id(metrics, out_stream_id)
    ccall((:aws_s3_request_metrics_get_request_stream_id, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{UInt32}), metrics, out_stream_id)
end

"""
    aws_s3_request_metrics_get_operation_name(metrics, out_operation_name)

Get the S3 operation name of the request (e.g. "HeadObject"). If unavailable, AWS\\_ERROR\\_S3\\_METRIC\\_DATA\\_NOT\\_AVAILABLE will be raised. If available, out\\_operation\\_name will be set to a string. Be warned this string's lifetime is tied to the metrics object.

### Prototype
```c
int aws_s3_request_metrics_get_operation_name( const struct aws_s3_request_metrics *metrics, const struct aws_string **out_operation_name);
```
"""
function aws_s3_request_metrics_get_operation_name(metrics, out_operation_name)
    ccall((:aws_s3_request_metrics_get_operation_name, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics}, Ptr{Ptr{aws_string}}), metrics, out_operation_name)
end

"""
    aws_s3_request_metrics_get_request_type(metrics, out_request_type)

Documentation not found.
### Prototype
```c
void aws_s3_request_metrics_get_request_type( const struct aws_s3_request_metrics *metrics, enum aws_s3_request_type *out_request_type);
```
"""
function aws_s3_request_metrics_get_request_type(metrics, out_request_type)
    ccall((:aws_s3_request_metrics_get_request_type, libaws_c_s3), Cvoid, (Ptr{aws_s3_request_metrics}, Ptr{aws_s3_request_type}), metrics, out_request_type)
end

"""
    aws_s3_request_metrics_get_error_code(metrics)

Documentation not found.
### Prototype
```c
int aws_s3_request_metrics_get_error_code(const struct aws_s3_request_metrics *metrics);
```
"""
function aws_s3_request_metrics_get_error_code(metrics)
    ccall((:aws_s3_request_metrics_get_error_code, libaws_c_s3), Cint, (Ptr{aws_s3_request_metrics},), metrics)
end

"""
    aws_s3_endpoint_resolver_new(allocator)

Creates a new S3 endpoint resolver. Warning: Before using this header, you have to enable it by setting cmake config AWS\\_ENABLE\\_S3\\_ENDPOINT\\_RESOLVER=ON

### Prototype
```c
struct aws_endpoints_rule_engine *aws_s3_endpoint_resolver_new(struct aws_allocator *allocator);
```
"""
function aws_s3_endpoint_resolver_new(allocator)
    ccall((:aws_s3_endpoint_resolver_new, libaws_c_s3), Ptr{aws_endpoints_rule_engine}, (Ptr{aws_allocator},), allocator)
end

"""
    aws_credentials_properties_s3express

Documentation not found.
"""
struct aws_credentials_properties_s3express
    host::aws_byte_cursor
    region::aws_byte_cursor
end

"""
    aws_s3express_credentials_provider_vtable

Documentation not found.
"""
struct aws_s3express_credentials_provider_vtable
    get_credentials::Ptr{Cvoid}
    destroy::Ptr{Cvoid}
end

"""
    aws_s3express_credentials_provider

Documentation not found.
"""
struct aws_s3express_credentials_provider
    vtable::Ptr{aws_s3express_credentials_provider_vtable}
    allocator::Ptr{aws_allocator}
    shutdown_complete_callback::Ptr{aws_simple_completion_callback}
    shutdown_user_data::Ptr{Cvoid}
    impl::Ptr{Cvoid}
    ref_count::aws_ref_count
end

"""
    aws_s3express_credentials_provider_release(provider)

Documentation not found.
### Prototype
```c
struct aws_s3express_credentials_provider *aws_s3express_credentials_provider_release( struct aws_s3express_credentials_provider *provider);
```
"""
function aws_s3express_credentials_provider_release(provider)
    ccall((:aws_s3express_credentials_provider_release, libaws_c_s3), Ptr{aws_s3express_credentials_provider}, (Ptr{aws_s3express_credentials_provider},), provider)
end

"""
    aws_s3express_credentials_provider_init_base(provider, allocator, vtable, impl)

To initialize the provider with basic vtable and refcount. And hook up the refcount with vtable functions.

# Arguments
* `provider`:
* `allocator`:
* `vtable`:
* `impl`: Optional, the impl for the provider
# Returns
`AWS_S3_API`
### Prototype
```c
void aws_s3express_credentials_provider_init_base( struct aws_s3express_credentials_provider *provider, struct aws_allocator *allocator, struct aws_s3express_credentials_provider_vtable *vtable, void *impl);
```
"""
function aws_s3express_credentials_provider_init_base(provider, allocator, vtable, impl)
    ccall((:aws_s3express_credentials_provider_init_base, libaws_c_s3), Cvoid, (Ptr{aws_s3express_credentials_provider}, Ptr{aws_allocator}, Ptr{aws_s3express_credentials_provider_vtable}, Ptr{Cvoid}), provider, allocator, vtable, impl)
end

"""
    aws_s3express_credentials_provider_get_credentials(provider, original_credentials, properties, callback, user_data)

Async function for retrieving specific credentials based on properties.

callback will only be invoked if-and-only-if the return value was AWS\\_OP\\_SUCCESS.

# Arguments
* `provider`: [`aws_s3express_credentials_provider`](@ref) provider to source from
* `original_credentials`: The credentials used to derive the credentials for S3 Express.
* `properties`: Specific properties for credentials being fetched.
* `user_data`: user data to pass to the completion callback
### Prototype
```c
int aws_s3express_credentials_provider_get_credentials( struct aws_s3express_credentials_provider *provider, const struct aws_credentials *original_credentials, const struct aws_credentials_properties_s3express *properties, aws_on_get_credentials_callback_fn callback, void *user_data);
```
"""
function aws_s3express_credentials_provider_get_credentials(provider, original_credentials, properties, callback, user_data)
    ccall((:aws_s3express_credentials_provider_get_credentials, libaws_c_s3), Cint, (Ptr{aws_s3express_credentials_provider}, Ptr{aws_credentials}, Ptr{aws_credentials_properties_s3express}, aws_on_get_credentials_callback_fn, Ptr{Cvoid}), provider, original_credentials, properties, callback, user_data)
end

"""
Documentation not found.
"""
const AWS_C_S3_PACKAGE_ID = 14

