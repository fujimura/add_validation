module CreatePrimaryAddress
  def self.extended(base)
    base.add_validation :validate_address_is_assigned
  end

  def primary_address=(address)
    @primary_address = address
  end

  def save_with_primary_address
    self.class.transaction do
      save! and save_primary_address!
    end
  end

  private

  def validate_address_is_assigned
    unless address_is_assigned?
      self.errors.add :primary_address, "Primary address is not assgined"
    end
  end

  def address_is_assigned?
    @primary_address.present?
  end

  def save_primary_address!
    @primary_address.primary = true
    @primary_address.user_id = self.id
    @primary_address.save!
  end
end
