class User < ApplicationRecord

  # Validate Before Saving Functions #
  before_save { email.downcase! }

  # Validate User First Name #
  validates :fname, presence: true, length: { maximum: 50 }

  # Validate User Last Name #
  validates :lname, presence: true, length: { maximum: 50 }

  # Validate User Username #
  validates :uname, presence: true, length: { maximum: 50 }

  # Validate User Telephone #
  validates :tel, presence: true, length: { maximum: 14 }, allow_nil: true

  # Validate User Biography #
  validates :bio, presence: true, length: { maximum: 255 }, allow_nil: true

  # Validate User Job Title #
  validates :job_title, presence: true, length: { maximum: 255 }, allow_nil: true

  # Validate User Job Company #
  validates :job_comp, presence: true, length: { maximum: 155 }, allow_nil: true

  # Validate User Job Description #
  validates :job_bio, presence: true, length: { maximum: 255 }, allow_nil: true

  # Validate User College Degree #
  validates :clg_degree, presence: true, length: { maximum: 255 }, allow_nil: true

  # Validate User College Name #
  validates :clg_name, presence: true, length: { maximum: 255 }, allow_nil: true

  # Validate Email REGEX #
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # Validate User Email #
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  # Secure User Password #
  has_secure_password

  # Validate User Password #
  validates :password, presence: true, length: { minimum: 6 }
end
