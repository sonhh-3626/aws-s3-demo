# config/initializers/active_storage_prefixer.rb

Rails.application.config.to_prepare do
  # Code bên trong khối 'to_prepare' sẽ chạy sau khi Rails đã tải xong các thư viện.
  # Lúc này, hằng số ActiveStorage::Blob đã tồn tại.
  ActiveStorage::Blob.class_eval do
    before_create :generate_key_with_prefix

    private

    def generate_key_with_prefix
      self.key = File.join("images", self.key)
    end
  end
end
