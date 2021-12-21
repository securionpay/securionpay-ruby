# frozen_string_literal: true

module SecurionPay
  class FileUploads
    extend TransactionBase

    def self.upload(file, params)
      body = { file: file }.merge(params)
      communicator.post("#{Configuration.uploads_url}/files", body: body)
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.uploads_url}/files", query: params)
    end

    def self.retrieve(file_upload_id)
      communicator.get("#{Configuration.uploads_url}/files/#{file_upload_id}")
    end
  end
end
