class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    record.user == user
  end

  def show?
    true
  end

  def payment_update?
    true
  end

  def create?
    true
  end

  def payment?
    true
  end
end
