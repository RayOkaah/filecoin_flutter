import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

/// tests for Web3StorageHTTPAPIApi
void main() {
  // final instance = Web3StorageHTTPAPIApi();

  group('tests for Web3StorageHTTPAPIApi', () {
    // Retrieve a CAR
    //
    // Retrieve an [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) packaged in a CAR file by using `/car/{cid}`, supplying the CID of the data you are interested in.
    //
    //Future<MultipartFile> getCarCid(String cid) async
    test('test getCarCid', () async {
      // TODO
    });

    // Retrieve information about an upload
    //
    // Retrieve metadata about a specific file by using `/status/{cid}`, supplying the CID of the file you are interested in. This metadata includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
    //
    //Future<Status> getStatusCid(String cid) async
    test('test getStatusCid', () async {
      // TODO
    });

    // Returns a single upload
    //
    // Retrieve the upload metadata of as single upload.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
    //
    //Future<List<Status>> getUserUpload() async
    test('test getUserUpload', () async {
      // TODO
    });

    // List previous uploads
    //
    // Lists all previous uploads for the account ordered by creation date, newest first. These results can be paginated by specifying `before` and `size` parameters in the query string, using the creation date associated with the oldest upload returned in each batch as the value of `before` in subsequent calls.  Note this endpoint returns all uploads for the account not just the API key in use.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
    //
    //Future<List<Status>> getUserUploads({ DateTime before, String sortBy, String sortOrder, int page, int size }) async
    test('test getUserUploads', () async {
      // TODO
    });

    // Retrieve HTTP headers regarding a CAR
    //
    // This method is useful for doing a dry run of a call to `/car/{cid}`. Because it only returns HTTP header information, it is far more lightweight and can be used to get only the metadata about the given CAR file without retrieving a whole payload in the body of the HTTP response.
    //
    //Future headCarCid(String cid) async
    test('test headCarCid', () async {
      // TODO
    });

    // Upload a CAR
    //
    // Upload a [CAR](https://ipld.io/specs/transport/car/) (Content Addressable aRchive) file and store the [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) it contains.  See the [Working with Content Archives guide](https://web3.storage/docs/how-tos/work-with-car-files) for details on creating CARs and splitting them into chunks for upload using the [carbites JavaScript API](https://github.com/nftstorage/carbites), [command line tool](https://github.com/nftstorage/carbites-cli/), or [Go library](https://github.com/alanshaw/go-carbites).  Requests to this endpoint have a maximum payload size of 100MB but partial DAGs are supported, so multiple CAR files with the same root but with different sub-trees can be sent. This enables uploading of files that are bigger than the maximum payload size.  Note that only one CAR can be uploaded at a time, and only CAR files are accepted. This is in contrast to [`/upload`](#operation/post-upload), which can upload multiple files at once and accepts both CAR files and files from the client.  You can also provide a name for the file using the header `X-NAME`, but be sure to encode the filename first. For example `LICENSE–MIT` should be sent as `LICENSE%E2%80%93MIT`.
    //
    //Future<UploadResponse> postCar(MultipartFile body) async
    test('test postCar', () async {
      // TODO
    });

    // Upload and store one or more files
    //
    // Store files using web3.storage. You can upload either a single file or multiple files.  Send the POST request with one of the following: - a single file, with a single blob/file object as the body - multiple files, as `FormData` with `Content-Disposition` headers for each part to specify filenames and the request header `Content-Type: multipart/form-data`  Requests to this endpoint have a maximum payload size of 100MB. To upload larger files, see the documentation for the `/car` endpoint.  You can also provide a name for the file using the header `X-NAME`, but be sure to encode the filename first. For example `LICENSE–MIT` should be sent as `LICENSE%E2%80%93MIT`.
    //
    //Future<UploadResponse> postUpload({ List<MultipartFile> file }) async
    test('test postUpload', () async {
      // TODO
    });
  });
}
