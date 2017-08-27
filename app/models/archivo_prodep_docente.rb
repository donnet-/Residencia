class ArchivoProdepDocente < ActiveRecord::Base
  belongs_to :docente
    mount_uploader :archivoPdf, PdfUploader
    validate :image_size_valid, :if => "archivoPdf?"
    def image_size_valid
        if archivoPdf.size > 1.megabytes
            errors.add(:archivoPdf, "El PDf debe pesar menos de 1MB")
        end
    end
end
