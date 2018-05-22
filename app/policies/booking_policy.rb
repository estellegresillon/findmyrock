class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
    true #Tous les users peuvent crée des bookings
  end

  def destroy?
    true
  end
end
